
import 'package:delivery/src/models/rol/rol.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../../controllers/clientControllers/client_profile_controller.dart';
import '../../../../../../../features/presentations/custom-widgets/Headers/header_text.dart';
import '../../../../../../../utils/extensions/screen_size.dart';



class ProfileTabClient extends StatefulWidget {
  const ProfileTabClient({super.key});

  @override
  State<ProfileTabClient> createState() => _ProfileTabClientState();
}

class _ProfileTabClientState extends State<ProfileTabClient> {
  final ClientProfileController _con = ClientProfileController();

  
 


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
      body: CustomScrollView(
        slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
              Column(
        children: [
          _Header(con: _con,),
          _ContentProfile(con: _con,),
             _con.user != null ? 
         (_con.user?.roles?.length ?? 0) > 1
          ? _RolesTile(con: _con)
          : Container() : Container(),
          _LogoutButton(con: _con),
        ],
      ),
          ])
          
          
          )
        ],
      ),
    );
  }




void refresh(){
  setState(() {
    
  });
}


}

class _RolesTile extends StatelessWidget {
  const _RolesTile({
    super.key,
    required ClientProfileController con,
  }) : _con = con;

  final ClientProfileController _con;

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

class _Header extends StatelessWidget {
  const _Header({
    required ClientProfileController con,
  }) : _con = con;

  final ClientProfileController _con;
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
                width:  screenHeight.getScreenHeight(
                      context: context, multiplier: 0.17),
                margin: const EdgeInsets.only(left: 20.0),
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
                          margin: const EdgeInsets.only(left: 5),
                          child: headerText(
                              text: 'Comprador Frecuente',
                              color: MyColors.white,
                              fontSize: 11),
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

class _ContentProfile extends StatelessWidget {
   const _ContentProfile({
    required ClientProfileController con,
  }) : _con = con;

  final ClientProfileController _con;



@override
Widget build(BuildContext context) { 
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(children: [
      _optionsProfile(
          image: const AssetImage('assets/images/noti.png'),
          options: 'Notificaciones'),
      _optionsProfile(
          image: const AssetImage('assets/images/payicon.png'),
          options: 'Metodo Pago'),
      _optionsProfile(
          image: const AssetImage('assets/images/rewardicon.png'),
          options: 'créditos de recompensa'),
      _optionsProfile(
          image: const AssetImage('assets/images/promoicon.png'),
          options: 'Codigo Promoción'),
      const SizedBox(
        height: 50,
      ),
      _optionsProfile(
          image: const AssetImage('assets/images/settingicon.png'),
          options: 'Configuraciones'),
      _optionsProfile(
          image: const AssetImage('assets/images/inviteicon.png'),
          options: 'Invita a tus amigos'),
      _optionsProfile(
          image: const AssetImage('assets/images/helpicon.png'),
          options: 'Ayuda'),
      _optionsProfile(
          image: const AssetImage('assets/images/abouticon.png'),
          options: 'Acerca de nosotros'),
         
       
    ]),
  );
}
}






Widget _optionsProfile({
  required ImageProvider image,
  String options = '',
  Function? func
}) {
  return ListTile(
    
    onTap: (){
      func;
    },
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
    required ClientProfileController con,
  }) : _con = con;

  final ClientProfileController _con;

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

