// ignore_for_file: avoid_unnecessary_containers

// import 'package:delivery/src/features/presentations/custom-widgets/Buttons/rounded_button.dart';
// import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
// import 'package:delivery/src/utils/my_colors.dart';
// import 'package:delivery/src/features/presentations/tabs/my_order_tab/View/components/empty_order_view.dart';
import 'package:flutter/material.dart';

class MyOrderTabDelivery extends StatefulWidget {
  const MyOrderTabDelivery({super.key});

  @override
  State<MyOrderTabDelivery> createState() => _MyOrderTabDeliveryState();
}

class _MyOrderTabDeliveryState extends State<MyOrderTabDelivery> {
  final emptyOrderState = false;
  @override
  Widget build(BuildContext context) {
     return const Center(child: Text('order  Delivery'),);
    // return Scaffold(
    //   backgroundColor: MyColors.primarOpacityyColor,
    //   body: emptyOrderState
    //       ? const EmptyOrderView()
    //       : CustomScrollView(
    //           slivers: [
    //             SliverAppBar(
    //               elevation: 0.5,
    //               centerTitle: true,
    //               leading: const Text(''),
    //               backgroundColor: MyColors.white,
    //               title: headerText(
    //                   text: 'Mi Orden',
    //                   color: MyColors.primaryColorDark,
    //                   fontSize: 17,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             SliverList(
    //                 delegate: SliverChildListDelegate([
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 10),
    //                 child: Column(
    //                   children: [
    //                     _orders(context),
    //                     const SizedBox(
    //                       height: 300,
    //                     ),
    //                     _checkoutResume(context),
    //                   ],
    //                 ),
    //               )
    //             ]))
    //           ],
    //         ),
    // );
  }
}

// // Widget _orders(BuildContext context) {
// //   return Column(
// //     children: [_cardOrder(context)],
// //   );
// // }

// Widget _cardOrder(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//     margin: const EdgeInsets.symmetric(vertical: 10.0),
//     width: double.infinity,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: const Color.fromRGBO(248, 248, 248, 1.0),
//         boxShadow: const [
//           BoxShadow(
//               color: Color.fromRGBO(210, 211, 215, 1.0),
//               spreadRadius: 1.0,
//               blurRadius: 4.0)
//         ]),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             _cardOrderTopContent(context),
//           ],
//         ),
//         Column(
//           children: [
//             _items(context),
//             _items(context),
//             _items(context),
//             _items(context),
//           ],
//         ),
//         _moreContent(context),
//       ],
//     ),
//   );
// }

// Widget _cardOrderTopContent(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 7.0, right: 20.0),
//           child: headerText(
//               text: 'Comidas rapidas Rokkuto',
//               fontWeight: FontWeight.bold,
//               fontSize: 22.0),
//         ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.location_on,
//                 color: MyColors.gris,
//                 size: 16.0,
//               ),
//               headerText(
//                   text: 'Barrio Santander',
//                   color: MyColors.gris,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14.0),
//               Container(
//                   margin: const EdgeInsets.only(left: 35.0),
//                   width: 100.0,
//                   height: 18.0,
//                   child: createButton(
//                       context: context,
//                       labelButton: 'Domicilio Gratis',
//                       labelFontSize: 11.0,
//                       buttonColor: MyColors.primaryColor)),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget _items(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: MyColors.divider))),
//     child: ListTile(
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           headerText(
//               text: 'Hamburguesa Rokkuto especial',
//               color: MyColors.primaryColorDark,
//               fontWeight: FontWeight.bold,
//               fontSize: 20.0),
//           headerText(
//               text: 'Doble carne, queso y tocineta',
//               color: MyColors.gris,
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0)
//         ],
//       ),
//       trailing: headerText(
//           text: '\$' '14.000',
//           color: MyColors.gris,
//           fontWeight: FontWeight.w300,
//           fontSize: 15.0),
//     ),
//   );
// }

// Widget _moreContent(BuildContext ccontext) {
//   return Container(
//     child: ListTile(
//       title: headerText(
//           text: 'Agregar mas productos',
//           color: MyColors.primaryColor,
//           fontWeight: FontWeight.bold,
//           fontSize: 17),
//     ),
//   );
// }

// Widget _checkoutResume(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.all(10),
//     margin: const EdgeInsets.symmetric(vertical: 10),
//     width: double.infinity,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: MyColors.white,
//         boxShadow: const [
//           BoxShadow(
//               color: Color.fromRGBO(210, 211, 215, 1.0),
//               spreadRadius: 1.0,
//               blurRadius: 4.0)
//         ]),
//     child: Column(
//       children: [
//         _itemsCheckoutResume(title: 'Subtotal', value: '\$' '14.000'),
//         _itemsCheckoutResume(title: 'Iva', value: '\$' '2.000'),
//         _itemsCheckoutResume(title: 'Domicilio', value: 'Gratis'),
//         _buttoCheckout(context),
//       ],
//     ),
//   );
// }

// Widget _itemsCheckoutResume({
//   title = String,
//   value = String,
// }) {
//   return Container(
//     decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: MyColors.divider))),
//     child: ListTile(
//       title:
//           headerText(text: title, fontWeight: FontWeight.w500, fontSize: 15.0),
//       trailing:
//           headerText(text: value, fontWeight: FontWeight.w500, fontSize: 15.0),
//     ),
//   );
// }

// Widget _buttoCheckout(BuildContext context) {
//   return Container(
//     width: double.infinity,
//     height: 45.0,
//     margin: const EdgeInsets.only(top: 10.0),
//     child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//             backgroundColor: MyColors.primaryColor,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(),
//             Container(
//               margin: const EdgeInsets.only(left: 50),
//               child: headerText(
//                   text: 'Continuar',
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: MyColors.white),
//             ),
//             Container(
//               child: headerText(
//                   text: '\$' '16.000',
//                   fontSize: 17,
//                   color: MyColors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         )),
//   );
// }
