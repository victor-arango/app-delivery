
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../../controllers/deliveryControllers/delivery_profile_controller.dart';
import '../../../../../../custom-widgets/Headers/header_text.dart';
import '../../../../../../../utils/extensions/screen_size.dart';


class ProfileTabDelivery extends StatefulWidget {
  const ProfileTabDelivery({super.key});

  @override
  State<ProfileTabDelivery> createState() => _ProfileTabdeliveryState();
}

class _ProfileTabdeliveryState extends State<ProfileTabDelivery> {
  final DeliveryProfileController _con = DeliveryProfileController();


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
      key: _con.key,
      body: Column(
        children: [
          _Header(con: _con,),
          _contentProfile(),
              _con.user != null ? 
         (_con.user?.roles?.length ?? 0) > 1
          ? _RolesTile(con: _con)
          : Container() : Container(),
          _LogoutButton(con: _con),
        ],
      ),
    );
  }

void refresh(){
  setState(() {
    
  });
}


}

class _Header extends StatelessWidget {
  const _Header({
    required DeliveryProfileController con,
  }) : _con = con;

  final DeliveryProfileController _con;
  @override
Widget build(BuildContext context) {

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'profile-detail');
    },
    child: Container(
      margin: const EdgeInsets.only(top: 25),
      height: 250,
      width:  screenHeight.getScreenHeight(
                      context: context, multiplier: 1),
      padding: const EdgeInsets.all(50),
      color: MyColors.colorProfile,
      child: Row(
        children: [
            CircleAvatar(
            radius: 55,
            backgroundImage: Image.network(
              _con.user?.image ?? 'assets/images/crown.png',
              errorBuilder: (_, __, ___) {
                return  Image.asset('assets/images/crown.png');
              },
            ).image,
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    headerText(
                        text: '${ _con.user?.name ?? ''} ${_con.user?.lastname ?? ''}',
                        fontSize: screenHeight.getScreenHeight(
                      context: context, multiplier: 0.022),
                        fontWeight: FontWeight.w600),
                    IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        color: MyColors.gris,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                width:  screenWidth.getScreenWidth(
                      context: context, multiplier: 0.4),
                margin: const EdgeInsets.only(left: 10.0),
                height: 25,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        backgroundColor: MyColors.primaryColor),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/crown.png'),
                          width: 16,
                          height: 16,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: headerText(
                              text: 'Repartidor Destacado',
                              color: MyColors.white,
                              fontSize: 10),
                        )
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    ),
  );
}
}


class _RolesTile extends StatelessWidget {
  const _RolesTile({
    super.key,
    required DeliveryProfileController con,
  }) : _con = con;

  final DeliveryProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
    
    onTap: _con.goToRoles,    
       
        leading: const Image(
          
          image:  AssetImage('assets/images/reset.png'),
          width: 29,
          height: 29,
        ),
        title: headerText(text: 'Seleccionar Rol', fontWeight: FontWeight.w400),
        trailing: Icon(
          Icons.chevron_right,
          color: MyColors.gris,
        )),
    );
  }
}

Widget _contentProfile() {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(children: [
      _optionsProfile(
          image: const AssetImage('assets/images/noti.png'),
          options: 'Notificaciones'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/payicon.png'),
      //     options: 'Metodo Pago'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/rewardicon.png'),
      //     options: 'créditos de recompensa'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/promoicon.png'),
      //     options: 'Codigo Promoción'),
      // const SizedBox(
      //   height: 50,
      // ),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/settingicon.png'),
      //     options: 'Configuraciones'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/inviteicon.png'),
      //     options: 'Invita a tus amigos'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/helpicon.png'),
      //     options: 'Ayuda'),
      // _optionsProfile(
      //     image: const AssetImage('assets/images/abouticon.png'),
      //     options: 'Acerca de nosotros'),
    ]),
  );
}

Widget _optionsProfile({
  required ImageProvider image,
  String options = '',
}) {
  return ListTile(
      leading: Image(
        image: image,
        width: 29,
        height: 29,
      ),
      title: headerText(text: options, fontWeight: FontWeight.w400),
      trailing: Icon(
        Icons.chevron_right,
        color: MyColors.gris,
      ));

}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    required DeliveryProfileController con,
  }) : _con = con;

  final DeliveryProfileController _con;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        onTap: _con.logout,
        leading: const Image(
          image: AssetImage('assets/images/logout.png'),
          width: 29,
          height: 29,
        ),
        title: headerText(text: 'Cerrar sesión', fontWeight: FontWeight.w400),
        ),
    );
  }



}

