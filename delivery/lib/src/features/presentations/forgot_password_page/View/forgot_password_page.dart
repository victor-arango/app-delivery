import 'package:delivery/src/features/presentations/custom-widgets/Alerts/alert_dialog.dart';
import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/my_colors.dart';
import '../../custom-widgets/Headers/header_text.dart';
import '../../custom-widgets/Buttons/rounded_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            headerText(
                text: 'Recupera tu contraseña',
                color: MyColors.primaryColorDark,
                fontSize: .0),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Por favor ingresa tu dirección de correo electronico para restablecer tu contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0),
              ),
            ),
            _emailInput(),
            GestureDetector(
              onTap: () => _showAlertReset(context),
              child: createButton(
                  context: context,
                  buttonColor: MyColors.primaryColor,
                  labelButton: 'Restablecer',
                  shape: const StadiumBorder()),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

// ignore: unused_element
Widget _restorePassword(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
      onPressed: () {
        _showAlertReset(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: const Text(
        'Restablecer',
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
    ),
  );
}

void _showAlertReset(BuildContext context) {
  showAlertDialog(
      context,
      const AssetImage('assets/images/lock.png'),
      'Tu contraseña sera restablecida',
      'prueba',
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'login');
        },
        child: createButton(
          context: context,
          buttonColor: MyColors.primaryColor,
          labelButton: "Confirmar",
        ),
      ));
}
