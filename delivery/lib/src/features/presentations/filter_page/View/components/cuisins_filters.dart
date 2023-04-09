import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnHamburger = false;
  bool btnHotDog = false;
  bool btnPizza = false;
  bool btnAsados = false;
  bool btnFries = false;
  bool btnMeats = false;
  bool btnChine = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            _roundendButtonFilter(() {
              setState(() {
                btnHamburger = !btnHamburger;
              });
            }, btnHamburger, 'Hamburguesas'),
            _roundendButtonFilter(() {
              setState(() => btnHotDog = !btnHotDog);
            }, btnHotDog, 'Perros calientes'),
            _roundendButtonFilter(() {
              setState(() => btnAsados = !btnAsados);
            }, btnAsados, 'Asados'),
            _roundendButtonFilter(() {
              setState(() => btnPizza = !btnPizza);
            }, btnPizza, 'Pizzas'),
            _roundendButtonFilter(() {
              setState(() => btnMeats = !btnMeats);
            }, btnMeats, ' Carnes & Picadas'),
            _roundendButtonFilter(() {
              setState(() => btnFries = !btnFries);
            }, btnFries, 'Salchipapas'),
            _roundendButtonFilter(() {
              setState(() => btnChine = !btnChine);
            }, btnChine, 'Comida China'),
          ],
        ),
      ],
    );
  }
}

Widget _roundendButtonFilter(Function func, bool isActive, String labelText) {
  return
      // Container(
      //   width: 120,
      //   height: 50,
      //   child: createButton(
      //       labelButton: labelText,
      //       labelButtonColor: isActive ? MyColors.primaryColor : MyColors.gris,
      //       func: func(),
      //       buttonColor: MyColors.white,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20.0),
      //           side: BorderSide(
      //               color: isActive ? MyColors.primaryColor : MyColors.gris))),
      // );

      Container(
    margin: const EdgeInsets.all(5),
    child: ElevatedButton(
      onPressed: () {
        func();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          side: BorderSide(
              color: isActive ? MyColors.primaryColor : MyColors.gris)),
      child: Text(
        labelText,
        style:
            TextStyle(color: isActive ? MyColors.primaryColor : MyColors.gris),
      ),
    ),
  );
}
