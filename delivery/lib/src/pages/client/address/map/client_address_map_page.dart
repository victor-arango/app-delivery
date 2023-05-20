import 'package:delivery/src/controllers/clientControllers/client_address_map_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/client/list/tabs/profile_tab/View/client/profile_tab_client.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class ClientAddressMapPage extends StatefulWidget {
  const ClientAddressMapPage({super.key});

  @override
  State<ClientAddressMapPage> createState() => _ClientAddressMapPageState();
}

class _ClientAddressMapPageState extends State<ClientAddressMapPage> {
  final ClientAddressMapcontroller _con = ClientAddressMapcontroller();

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
                        // backgroundImage: Image.network(
                        //   _con.user?.image ?? 'assets/images/user.png',
                        //   errorBuilder: (_, __, ___) {
                        //     return Image.asset('assets/images/user.png');
                        //   },
                        // ).image,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      alignment: Alignment.center,
                      child: headerText(text: 'Selecciona tu ubicación'),
                    )
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 10),
                    child: Stack(
                      children: const <Widget>[
                        Icon(
                          Icons.add,
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
        // bottomNavigationBar: SizedBox(
        //     height: screenHeight.getScreenHeight(
        //         context: context, multiplier: 0.15),
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 20, left: 30, right: 40),
        //       child: Column(
        //         children: [
        //           GestureDetector(
        //             onTap: () {},
        //             child: Padding(
        //               padding: const EdgeInsets.only(
        //                   left: 20, right: 20, top: 10, bottom: 30),
        //               child: Container(
        //                 height: 55,
        //                 width: screenHeight.getScreenHeight(
        //                     context: context, multiplier: 8),
        //                 decoration: BoxDecoration(
        //                     color: MyColors.primaryColor,
        //                     borderRadius: BorderRadius.circular(15)),
        //                 child: const Center(
        //                   child: Text(
        //                     'Pagar',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     )),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _con.initialPosition,
              onMapCreated: _con.onMapCreated,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              onCameraMove: (position){
                _con.initialPosition = position;
              },
              onCameraIdle: () async{
                await _con.setLocationDraggableInfo();
              },
            ),
            Container(
              alignment: Alignment.center,
              child: _iconMyLocation(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
    color: Colors.grey[800],
    borderRadius: BorderRadius.circular(20),
  ),
  
    child: Text(
      _con.addressName ?? ''
      'Calle falsa, Carrera falsa',
    style: TextStyle(
      color: MyColors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold

    ),),
  ),
            ),Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
              onTap:_con.selectRefPoint,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                child: Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 70),
                  width: screenHeight.getScreenHeight(
                      context: context, multiplier: 8),
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child:const  Center(
                    child: Text(
                      'Seleccionar ubicación ',
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
            ),
           
          ],
        ));
  }



  void refresh() {
    setState(() {});
  }
}

Widget _cardAddress(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
    color: Colors.grey[800],
    borderRadius: BorderRadius.circular(20),
  ),
  
    child: Text(
      'Calle falsa, Carrera falsa',
    style: TextStyle(
      color: MyColors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold

    ),),
  );
}


//Icono marca posicion 
Widget _iconMyLocation(){
  return  Lottie.asset('assets/images/location.json', 
  height: 90,
  width: 90
  );
}