// import 'package:flutter/material.dart';

// import 'package:fastfood/src/tabs/explore_tab.dart';
// import 'package:fastfood/src/tabs/favourite_tab.dart';
// import 'package:fastfood/src/tabs/my_order_tab.dart';
// import 'package:fastfood/src/tabs/profile_tab.dart';

// class TabsPage extends StatefulWidget {
//   const TabsPage({super.key});

//   @override
//   State<TabsPage> createState() => _TabsPageState();
// }

// class _TabsPageState extends State<TabsPage> {
//   final List<Widget> _widgetOptions = [
//     const ExploreTab(),
//     const MyOrderTab(),
//     const FavouriteTab(),
//     const ProfileTab()
//   ];

//   int _selectItemIndex = 0;

//   void _changeWidget(int index) {
//     setState(() {
//       _selectItemIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectItemIndex),
//       bottomNavigationBar: _bottonNavigatorBar(context),
//     );
//   }

//   Widget _bottonNavigatorBar(BuildContext context) {
//     return BottomNavigationBar(
//         iconSize: 30.0,
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectItemIndex,
//         onTap: _changeWidget,
//         showUnselectedLabels: true,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.assessment), label: 'Mi orden'),
//           BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favorito'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_pin), label: 'Perfil'),
//         ]);
//   }
// }

import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:delivery/src/features/presentations/tabs/explore_tab/View/explore_tab.dart';
import 'package:delivery/src/features/presentations/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:delivery/src/features/presentations/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:delivery/src/features/presentations/tabs/profile_tab/View/profile_tab.dart';

import '../custom-widgets/Alerts/alert_dialog.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getLocation(context);
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  int _selectItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Explorar",
          labels: const ["Explorar", "Mi orden", "Favorito", "Perfil"],
          icons: const [
            Icons.explore,
            Icons.assessment,
            Icons.book,
            Icons.person_pin
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: MyColors.primaryColor,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: MyColors.primaryColor,
          tabIconSelectedColor: Colors.white,
          tabBarColor: const Color.fromARGB(255, 255, 255, 255),
          onTabItemSelected: (int value) {
            setState(() {
              _selectItemIndex = value;
            });
          },
        ),
        body: _widgetOptions.elementAt(_selectItemIndex));
  }

  Future _getLocation(BuildContext context) async {
    await showAlertDialog(
        context,
        const AssetImage('assets/images/location.png'),
        'Habilitar ubicación',
        'permita usar su ubicación para mostrar el restaurante cercano en el mapa.',
        doneButton(context, "Confirmar"));
  }

  Widget doneButton(BuildContext context, String labelButton) {
    return Container(
      width: double.infinity,
      height: 45.0,
      margin: const EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: Text(
          labelButton,
          style: const TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}
