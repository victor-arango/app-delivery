import 'package:delivery/src/features/presentations/filter_page/View/components/cuisins_filters.dart';
import 'package:delivery/src/features/presentations/filter_page/View/components/list_tile_checked.dart';
import 'package:delivery/src/features/presentations/filter_page/View/components/prices_filter.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../custom-widgets/Headers/header_text.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool topRated = false;
  bool masCercano = false;
  bool costoAltoBajo = false;
  bool costoBAjoAlto = false;
  bool masPopular = false;

  // filter Booleans
  bool openNow = false;
  bool creditCards = false;
  bool alcoholService = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: _appBar(context),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            alignment: Alignment.centerLeft,
            child: headerText(
                text: 'TIPO DE COMIDAS',
                color: MyColors.gris,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const CuisinesFilter()),
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            alignment: Alignment.centerLeft,
            child: headerText(
                text: 'ORDERNAR POR',
                color: MyColors.gris,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          _sortByContainer(),
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            alignment: Alignment.centerLeft,
            child: headerText(
                text: 'FILTRO',
                color: MyColors.gris,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          _filterContainer(),
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            alignment: Alignment.centerLeft,
            child: headerText(
                text: 'PRECIOS',
                color: MyColors.gris,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          const PricesFilter()
        ]))
      ]),
    );
  }

  Widget _sortByContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              text: 'los más valorados',
              isActive: topRated,
              func: () {
                setState(() => topRated = !topRated);
              },
            ),
            ListTileCheck(
              text: 'Mas Cercano',
              isActive: masCercano,
              func: () {
                setState(() => masCercano = !masCercano);
              },
            ),
            ListTileCheck(
              text: 'Precio mas alto a mas bajo',
              isActive: costoAltoBajo,
              func: () {
                setState(() => costoAltoBajo = !costoAltoBajo);
              },
            ),
            ListTileCheck(
              text: 'Precio mas bajo a mas alto',
              isActive: costoBAjoAlto,
              func: () {
                setState(() => costoBAjoAlto = !costoBAjoAlto);
              },
            ),
            ListTileCheck(
              text: 'Mas popular',
              isActive: masPopular,
              func: () {
                setState(() => masPopular = !masPopular);
              },
            ),
          ],
        ));
  }

  Widget _filterContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              text: 'Abierto ahora',
              isActive: openNow,
              func: () {
                setState(() => openNow = !openNow);
              },
            ),
            ListTileCheck(
              text: 'Tarjeta de credito',
              isActive: creditCards,
              func: () {
                setState(() => creditCards = !creditCards);
              },
            ),
            ListTileCheck(
              text: 'Bebidas Alcoholicas',
              isActive: alcoholService,
              func: () {
                setState(() => alcoholService = !alcoholService);
              },
            ),
          ],
        ));
  }
}

Widget _appBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 100,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: headerText(text: 'Filtro', fontWeight: FontWeight.w600),
    leading: Container(
      padding: const EdgeInsets.only(top: 22, left: 7.0),
      child: headerText(
          text: 'Restablecer', fontWeight: FontWeight.w500, fontSize: 17.0),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 14.0),
          child: headerText(
              text: 'Listo!',
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 17.0),
        ),
      )
    ],
  );
}
