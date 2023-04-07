import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:flutter/material.dart';

import '../../custom-widgets/Headers/header_text.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: headerText(text: 'Categorias', fontSize: 17.0),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.black);
            }),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 40.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'collections-detail');
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                width: 250,
                height: 250,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
          ),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 35, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headerText(
                    text: 'Hamburguesas',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                headerText(
                    text: '75 Lugares',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ],
            ),
          )
        ],
      ));
}
