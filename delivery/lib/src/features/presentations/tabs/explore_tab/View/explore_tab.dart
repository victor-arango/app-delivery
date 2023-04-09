import 'package:delivery/src/features/presentations/custom-widgets/Buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/my_colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../../custom-widgets/Headers/header_text.dart';
import '../../../custom-widgets/Cards/populares_card.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                _topBar(context),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  alignment: Alignment.centerLeft,
                  child: headerText(
                      text: 'Descrube nuevos lugares',
                      color: MyColors.primaryColorDark,
                      fontSize: 30.0),
                ),
                _sliderCards(),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child:
                        _headers(context, 'Populares esta semana', 'Ver más')),
                popularesCard(
                    context: context,
                    title: 'Rokutto',
                    subtitle: 'Santander',
                    review: '4.5',
                    ratings: '100 valoraciones',
                    buttonText: 'Domicilios',
                    hasActionButton: true,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1598679253544-2c97992403ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                popularesCard(
                    context: context,
                    title: 'Rokutto',
                    subtitle: 'Santander',
                    review: '4.5',
                    ratings: '100 valoraciones',
                    buttonText: 'Domicilios',
                    hasActionButton: true,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1598679253544-2c97992403ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                popularesCard(
                    context: context,
                    title: 'Comidas Rapidas Rokutto',
                    subtitle: 'Santander',
                    review: '4.5',
                    ratings: '100 valoraciones',
                    buttonText: 'Domicilios',
                    hasActionButton: true,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1598679253544-2c97992403ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'collections');
                        },
                        child: _headers(context, 'Restaurantes', 'Ver más'))),
                _sliderCollections()
              ],
            ),
          )
        ]))
      ],
    ));
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
            width: 400.0,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                Icon(Icons.search, size: 20.0, color: MyColors.gris),
                Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Buscar',
                    style: TextStyle(color: MyColors.gris, fontSize: 17.0),
                  ),
                ),
              ],
            )),
      ),
      Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(209, 209, 214, 1.0),
              borderRadius: BorderRadius.circular(30)),
          child: IconButton(
            icon: const Icon(
              Icons.filter_list,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'filter');
            },
          ))
    ],
  );
}

Widget _sliderCards() {
  return SizedBox(
    height: 350.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _target(context);
            });
      },
    ),
  );
}

Widget _target(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place-detail');
    },
    child: Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
                width: 250.0,
                height: 250.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1606131731446-5568d87113aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  "Comidas rapidas Rayber",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Barrio Paris",
                  style: TextStyle(
                      color: MyColors.gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  const Text("4.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Text("(233 calificaciones)",
                      style: TextStyle(
                          color: MyColors.gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 80.0,
                      height: 18.0,
                      child: createButton(
                          buttonColor: MyColors.primaryColor,
                          labelButton: 'Domicilio',
                          labelFontSize: 11.0))
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
          alignment: Alignment.centerLeft,
          child: headerText(
              text: textHeader, color: Colors.black, fontSize: 20.0)),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      ),
    ],
  );
}

Widget _sliderCollections() {
  return SizedBox(
    height: 200.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _targetCollections(context);
            });
      },
    ),
  );
}

Widget _targetCollections(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
              width: 300,
              height: 150,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1626203050468-9308df7964fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=881&q=80')),
        ),
      ],
    ),
  );
}
