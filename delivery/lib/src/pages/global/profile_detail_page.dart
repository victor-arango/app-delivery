import 'package:delivery/src/pages/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/controllers/profile_detail_controller.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/styles/box_decoration_shadows.dart';


class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  

    final UpdateProfileController _con = UpdateProfileController();

  @override
  void initState() {
 
    super.initState();


    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }




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
            child: GestureDetector(
              onTap: _con.isEnable ? _con.update : null,
              child: Container(
                padding: const EdgeInsets.only(top: 20, right: 15.0),
                child: headerText(
                    text: 'Listo',
                    color: MyColors.primaryColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            GestureDetector(
               onTap: _con.showAlertDialog,
              child: Container(
                decoration: createDecorationWithShadows(),
                margin: EdgeInsets.only(
                    top: screenHeight.getScreenHeight(
                        context: context, multiplier: 0.1),
                    left: 15,
                    right: 15),
                width: screenWidth.getScreenWidth(context: context),
                height: screenHeight.getScreenHeight(
                    context: context, multiplier: 0.65),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -60),
                        child: CircleAvatar(
            
                  backgroundImage: _con.imageFile != null
                      ? FileImage(_con.imageFile!)
                      : (_con.user?.image) != null ? NetworkImage(_con.user!.image!) : 
                      const AssetImage('assets/images/user.png')
                          as ImageProvider,
                          radius: 60,
                  backgroundColor: MyColors.white,
                ),
                    ),
                    _Username(con: _con),
                    _LastName(con: _con), 
                   _PhoneInput(con: _con)
                    
                  ],
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }

    void refresh() {
    setState(() {});
  }
}







class _Username extends StatelessWidget {
  const _Username({
    required UpdateProfileController con,
  }) : _con = con;

  final UpdateProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:  ListTile(
        title: TextField(
          controller: _con.nameController,
          keyboardType: TextInputType.emailAddress,
          decoration:const  InputDecoration(
              hintText: 'Nombres',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}



class _LastName extends StatelessWidget {
  const _LastName({
    required UpdateProfileController con,
  }) : _con = con;

  final UpdateProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:  ListTile(
        title: TextField(
          controller: _con.lastNameController,
          keyboardType: TextInputType.text,
          maxLines: 2,
          decoration:const InputDecoration(
              hintText: 'Apellidos',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}






class _PhoneInput extends StatelessWidget {
  const _PhoneInput({
    required UpdateProfileController con,
  }) : _con = con;

  final UpdateProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:  ListTile(
        title: TextField(
          controller: _con.phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              hintText: 'Número Telefono',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}
