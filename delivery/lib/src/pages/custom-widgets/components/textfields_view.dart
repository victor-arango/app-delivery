import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfileDetailView extends StatelessWidget {
  const TextFieldProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createTexfieldUserName(context),
        _createTexfieldEmail(context),
        _createTexfieldPhone(context),
        _createTexfieldDateOfBirth(context),
        _createTexfieldDeliveryAdrres(context),
      ],
    );
  }
}

Widget _createTexfieldUserName(BuildContext context) {
  return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child: const ListTile(
        title: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Nombre Usuario',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
}

Widget _createTexfieldEmail(BuildContext context) {
  return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child: const ListTile(
        title: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Correo Electronico',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
}

Widget _createTexfieldPhone(BuildContext context) {
  return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child: const ListTile(
        title: TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Número Telefono',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
}

Widget _createTexfieldDateOfBirth(BuildContext context) {
  return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child: const ListTile(
        title: TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              hintText: 'Feha Cumpleaños',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
}

Widget _createTexfieldDeliveryAdrres(BuildContext context) {
  return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child: const ListTile(
        title: TextField(
          keyboardType: TextInputType.text,
          maxLines: 2,
          decoration: InputDecoration(
              hintText: 'Dirección Domicilio',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
}
