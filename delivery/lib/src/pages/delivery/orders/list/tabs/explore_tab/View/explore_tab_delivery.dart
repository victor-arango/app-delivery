

import 'package:delivery/src/controllers/deliveryControllers/delivery_profile_controller.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/features/presentations/custom-widgets/no_data_widget/no_data_widget.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExploreTabDelivery extends StatefulWidget {
  const ExploreTabDelivery({super.key});

  @override
  State<ExploreTabDelivery> createState() => _ExploreTabDeliveryState();
}

class _ExploreTabDeliveryState extends State<ExploreTabDelivery> {
   final DeliveryProfileController _con = DeliveryProfileController();
  

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
        return DefaultTabController(length: _con.status.length,
         child:

         Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => const ProfileTabClient(),
                      //   ),
                      // );
                    },
                    child: 
                    CircleAvatar(
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
                
                  
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => const MyOrderTabClient(),
                      //   ),
                      // );
                    },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 17.0, horizontal: 10),
                  child: Stack(
                    children: <Widget>[
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                      Positioned(
                        top: 5,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(0.5),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey[400],
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: MyColors.primaryColor,
                    width: 2.0, // Ancho de la línea inferior
                  ),
                ),
              ),
              labelColor: Colors.black,
              isScrollable: true,
              tabs: List<Widget>.generate(_con.status.length, (index) {
                return Tab(
                  child: Text(_con.status[index] ),
                );
              }),
            ),
          ),
        ),
        body:
        TabBarView(
          children: _con.status.map((String status) {
            // return CardOrder(con: _con);           
            return FutureBuilder(
              future: _con.getOrders(status),
              builder: (context, AsyncSnapshot<List<Order>> snapshot){
               

                if(snapshot.hasData){
                  if((snapshot.data?.length)! > 0){
                    return ListView.builder(
                padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder:(_, index){
                  return CardOrder(con: _con, order: snapshot.data![index],);
                }
                
                );

                  }else{
                    return NoDataWidget(text: 'lo sentimos, no encontramos ordenes pendientes.\n ');
                  }
                }else{
                    return NoDataWidget(text: 'lo sentimos, no encontramos ordenes pendientes.\n ');

                }
              
            }
            
            );
          }).toList(),
        ),
         )
    );



  }
       void refresh() {
    setState(() {});
  }

}


class CardOrder extends StatelessWidget {
     const CardOrder({super.key, 
    required DeliveryProfileController con, 
    required this.order,
    
  }) : _con = con;
  final Order order;
  final DeliveryProfileController _con;


 @override
  Widget build(BuildContext context) {
  
  return GestureDetector(
    onTap: (){
      _con.openBottomSheet(order);
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
               height: screenHeight.getScreenHeight(
                      context: context, multiplier: 0.22),
                      child: Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Positioned(
                         
                            
                            child: Container(
                              height: 30,
                              width: screenHeight.getScreenHeight(
                      context: context, multiplier: 1),
                              decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius:const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: headerText(text: 'Orden # ${order.id}', fontSize: 16, color: MyColors.white, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  child: headerText(text: 'Pedido: 2023-05-20',fontWeight: FontWeight.w500),
                                ),
                                Container(
                                   margin: const EdgeInsets.symmetric(vertical: 2),
                                  child: headerText(text: 'Cliente: ${order.client?.name ?? ''} ${order.client?.lastname ?? ''}',fontWeight: FontWeight.w500),
                                ),
                                Container(
                                   margin: const EdgeInsets.symmetric(vertical: 5),
                                  child: headerText(text: 'Dirección Domicilio: ${order.address?.address ?? ''}',fontWeight: FontWeight.w500, maxLines: 2),
                                )
                              ],
                            ),
                          ),
                          ],
                          
                        ),
                      ),
    ),
  );
}

}