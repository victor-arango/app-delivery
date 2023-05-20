import 'package:delivery/src/controllers/deliveryControllers/delivery_orders_map_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DeliveryOrdersMapPage extends StatefulWidget {
  const DeliveryOrdersMapPage({super.key});

  @override
  State<DeliveryOrdersMapPage> createState() => _DeliveryOrdersMapPageState();
}

class _DeliveryOrdersMapPageState extends State<DeliveryOrdersMapPage> {
  final DeliveryOrdersMapcontroller _con = DeliveryOrdersMapcontroller();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  void dispose() {
   
    super.dispose();
    _con.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: Stack(
          children: [
            SizedBox(
              height:  screenHeight.getScreenHeight(
                      context: context, multiplier: 0.6),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _con.initialPosition,
                onMapCreated: _con.onMapCreated,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                markers: Set<Marker>.of(_con.markers.values),
                polylines: _con.polylines,
              ),
            ),


           
            SafeArea(
              child: Column(
                children: [
                  buttonCenterPosition(),
                  const Spacer(),
                  // _cardOrderInfo(context)
                  _cardOrderInfo(con: _con)
                ],
                
              ),
            )
           
          ],
        ));
  }



  void refresh() {
    if(!mounted) return;
    setState(() {});
  }
}



Widget buttonCenterPosition(){
  return GestureDetector(
    onTap: (){},

    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.bottomRight,
      child: Card(
        shape: const CircleBorder(
        ),
        color: MyColors.white,
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.location_searching,
            color: MyColors.gris,
            size: 20,
          ),
        ),
      ),
    ),
  );
}



class _cardOrderInfo extends StatelessWidget {
  const _cardOrderInfo({
    required DeliveryOrdersMapcontroller con,
  }) : _con = con;

  final DeliveryOrdersMapcontroller _con;

  @override
  Widget build(BuildContext context) {
    return Container(
    height:  screenHeight.getScreenHeight(
                      context: context, multiplier: 0.40),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      color: MyColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const  Offset(0,3)
        )
      ]
    ),
    child: Column(
      children: [
        // _listtileAddress(_con.order!.address!.neighborhood ?? '', 'Barrio', Icons.my_location),
        _listtileAddress(_con.order?.address?.neighborhood ?? '', 'Barrio', Icons.my_location),

        _listtileAddress(_con.order?.address?.address ?? '', 'Dirección' , Icons.location_on),
        Divider(color: MyColors.divider, endIndent: 30, indent: 30,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Row(
            children: [
              InkWell(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      backgroundImage: Image.network(
                        _con.order?.client?.image ?? 'assets/images/user.png',
                        errorBuilder: (_, __, ___) {
                          return Image.asset('assets/images/user.png');
                        },
                      ).image,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: headerText(text: '${_con.order?.client?.name! ?? ''} ${_con.order?.client?.lastname! ?? ''}', maxLines: 1),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:const  BorderRadius.all(Radius.circular(15)),
                      color: MyColors.gris
                    ),
                    child: IconButton(
                      onPressed: _con.call,
                      icon: Icon(Icons.phone,color: MyColors.negro,),
                    ),
                  ),
            ],
          ),
        ),
       
         Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
              onTap:_con.updateTodelivery,

                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 50),
                  width: screenHeight.getScreenHeight(
                      context: context, multiplier: 8),
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child:const  Center(
                    child: Text(
                      'Entregar Producto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              
                      ),
            ),
      ],

    )
  );
  }
}


Widget _listtileAddress(String title, String subtitle, IconData iconData){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: ListTile(
      title: headerText(text: title),
      subtitle: Text(subtitle),
      trailing: Icon(iconData),
    ),
  );
}