import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_colors.dart';
import '../../custom-widgets/Headers/header_text.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

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
          child: Column(
            children: [
              headerText(
                  text: 'Crea una cuenta',
                  color: MyColors.primaryColorDark,
                  fontSize: 25.0),
              _usename(context),
              _emailInput(context),
              _phoneInput(context),
              _dateOfBirthInput(context),
              _passwordInput(context),
              _confirmPasswordInput(context),
              _singUpButton(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usename(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 40.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Nombre',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phoneInput(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'Telefono',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _dateOfBirthInput(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'Fecha nacimiento',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _confirmPasswordInput(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20.0),
    margin: const EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: ' Confirmar Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _singUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: const Text(
        'Registrar',
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
    ),
  );
}
