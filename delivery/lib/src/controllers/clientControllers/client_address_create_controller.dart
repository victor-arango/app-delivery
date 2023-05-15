// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/features/presentations/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/models/address/address.dart';

import 'package:delivery/src/models/response/response_api.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/pages/client/address/map/client_address_map_page.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../provider/address_provider.dart';

class ClientAddressCreatecontroller{
  BuildContext? context;
  Function? refresh;
  User? user;

   final SharedPref _sharedPref = SharedPref();

   TextEditingController refPointController = TextEditingController();
   TextEditingController addressController = TextEditingController();
   TextEditingController neighborhoodController = TextEditingController();




   Map<String, dynamic>? refPoint; 

   final AddressProvider _addressProvider = AddressProvider();


  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    
    this.refresh = refresh;
    user =User.fromJson(await _sharedPref.read('user'));
    _addressProvider.init(context, sessionUser: user);
  


      refresh();

  }

    void createAddress()async{
      String addressName = addressController.text;
      String neighborhood = neighborhoodController.text;
      double lat =refPoint!['lat']?? 0.0;
      double lng =refPoint!['lng'] ?? 0.0;

      if(addressName.isEmpty || neighborhood.isEmpty || lat == 0.0 || lng == 0.0 ){
          MySnackbar.show(
          context: context,
          title: 'Alerta',
          contentType: ContentType.warning,
          text: 'Todos los campos son obligatorios');
      return;
      }

      Address address = Address(
        idUser: user!.id,
        address: addressName,
        neighborhood: neighborhood,
        lat: lat,
        lng: lng,

      );

  

      ResponseApi? responseApi = await _addressProvider.create(address);





        if((responseApi!.success) == true){

        address.id == responseApi.data;
         _sharedPref.save('address', address);
        Fluttertoast.showToast(msg: responseApi.message!);
        Navigator.pop(context!, true);

      }

    }



    // Abre el mapa 
  
  void openMap()async{
    refPoint = await showMaterialModalBottomSheet(
      context: context!, 
      isDismissible: false,
      enableDrag: false,
      builder: (context) =>const ClientAddressMapPage()
      );

      if(refPoint != null){
        refPointController.text = refPoint!['address'];
        refresh!();
      }
  }
  

} 