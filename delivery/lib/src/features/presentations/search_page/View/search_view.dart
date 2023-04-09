import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../../../utils/my_colors.dart';
import '../../custom-widgets/Cards/vertical_card.dart';
import '../../custom-widgets/Headers/header_double.dart';
import '../../custom-widgets/Cards/populares_card.dart';
import '../../custom-widgets/Headers/header_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              color: Colors.black,
              iconSize: 35.0,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: headerText(
                          text: 'Buscar', color: Colors.black, fontSize: 25.0)),
                  _searchInput(context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  headerDoubleText(
                      textHeader: 'Busquedas recientes',
                      textAction: 'Limpiar todo'),
                  sliderRecentSearch(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  headerDoubleText(
                      textHeader: 'Recomendado para ti', textAction: ''),
                  const SizedBox(
                    height: 20.0,
                  ),
                  popularesCard(
                      context: context,
                      title: 'Rayber',
                      subtitle: 'Paris',
                      review: '4.5',
                      ratings: '250 valoraciones',
                      buttonText: 'Domicilios',
                      hasActionButton: false,
                      image: const NetworkImage(
                          'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                  popularesCard(
                      context: context,
                      title: 'Rayber',
                      subtitle: 'Paris',
                      review: '4.5',
                      ratings: '250 valoraciones',
                      buttonText: 'Domicilios',
                      hasActionButton: false,
                      image: const NetworkImage(
                          'https://images.pexels.com/photos/1893556/pexels-photo-1893556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                  popularesCard(
                      context: context,
                      title: 'Rayber',
                      subtitle: 'Paris',
                      review: '4.5',
                      ratings: '250 valoraciones',
                      buttonText: 'Domicilios',
                      hasActionButton: false,
                      image: const NetworkImage(
                          'https://images.pexels.com/photos/13229767/pexels-photo-13229767.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context) {
  return Container(
    height: 40.0,
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(20.0)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 5.0),
          prefixIcon: Icon(
            Icons.search,
            color: MyColors.gris,
          ),
          hintText: 'Buscar',
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget sliderRecentSearch() {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 190.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return cardVertical(
                context: context,
                width: 160.0,
                height: 120.0,
                title: 'Comida Rapida Talos',
                subtitle: 'Barrio Paris',
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1609167830220-7164aa360951?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'));
          },
        );
      },
    ),
  );
}
