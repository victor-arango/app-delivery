// ignore_for_file: avoid_unnecessary_containers

import 'package:delivery/src/features/presentations/custom-widgets/Buttons/rounded_button.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_double.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: MyColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {},
          label: headerText(
              text: 'Agregar al carrito ',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: MyColors.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1545575950-59f935d6521c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1.3),
                    ),
                  ),
                  Wrap(
                    children: [
                      _promoButton(),
                      _infoPlace(),
                      _infoPacleStats(),
                      // _offerBanner()
                    ],
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.share,
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border))
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _headers(texto: ' Productos Populares'),
            _sliderCard(),
            _headers(texto: 'Menú completo'),
            _menuList(context),
            _headers(texto: 'Reseñas'),
            _reviews(),
            _headers(texto: 'Calificanos'),
            _youRaiting(),
            const SizedBox(
              height: 150.0,
            ),
          ]))
        ],
      ),
    );
  }
}

Widget _promoButton() {
  return Container(
    margin: const EdgeInsets.only(top: 121.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 25,
    child: Row(
      children: const [
        // createButton(
        //     buttonColor: MyColors.primaryColor,
        //     labelButton: 'Domicilio Gratis',
        //     labelFontSize: 12.0)
      ],
    ),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: headerText(
            text: 'Disfruta de la mas deliciosa comida rapida',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: MyColors.divider,
            ),
            headerText(
                text: 'Crr 105-82-49',
                color: MyColors.divider,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPacleStats() {
  return Container(
    margin: const EdgeInsets.only(top: 35.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
      top: BorderSide(color: Colors.white),
    )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.white, size: 19.0),
                headerText(
                    text: '4.5',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)
              ],
            ),
            headerText(
                text: '351 Valoraciones',
                color: MyColors.divider,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bookmark, color: Colors.white, size: 19.0),
                headerText(
                    text: '1k',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)
              ],
            ),
            headerText(
                text: 'Favoritos',
                color: MyColors.divider,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.photo, color: Colors.white, size: 19.0),
                headerText(
                    text: '65',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)
              ],
            ),
            headerText(
                text: 'Productos',
                color: MyColors.divider,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
      ],
    ),
  );
}

// ignore: unused_element
Widget _offerBanner() {
  return Container(
    color: MyColors.bkgBanner,
    padding: const EdgeInsets.all(20),
    height: 95.0,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(
              text: 'Recoge tu orden',
              color: MyColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          headerText(
              text:
                  'recoge a tu tiempo.  tu pedido está listo \n cuando tú lo estás',
              color: MyColors.negro,
              fontWeight: FontWeight.w400,
              fontSize: 13.0)
        ],
      ),
      const Spacer(),
      createButton(
        labelButton: 'Ordena Ahora',
        labelFontSize: 13.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        buttonColor: MyColors.primaryColor,
      )
    ]),
  );
}

Widget _headers({texto = String}) {
  return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: headerDoubleText(
        textHeader: texto,
        textAction: '',
      ));
}

Widget _sliderCard() {
  return Container(
      height: 260.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cards();
          }));
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: const Image(
            width: 200.0,
            height: 130.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1594489883219-010b0e5eeb9d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                text: 'Punta de Anca',
                fontWeight: FontWeight.bold,
                fontSize: 15.0)),
        Container(
            alignment: Alignment.centerLeft,
            child: headerText(
                text: '\$' '25.000',
                fontWeight: FontWeight.w500,
                color: MyColors.gris,
                fontSize: 15.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 130.0,
                margin: const EdgeInsets.only(top: 10),
                child: headerText(
                    text: 'Seleccionar',
                    fontWeight: FontWeight.w500,
                    color: MyColors.primaryColor,
                    fontSize: 15.0)),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: MyColors.primaryColor,
                  ),
                )),
          ],
        )
      ],
    ),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Ensaladas', '2'),
        _menuItem(context, 'Ensaladas', '2'),
        _menuItem(context, 'Ensaladas', '2'),
        _menuItem(context, 'Ensaladas', '2'),
        _menuItem(context, 'Ensaladas', '2'),
        _menuItem(context, 'Ensaladas', '2'),
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount) {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider))),
    child: Column(
      children: [
        ListTile(
          title: headerText(
              text: texto,
              fontWeight: FontWeight.w300,
              color: MyColors.primaryColorDark,
              fontSize: 17.0),
          trailing: headerText(
              text: itemCount,
              fontWeight: FontWeight.w300,
              color: MyColors.primaryColorDark,
              fontSize: 17.0),
        ),
        _sliderCard()
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 130,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardsReviews();
        }),
  );
}

Widget _cardsReviews() {
  return Container(
    width: 400,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      width: 50,
                      height: 43.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1641288883869-c463bc6c2a58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                    )),
                Container(
                  width: 200,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerText(
                          text: 'David Ruiz',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      headerText(
                          text: '25 Reseñas',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: MyColors.gris),
                    ],
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: MyColors.primaryColor,
                      width: 60,
                      height: 30,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            headerText(
                                text: '4',
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              text:
                  'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)',
              color: MyColors.gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
            text: 'Ver todas las reseñas',
            color: MyColors.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

Widget _youRaiting() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: MyColors.bkgBanner,
                width: 60,
                height: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  headerText(
                      text: '1',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  Icon(
                    Icons.star,
                    color: MyColors.primaryColor,
                    size: 14,
                  )
                ]),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: MyColors.bkgBanner,
                width: 60,
                height: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  headerText(
                      text: '2',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  Icon(
                    Icons.star,
                    color: MyColors.primaryColor,
                    size: 14,
                  )
                ]),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: MyColors.bkgBanner,
                width: 60,
                height: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  headerText(
                      text: '3',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  Icon(
                    Icons.star,
                    color: MyColors.primaryColor,
                    size: 14,
                  )
                ]),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: MyColors.primaryColor,
                width: 60,
                height: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  headerText(
                      text: '4',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  )
                ]),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: MyColors.bkgBanner,
                width: 60,
                height: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  headerText(
                      text: '5',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  Icon(
                    Icons.star,
                    color: MyColors.primaryColor,
                    size: 14,
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 10, left: 20),
        child: headerText(
            text: 'Nos encantaría saber más sobre su experiencia!',
            color: MyColors.gris,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10, left: 20),
        child: headerText(
          text: '+ Escribe tu reseña',
          color: MyColors.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    ]),
  );
}
