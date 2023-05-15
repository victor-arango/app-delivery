import 'dart:ui';

// ignore: unused_import
import 'package:delivery/src/features/presentations/custom-widgets/Buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_colors.dart';
import '../../custom-widgets/Headers/header_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1491960693564-421771d727d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=763&q=80'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: headerText(
                  text: '¡QUE DISFRUTES  TU COMIDA!',
                  color: Colors.white,
                  fontSize: 25.0,
                  textOverflow: TextOverflow.fade
                  )
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: const Text(
                'Toda la gastronomia de tu barrio a un solo click.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0),
              ),
            ),
            Container(
              width: 350,
              height: 45.0,
              margin: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            //Button Facebook
          ],
        )
      ],
    ));
  }
}
