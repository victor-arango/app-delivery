// ignore_for_file: avoid_unnecessary_containers, unused_import, unused_field, unused_element

import 'package:delivery/src/controllers/clientControllers/client_orders_detail_controller.dart';
import 'package:delivery/src/controllers/deliveryControllers/delivery_orders_detail_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/custom-widgets/no_data_widget/no_data_widget.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';

import 'package:delivery/src/utils/my_colors.dart';
import 'package:delivery/src/utils/relative_time_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class ClientOrdersDetailPage extends StatefulWidget {
  Order order;
  ClientOrdersDetailPage({super.key, required this.order});

  @override
  State<ClientOrdersDetailPage> createState() =>
      _ClientOrdersDetailPageState();
}

class _ClientOrdersDetailPageState
    extends State<ClientOrdersDetailPage> {
  final ClientOrderDetailController _con =
      ClientOrderDetailController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh, widget.order);
    });
  }
    String? _selectedDelivery;

  void _onDeliverySelected(String? value) {
    setState(() {
      _selectedDelivery = value;
      _con.idDelivery = value!;
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (_) => const ProfileTabClient(),
                        //   ),
                        // );
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
                      child: headerText(text: 'Orden #${_con.order?.id}' ),
                    )
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 10),
                    child: Stack(
                      children: const <Widget>[
                        Icon(
                          Icons.close,
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
        bottomNavigationBar: _con.order != null &&
                _con.order!.products != null &&
                _con.order!.products!.isNotEmpty
            ? SizedBox(
                height: screenHeight.getScreenHeight(
                    context: context, multiplier: 0.50),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
                  child: Column(
                    children: [
                      SizedBox(
                          width: screenHeight.getScreenHeight(
                              context: context, multiplier: 1),
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                
                          
                              _textData('Repartidor:',
                                  '${_con.order?.delivery?.name ?? 'No Asignado'} ${_con.order?.delivery?.lastname ?? ''}'),
                              _textData('Dirección:',
                                  '${_con.order?.address?.address ?? ''} '),
                              _textData('Fecha Pedido:',
                                  '${RelativeTimeUtil.getRelativeTime(_con.order?.timestamp ?? 0)} '),
                            ],
                          )),
                      Container(
                          width: screenHeight.getScreenHeight(
                              context: context, multiplier: 1),
                          height: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 209, 209, 209),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.negro,
                                  ),
                                ),
                                Text(
                                  '\$ ${_con.total}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.negro,
                                  ),
                                ),
                              ], 
                            ),
                          )),

                      const Spacer(),

                      //button order
                      _con.order!.status == 'EN CAMINO'
        ?
                      GestureDetector(
                        onTap: _con.updateOrder,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 30),
                          child: Container(
                            height: 40,
                            width: screenHeight.getScreenHeight(
                                context: context, multiplier: 8),
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const  Center(
                              child:  Text(
                                 'Seguir Entrega ',
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) :Container(),
                    ],
                  ),
                ))
            : SizedBox(
                height: screenHeight.getScreenHeight(
                    context: context, multiplier: 0.30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 40),
                  child: Column(
                    children: [
                      Container(
                          width: screenHeight.getScreenHeight(
                              context: context, multiplier: 1),
                          height: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 209, 209, 209),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.negro,
                                ),
                              ),
                              Text(
                                '\$ ${_con.total}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.negro,
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                      
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 30),
                          child: Container(
                            height: 55,
                            width: screenHeight.getScreenHeight(
                                context: context, multiplier: 8),
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'Despachar Orden',
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
                )),
        body: _con.order != null &&
                _con.order!.products != null &&
                _con.order!.products!.isNotEmpty
            ? ListView(
                children: _con.order!.products!.map((Product product) {
                  return WidgetProductList(con: _con, product: product);
                }).toList(),
              )
            : EmptyWidget(
                text: 'No tienes productos agregados',
              ));
  }

  void refresh() {
    setState(() {});
  }
}




class WidgetProductList extends StatelessWidget {
  const WidgetProductList({
    super.key,
    required ClientOrderDetailController con,
    required this.product,
  }) : _con = con;
  final Product product;
  final ClientOrderDetailController _con;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 14.0, mainAxisExtent: 110),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.cover,
                              image: product.image1 != null
                                  ? NetworkImage(product.image1!)
                                  : const AssetImage(
                                          'assets/images/no-image.png')
                                      as ImageProvider,
                            )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text('Cantidad: ${product.quantify ?? 0}'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _textData(String title, String content) {
   return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: MyColors.divider))),
    child: ListTile(
      
      title: headerText(
          text: title,
         
        
         ),
      trailing: headerText(text: content, textAlign: TextAlign.right, fontWeight: FontWeight.w400)
           
    ),
  );
 
}





