import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';

import 'package:delivery/src/pages/restaurant/orders/list/tabs/profile_tab/View/profile_tab.dart';
import 'package:delivery/src/utils/my_colors.dart';

import 'package:flutter/material.dart';


Widget createHeader({
    BuildContext? context,
    ImageProvider<Object>? image,
  }) {
  return AppBar(
    backgroundColor: MyColors.primaryColor,
    elevation: 0.0,
    leading:Builder(builder: (BuildContext context) {
                return backButton(context, Colors.white);
            }
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
      padding: const  EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(),
          GestureDetector(
            onTap: () {
              Navigator.of(context!).push(
                MaterialPageRoute(
                  builder: (_) => const ProfileTabRestaurant(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: MyColors.bkgBanner,
                  boxShadow:const  <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff8f8f8),
                        blurRadius: 10,
                        spreadRadius: 10),
                  ],
                ),
                child: Image(image: image!),
              ),
            ),
          )
        ],
      ),
    )
    ),
 
  );
}


