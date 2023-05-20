import 'package:flutter/material.dart';

import '../../../../../custom-widgets/Cards/favourite_card.dart';
import '../../../../../custom-widgets/Headers/header_text.dart';
import '../../../../../../utils/my_colors.dart';

class FavouriteTabClient extends StatefulWidget {
  const FavouriteTabClient({super.key});

  @override
  State<FavouriteTabClient> createState() => _FavouriteTabClientState();
}

class _FavouriteTabClientState extends State<FavouriteTabClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primarOpacityyColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const Text(''),
            backgroundColor: MyColors.white,
            centerTitle: true,
            title: headerText(
                text: 'Favoritos',
                color: MyColors.primaryColorDark,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  favouriteCard(
                      context: context,
                      title: 'Comidas Rapidas Rayber',
                      subtitle: 'Barrio Paris',
                      review: '4.8',
                      ratings: '100 Valoraciones',
                      buttonText: 'Domicilios',
                      hasActionButton: true,
                      isFavourite: true,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80')),
                  favouriteCard(
                      context: context,
                      title: 'Comidas Rapidas Talos',
                      subtitle: 'Barrio Paris',
                      review: '4.8',
                      ratings: '65 Valoraciones',
                      buttonText: 'Domicilios',
                      hasActionButton: true,
                      isFavourite: true,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1625683257212-116d74981941?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
