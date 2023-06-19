import 'package:delivery/src/controllers/clientControllers/client_products_list_controller.dart';
import 'package:delivery/src/pages/custom-widgets/no_data_widget/no_data_widget.dart';
import 'package:delivery/src/models/category/category.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/pages/client/list/tabs/my_order_tab/View/my_order_tab_client.dart';
import 'package:delivery/src/pages/client/list/tabs/profile_tab/View/client/profile_tab_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../custom-widgets/Headers/header_text.dart';
import '../../../../../../utils/my_colors.dart';

class ExploreTabClient extends StatefulWidget {
  const ExploreTabClient({super.key});
  @override
  State<ExploreTabClient> createState() => _ExploreTabClientState();
}

class _ExploreTabClientState extends State<ExploreTabClient> {
  final ClientProductsListController _con = ClientProductsListController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _con.categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
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
                  Flexible(
                    child: Container(
                      height: 35.0,
                      // width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: const [
                            SizedBox(width: 3),  
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MyOrderTabClient(),
                        ),
                      );
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
              tabs: List<Widget>.generate(_con.categories.length, (index) {
                return Tab(
                  child: Text(_con.categories[index].name ?? ''),
                );
              }),
            ),
          ),
        ),
        body: TabBarView(
          children: _con.categories.map((Category category) {
            return FutureBuilder(
              future: _con.getProducts(category.id!),
              builder: (context, AsyncSnapshot<List<Product>> snapshot){
                if(snapshot.hasData){
                  if((snapshot.data?.length)! > 0){
                    return GridView.builder(
                padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8
                ), 
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder:(_, index){
                  return WidgetCardContainer(con: _con, product:  snapshot.data![index]);
                }
                );
                  }else{
                    return NoDataWidget(text: 'lo sentimos, no encontramos elementos en esta categoría.\n \nprueba con otras categorias');
                  }
                }else{
                    return NoDataWidget(text: 'lo sentimos, no encontramos elementos en esta categoría.\n \nprueba con otras categorias');
                }
            }
            );
          }).toList(),
        ),
      ),
    );
  }
  void refresh() {
    setState(() {});
  }
}

class WidgetCardContainer extends StatelessWidget {
     const WidgetCardContainer({super.key, 
    required ClientProductsListController con, required this.product, 
  }) : _con = con;
  final Product product;
  final ClientProductsListController _con;
 @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: (){
    _con.openBottomSheet(product);
    },
    child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                        width: 100.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                        image: product.image1 != null 
                            ? NetworkImage(product.image1!)
                            : const AssetImage('assets/images/no-image.png') as ImageProvider,
  )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: headerText(
                          text: product.name ?? '',
                        ),
                      ),
                       SizedBox(
                        child: Text('${product.price ??  0}\$'),
                      ),
                       
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
  );
}

}

// Widget _sliderCards() {
//   return SizedBox(
//     height: 350.0,
//     child: Swiper(
//       itemCount: 4,
//       layout: SwiperLayout.DEFAULT,
//       itemBuilder: (BuildContext context, int index) {
//         return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return _target(context);
//             });
//       },
//     ),
//   );
// }

// Widget _target(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.pushNamed(context, 'place-detail');
//     },
//     child: Container(
//       margin: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: const Image(
//                 width: 250.0,
//                 height: 250.0,
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                     'https://images.unsplash.com/photo-1606131731446-5568d87113aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80')),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 10.0),
//                 child: const Text(
//                   "Comidas rapidas Rayber",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17.0),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Barrio Paris",
//                   style: TextStyle(
//                       color: MyColors.gris,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13.0),
//                 ),
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 16,
//                   ),
//                   const Text("4.8",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13.0)),
//                   Text("(233 calificaciones)",
//                       style: TextStyle(
//                           color: MyColors.gris,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13.0)),
//                   Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                       width: 80.0,
//                       height: 18.0,
//                       child: createButton(
//                           context: context,
//                           buttonColor: MyColors.primaryColor,
//                           labelButton: 'Domicilio',
//                           labelFontSize: 11.0))
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget _headers(BuildContext context, String textHeader, String textAction) {
//   return Row(
//     children: [
//       Container(
//           alignment: Alignment.centerLeft,
//           child: headerText(
//               text: textHeader, color: Colors.black, fontSize: 20.0)),
//       const Spacer(),
//       GestureDetector(
//         child: Row(
//           children: [
//             Text(
//               textAction,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15.0),
//             ),
//             const Icon(Icons.play_arrow)
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget _sliderCollections() {
//   return SizedBox(
//     height: 200.0,
//     child: Swiper(
//       itemCount: 4,
//       layout: SwiperLayout.DEFAULT,
//       itemBuilder: (BuildContext context, int index) {
//         return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return _targetCollections(context);
//             });
//       },
//     ),
//   );
// }

// Widget _targetCollections(BuildContext context) {
//   return Container(
//     margin: const EdgeInsets.all(10.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//           child: const Image(
//               width: 300,
//               height: 150,
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                   'https://images.unsplash.com/photo-1626203050468-9308df7964fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=881&q=80')),
//         ),
//       ],
//     ),
//   );
// }
