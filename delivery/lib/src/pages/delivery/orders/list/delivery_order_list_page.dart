import 'package:delivery/src/pages/delivery/orders/list/tabs/explore_tab/View/explore_tab_delivery.dart';
import 'package:delivery/src/pages/delivery/orders/list/tabs/my_order_tab/View/components/empty_order_view.dart';
import 'package:delivery/src/pages/delivery/orders/list/tabs/profile_tab/View/profile_tab.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';





class TabsPagedelivery extends StatefulWidget {
  const TabsPagedelivery({Key? key}) : super(key: key);
  @override
  State<TabsPagedelivery> createState() => _TabsPagedeliveryState();
}

class _TabsPagedeliveryState extends State<TabsPagedelivery> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // _getLocation(context);
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTabDelivery(),
    const EmptyOrderViewDelivery(),
    // const FavouriteTab(),
    const ProfileTabDelivery()
  ];

  int _selectItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Explorar",
          labels: const ["Explorar", "Mi orden",  "Perfil"],
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

  // Future _getLocation(BuildContext context) async {
  //   await showAlertDialog(
  //       context,
  //       const AssetImage('assets/images/location.png'),
  //       'Habilitar ubicación',
  //       'permita usar su ubicación para mostrar el restaurante cercano en el mapa.',
  //       doneButton(context, "Confirmar"));
  // }

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
