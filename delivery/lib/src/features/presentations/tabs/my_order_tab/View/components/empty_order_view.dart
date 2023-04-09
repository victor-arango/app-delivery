import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../custom-widgets/Headers/header_text.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primarOpacityyColor,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        leading: const Text(''),
        backgroundColor: MyColors.white,
        title: headerText(
          text: 'Mi Orden',
          color: MyColors.primaryColorDark,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 216,
              height: 216,
              image: AssetImage('assets/images/carro.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: headerText(
                  text: 'Carrito Vacio',
                  color: MyColors.gris,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: headerText(
                  text:
                      '¡La buena comida siempre se está cocinando! Adelante, pide algunos platos deliciosos del menú.',
                  textAlign: TextAlign.center,
                  color: MyColors.gris,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
