import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class PricesFilter extends StatefulWidget {
  const PricesFilter({super.key});

  @override
  State<PricesFilter> createState() => _PricesFilterState();
}

class _PricesFilterState extends State<PricesFilter> {
  //propiedades rango precios

  RangeValues _values = const RangeValues(0.0, 100.0);
  int _minPrice = 0;
  int _maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("\$ " "$_minPrice.000", style: const TextStyle(fontSize: 16.0)),
        SizedBox(
          width: 300,
          child: RangeSlider(
            activeColor: MyColors.primaryColor,
            inactiveColor: MyColors.gris,
            values: _values,
            min: 0,
            max: 100.000,
            onChanged: (RangeValues newValue) {
              setState(() {
                _values = newValue;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
        Text("\$ " "$_maxPrice.000", style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
