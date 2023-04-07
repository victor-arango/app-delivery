import 'package:delivery/src/features/presentations/custom-widgets/Cards/favourite_card.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../custom-widgets/BackButtons/back_button.dart';
import '../../custom-widgets/Headers/header_text.dart';

class CollectionsDetailPage extends StatefulWidget {
  const CollectionsDetailPage({super.key});

  @override
  State<CollectionsDetailPage> createState() => _CollectionsDetailPageState();
}

class _CollectionsDetailPageState extends State<CollectionsDetailPage> {
  final ScrollController _scrollController = ScrollController();
  String textView = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        textView = _scrollController.offset > 150 ? 'Hamburguesas' : '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            centerTitle: true,
            title: Text(textView),
            backgroundColor: MyColors.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1571805618149-3a772570ebcd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 1.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Center(
                      child: headerText(
                    text: 'Hamburguesas',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: headerText(
                      text: '75 Lugares',
                      color: const Color.fromRGBO(51, 58, 77, 1.0),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Column(
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
                          isFavourite: false,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1625683257212-116d74981941?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                      favouriteCard(
                          context: context,
                          title: 'Comidas Rapidas Mandis',
                          subtitle: 'Barrio Paris',
                          review: '4.8',
                          ratings: '65 Valoraciones',
                          buttonText: 'Domicilios',
                          hasActionButton: true,
                          isFavourite: false,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1610440042657-612c34d95e9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                      favouriteCard(
                          context: context,
                          title: 'Comidas Rapidas Narutto',
                          subtitle: 'Barrio Paris',
                          review: '4.8',
                          ratings: '65 Valoraciones',
                          buttonText: 'Domicilios',
                          hasActionButton: true,
                          isFavourite: false,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1553979459-d2229ba7433b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1068&q=80')),
                      favouriteCard(
                          context: context,
                          title: "Comidas Rapidas Natural's",
                          subtitle: 'Barrio Nuevo',
                          review: '4.8',
                          ratings: '65 Valoraciones',
                          buttonText: 'Domicilios',
                          hasActionButton: true,
                          isFavourite: true,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1635126039215-ec4d113917fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')),
                      favouriteCard(
                          context: context,
                          title: "Comidas Rapidas Natural's",
                          subtitle: 'Barrio Nuevo',
                          review: '4.8',
                          ratings: '65 Valoraciones',
                          buttonText: 'Domicilios',
                          hasActionButton: true,
                          isFavourite: true,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1635126039215-ec4d113917fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')),
                      favouriteCard(
                          context: context,
                          title: "Comidas Rapidas Natural's",
                          subtitle: 'Barrio Nuevo',
                          review: '4.8',
                          ratings: '65 Valoraciones',
                          buttonText: 'Domicilios',
                          hasActionButton: true,
                          isFavourite: true,
                          image: const NetworkImage(
                              'https://images.unsplash.com/photo-1635126039215-ec4d113917fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')),
                    ],
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
