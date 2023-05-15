// ignore_for_file: unnecessary_null_comparison, prefer_void_to_null, unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/features/presentations/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/orders_provider.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;

import 'package:url_launcher/url_launcher_string.dart';

class DeliveryOrdersMapcontroller {
  BuildContext? context;
  Function? refresh;
  Position? _position;
  StreamSubscription? _positionStream;

  String? addressName;
  LatLng? addressLatLng;

  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(6.313350, -75.582922), zoom: 14);

  final Completer<GoogleMapController> _mapcontroller = Completer();

 BitmapDescriptor? deliveryMarker;
 BitmapDescriptor? homeMarker;
 Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

 Order? order;
  
Set<Polyline> polylines ={};
List<LatLng> points =[];


final OrdersProvider _ordersProvider = OrdersProvider();
User? user;
final SharedPref _sharedPref = SharedPref();


  double? _distanceBetween;

  Future<void> init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, dynamic>) {
      order = Order.fromJson(arguments);
    }
    deliveryMarker = await createMarkFromAssets('assets/images/food-delivery.png');
    homeMarker = await createMarkFromAssets('assets/images/home2.png');
    
      user = User.fromJson(await _sharedPref.read('user'));
    _ordersProvider.init(context, sessionUser: user);
    print('ORDEN: ${order?.toJson()}');
    checkGps();
  
  }


  void isCloseToDeliveryPosition(){
    _distanceBetween = Geolocator.distanceBetween(
      _position!.latitude, 
      _position!.longitude, 
      6.301159,
      -75.571921
      // order!.address!.lat!.toDouble(), 
      // order!.address!.lng!.toDouble(), 
      );
      
  
  }

  void updateTodelivery()async{

    if(_distanceBetween! <= 200){
      ResponseApi? responseApi = await _ordersProvider.updateTodelivery(order!);
      if (responseApi!.success == true){
        Navigator.pushNamedAndRemoveUntil(context!, 'delivery/order/list', (route) => false);
        MySnackbarResponseApi.show(
          context: context,
          title: responseApi.success,
          contentType: responseApi.success,
          text: responseApi.message);
      } 
    }else{
      MySnackbar.show(context: context, contentType: ContentType.warning,text: 'Debes estar mas cerca del lugar de entrega', title: 'Alerta' );
    }

  }


  Future<void> setPolylines(LatLng from,LatLng  to )async{
    PointLatLng pointFrom = PointLatLng(from.latitude, from.longitude);
    PointLatLng pointTo = PointLatLng(to.latitude, to.longitude);
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
      Environment.API_KEY_MAPS, 
      pointFrom, 
      pointTo      
      );

      for(PointLatLng point in result.points){
        points.add(LatLng(point.latitude, point.longitude));

      }

    Polyline polyline = Polyline(
      polylineId: const PolylineId('poly'),
      color: MyColors.primaryColor,
      points: points,
      width: 5
      );

    polylines.add(polyline);

    refresh!();
    
  }

  void addMarker(
    String markerId, 
    double lat, 
    double lng, 
    String title, 
    String content, 
    BitmapDescriptor iconMarker){
      MarkerId id = MarkerId(markerId);
      Marker marker = Marker(
        markerId: id,
        icon: iconMarker,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: title, snippet: content)
        );

    markers[id] = marker;

    refresh!();

  }



  void selectRefPoint(){
    Map<String, dynamic> data ={
      'address': addressName,
      'lat'    :addressLatLng!.latitude,
      'lng'    :addressLatLng!.longitude,
    };

    Navigator.pop(context!, data);
  }


  Future<BitmapDescriptor> createMarkFromAssets(String path) async {
  ImageConfiguration configuration = const ImageConfiguration();
  BitmapDescriptor descriptor = await BitmapDescriptor.fromAssetImage(configuration, path);
  return descriptor;
}






  Future<Null> setLocationDraggableInfo()async{
    if(initialPosition != null ){
      double lat = initialPosition.target.latitude;
      double lng = initialPosition.target.longitude;

      List<Placemark> address = await placemarkFromCoordinates(lat, lng);

      if(address != null){
        if(address.isNotEmpty){
          String? direction = address[0].thoroughfare;
          String? street = address[0].subThoroughfare;
          String? city = address[0].locality;
          String? departament = address[0].administrativeArea;
          String? country = address[0].country;
          addressName = '$direction #$street, $city, $departament';
          addressLatLng =  LatLng(lat, lng);

          refresh!();
        }
      }
    }

  }


  //Renderiza el mapa

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle('[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]');
    _mapcontroller.complete(controller);
  }

  void dispose(){
    _positionStream?.cancel();
  }

  //Obtiene geolozaciozaion google maps

 void updateLocation() async {
  try {
    await _determinePosition(); // Obtiene posicion actual y permisos.
    _position = await Geolocator.getLastKnownPosition(); // Almacena latitud y longitud
    animateCameratoPosition(_position!.latitude, _position!.longitude);
    addMarker('delivery', _position!.latitude, _position!.longitude, 'Posición Actual', '', deliveryMarker!);
    addMarker('home', 6.301159, -75.571921, 'Posición Entrega', '', homeMarker!);

    LatLng from = LatLng(_position!.latitude, _position!.longitude);
    LatLng to = const LatLng(6.301159, -75.571921);
    setPolylines(from, to);

    Geolocator.getPositionStream(
      locationSettings:const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1
      )      
    ).listen((Position posicion) {
      _position = posicion;

      addMarker('delivery', _position!.latitude, _position!.longitude, 'Posición Actual', '', deliveryMarker!);

      animateCameratoPosition(_position!.latitude, _position!.longitude);
      isCloseToDeliveryPosition();
      refresh!();
    });

  } catch (e) {
    print('Error: $e');
  }
}


  void call(){
    launchUrlString("tel://${order?.client?.phone}");
  }

    //valida que si se hayan otrogado los permisos 
  Future checkGps()async{
    bool isLocationEnable = await Geolocator.isLocationServiceEnabled();

    if(isLocationEnable){
      updateLocation();
    }
    else{
      bool locationGps = await location.Location().requestService();
      if (locationGps){
        updateLocation();
      }
    }
  }

    //Animacion de camara en google maps 
  Future animateCameratoPosition(double lat, double lng)async{
    GoogleMapController controller = await _mapcontroller.future;
    if ( controller != null){
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng),
        zoom: 18,
        bearing: 0
        )
      ));
    }


  }



  //Determina la ubcacion del usuario
  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
  
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

 
  return await Geolocator.getCurrentPosition();
}

}
