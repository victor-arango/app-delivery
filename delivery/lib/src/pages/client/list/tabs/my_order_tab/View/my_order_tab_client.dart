// ignore_for_file: avoid_unnecessary_containers

import 'package:delivery/src/controllers/clientControllers/client_orders_create_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Buttons/rounded_button.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/custom-widgets/no_data_widget/no_data_widget.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';

import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../profile_tab/View/client/profile_tab_client.dart';
import 'components/empty_order_view.dart';

class MyOrderTabClient extends StatefulWidget {
  const MyOrderTabClient({super.key});

  @override
  State<MyOrderTabClient> createState() => _MyOrderTabClientState();
}

class _MyOrderTabClientState extends State<MyOrderTabClient> {
  ClientOrderCreateController _con = ClientOrderCreateController();
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
                    child: headerText(text: 'Mi orden'),
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
            bottomNavigationBar: _con.selectedProducts.isNotEmpty ?
              SizedBox( 
               height: screenHeight.getScreenHeight(
                context: context, multiplier: 0.30),
              
            child:    
            Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 40),
            child: Column(
              children: [
               
                Container(
                  width: screenHeight.getScreenHeight(
                context: context, multiplier: 1),
                  height: 50,
                  decoration:const  BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                    ),
                  ),
                  child: 
                  Row(
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
                  )
                  
                ),
                const Spacer(),
                
                    //button order
          GestureDetector(
            onTap: _con.goToAddress,
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
                    'Continuar!',
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
        
          )
            )
          : SizedBox( 
               height: screenHeight.getScreenHeight(
                context: context, multiplier: 0.30),
              
            child:    
            Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 40),
            child: Column(
              children: [
               
                Container(
                  width: screenHeight.getScreenHeight(
                context: context, multiplier: 1),
                  height: 50,
                  decoration:const  BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                    ),
                  ),
                  child: 
                  Row(
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
                  )
                  
                ),
                const Spacer(),
                
                    //button order
          GestureDetector(
            onTap: _con.goToAddress,
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
                    'Continuar',
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
        
          )
            ),
        body: _con.selectedProducts.isNotEmpty
            ? ListView(
                children: _con.selectedProducts.map((Product product) {
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
     const WidgetProductList({super.key, 
    required ClientOrderCreateController con, required this.product,
    
  }) : _con = con;
  final Product product;
  final ClientOrderCreateController _con;


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
                                : const AssetImage('assets/images/no-image.png')
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
                            width: 110,
                            height: 35,
                            decoration: BoxDecoration(
                                color: MyColors.bkClient,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                        _con.removeItem(product);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 7),
                                       child:  const Text('-',
                                      style:  TextStyle(fontSize: 20),),
                                    ),
                                  ),
                                  Container(
                                    child: Text('${product.quantify ?? 0}'),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _con.addItem(product);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 7),
                                      child: const Text('+',
                                      style: TextStyle(fontSize: 20),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${(product.price)! * product.quantify!}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: MyColors.negro,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _con.deleteItem(product);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: MyColors.primaryColor,
                          ))
                    ],
                  ),
                ),
                
              ],
              
            ),
          ),
          
        );
      },
    ),
  );
}
}

Widget _orders(BuildContext context) {
  return Column(
    children: [_cardOrder(context)],
  );
}

Widget _cardOrder(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        Row(
          children: [
            _cardOrderTopContent(context),
          ],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context),
          ],
        ),
        _moreContent(context),
      ],
    ),
  );
}

Widget _cardOrderTopContent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7.0, right: 20.0),
          child: headerText(
              text: 'Comidas rapidas Rokkuto',
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: MyColors.gris,
                size: 16.0,
              ),
              headerText(
                  text: 'Barrio Santander',
                  color: MyColors.gris,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0),
              Container(
                  margin: const EdgeInsets.only(left: 35.0),
                  width: 100.0,
                  height: 18.0,
                  child: createButton(
                      context: context,
                      labelButton: 'Domicilio Gratis',
                      labelFontSize: 11.0,
                      buttonColor: MyColors.primaryColor)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider))),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(
              text: 'Hamburguesa Rokkuto especial',
              color: MyColors.primaryColorDark,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          headerText(
              text: 'Doble carne, queso y tocineta',
              color: MyColors.gris,
              fontWeight: FontWeight.bold,
              fontSize: 15.0)
        ],
      ),
      trailing: headerText(
          text: '\$' '14.000',
          color: MyColors.gris,
          fontWeight: FontWeight.w300,
          fontSize: 15.0),
    ),
  );
}

Widget _moreContent(BuildContext ccontext) {
  return Container(
    child: ListTile(
      title: headerText(
          text: 'Agregar mas productos',
          color: MyColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 17),
    ),
  );
}

Widget _checkoutResume(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: MyColors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        _itemsCheckoutResume(title: 'Subtotal', value: '\$' '14.000'),
        _itemsCheckoutResume(title: 'Iva', value: '\$' '2.000'),
        _itemsCheckoutResume(title: 'Domicilio', value: 'Gratis'),
        _buttoCheckout(context),
      ],
    ),
  );
}

Widget _itemsCheckoutResume({
  title = String,
  value = String,
}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider))),
    child: ListTile(
      title:
          headerText(text: title, fontWeight: FontWeight.w500, fontSize: 15.0),
      trailing:
          headerText(text: value, fontWeight: FontWeight.w500, fontSize: 15.0),
    ),
  );
}

Widget _buttoCheckout(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: headerText(
                  text: 'Continuar',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white),
            ),
            Container(
              child: headerText(
                  text: '\$' '16.000',
                  fontSize: 17,
                  color: MyColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
  );
}
