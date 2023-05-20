import 'package:delivery/src/controllers/clientControllers/client_address_create_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/client/list/tabs/profile_tab/View/client/profile_tab_client.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientAddressCreatePage extends StatefulWidget {
  const ClientAddressCreatePage({super.key});

  @override
  State<ClientAddressCreatePage> createState() => _ClientAddressCreatePageState();
}

class _ClientAddressCreatePageState extends State<ClientAddressCreatePage> {

  final ClientAddressCreatecontroller _con = ClientAddressCreatecontroller();


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.white,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ProfileTabClient(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.red,
                        backgroundImage: Image.network(
                          _con.user?.image ?? 'assets/images/user.png',
                          errorBuilder: (_, __, ___) {
                            return Image.asset('assets/images/user.png');
                          },
                        ).image,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      alignment: Alignment.center,
                    child: headerText(text: 'Agregar Dirección'),
                  )
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap:(){
                       Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 10),
                    child: Stack(
                      children: const <Widget>[
                         Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                        //
                      ],
                    ),
                  ),
                ),
              ]),
              
        ),
            bottomNavigationBar:   SizedBox( 
               height: screenHeight.getScreenHeight(
                context: context, multiplier: 0.15),
              
           
            child: Column(
              children: [
               GestureDetector(
            onTap: _con.createAddress,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              child: Container(
                height: 55,
                width: screenHeight.getScreenHeight(
                    context: context, multiplier: 8),
                decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child:const  Center(
                  child: Text(
                    'Agregar Dirección',
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
            ),
        
          
            ),
        body:Column(
          children:[ 
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 3),
            child: headerText(text: 'Completa los campos', fontSize: 18)),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 31),
              child: TextField(
                controller: _con.addressController,
                decoration: InputDecoration(
                  labelText: 'Direccion',
                  suffixIcon: Icon(
                    Icons.location_on,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 31),
              child: TextField(
                controller: _con.neighborhoodController,
                decoration: InputDecoration(
                  labelText: 'Barrio',
                  suffixIcon: Icon(
                    Icons.location_city,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 31),
              child: TextField(
                controller: _con.refPointController,
                onTap: _con.openMap,
                autofocus: false,
                focusNode: AlwaysDisableFocusNode(),
                decoration: InputDecoration(
                  labelText: 'Punto de referencia',
                  suffixIcon: Icon(
                    Icons.map,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
            ),



         ]
        )
        
        );

              
  }
  void refresh(){
    setState(() {
      
    });
  }
}


class AlwaysDisableFocusNode extends FocusNode{
  @override
  bool get hasFocus => false;
}