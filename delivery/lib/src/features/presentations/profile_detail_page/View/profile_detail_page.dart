import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/styles/box_decoration_shadows.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primarOpacityyColor,
      appBar: AppBar(
        centerTitle: true,
        title: headerText(text: 'Editar Perfil', fontSize: 17),
        backgroundColor: MyColors.white,
        elevation: 0.4,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20, right: 15.0),
              child: headerText(
                  text: 'Listo',
                  color: MyColors.primaryColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              decoration: createDecorationWithShadows(),
              margin: EdgeInsets.only(
                  top: screenHeight.getScreenHeight(
                      context: context, multiplier: 0.1),
                  left: 15,
                  right: 15),
              width: screenWidth.getScreenWidth(context: context),
              height: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.7),
              child: Column(),
            )
          ]))
        ],
      ),
    );
  }
}
