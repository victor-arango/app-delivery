import 'package:delivery/src/controllers/clientControllers/client_products_detail_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ClientProductsDetailPage extends StatefulWidget {
  Product product;
  ClientProductsDetailPage({super.key, required this.product});

  @override
  State<ClientProductsDetailPage> createState() =>
      _ClientProductsDetailPageState();
}

class _ClientProductsDetailPageState extends State<ClientProductsDetailPage> {
  final ClientProductsDetailController _con = ClientProductsDetailController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh, widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              
              height: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.10),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: const ShapeDecoration(
                        shape:  CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.42),
              width: double.infinity,
              child: Container(
                
                width: double.infinity,
                height: screenHeight.getScreenHeight(
                    context: context, multiplier: 0.42),
                decoration: BoxDecoration(
                  borderRadius:const  BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  color: MyColors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageSlideshow(
                    width: double.infinity,
                    height: screenHeight.getScreenHeight(
                        context: context, multiplier: 0.4),
                    indicatorColor: MyColors.primaryColor,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      FadeInImage(
                        image: Image.network(
                          _con.product?.image1 ??
                              'https://firebasestorage.googleapis.com/v0/b/delivery-app-5174b.appspot.com/o/no-image.png?alt=media&token=bd2d19f9-84f4-4db5-b4dc-216448af7124',
                          errorBuilder: (_, __, ___) {
                            return Image.asset('assets/images/no-image.png');
                          },
                        ).image,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/no-image.png'),
                      ),
                      FadeInImage(
                        image: Image.network(
                          _con.product?.image2 ??
                              'https://firebasestorage.googleapis.com/v0/b/delivery-app-5174b.appspot.com/o/no-image.png?alt=media&token=bd2d19f9-84f4-4db5-b4dc-216448af7124',
                          errorBuilder: (_, __, ___) {
                            return Image.asset('assets/images/no-image.png');
                          },
                        ).image,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/no-image.png'),
                      ),
                      FadeInImage(
                        image: Image.network(
                          _con.product?.image3 ??
                              'https://firebasestorage.googleapis.com/v0/b/delivery-app-5174b.appspot.com/o/no-image.png?alt=media&token=bd2d19f9-84f4-4db5-b4dc-216448af7124',
                          errorBuilder: (_, __, ___) {
                            return Image.asset('assets/images/no-image.png');
                          },
                        ).image,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/no-image.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // sub content
            SizedBox(
              height: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.43),
              width: double.infinity,
              child: Container(
                decoration:const  BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: screenHeight.getScreenHeight(
                            context: context, multiplier: 0.36),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: MyColors.negro,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        _con.product?.name ?? '',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                        Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Text(
                                      "${_con.product?.price ?? 0}\$ UND ",
                                        style:  TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.primaryColor
                                            ),
                                      ),
                                    ),


                                      ],
                                    ),
                                    
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        _con.product?.description ?? '',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:const EdgeInsets.only(top: 40),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed:_con.addItem,
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color: MyColors.gris,
                                            size: 30,
                                          )),
                                      Text(
                                        '${_con.counter}',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.gris),
                                      ),
                                      IconButton(
                                          onPressed: 
                                            _con.removeItem,
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color: MyColors.gris,
                                            size: 30,
                                          )),
                                      const Spacer(),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: headerText(
                                          text:
                                              "${_con.productPrice }\$ ",
                                          fontSize: 18,
                                          color: MyColors.negro,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/delivery.png',
                                      height: 20,
                                    ),
                                    const SizedBox(width: 7),
                                    headerText(
                                      text: 'Envio Gratis',
                                      color: Colors.green,
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed:_con.addToBag,
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: MyColors.primaryColor,
                                      elevation: 0.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.shopping_bag,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 10.0),
                                        child: headerText(
                                            text: 'Agregar al carrito',
                                            color: MyColors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}


