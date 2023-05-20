
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


import '../../../../../../../controllers/restaurantsControllers/restaurantProfileController.dart';
import '../../../../../../custom-widgets/Headers/header_text.dart';
import '../../../../../../../utils/extensions/screen_size.dart';


class ProfileTabRestaurant extends StatefulWidget {
  const ProfileTabRestaurant({super.key});

  @override
  State<ProfileTabRestaurant> createState() => _ProfileTabRestaurantState();
}

class _ProfileTabRestaurantState extends State<ProfileTabRestaurant> {
  final RestaurantProfileController _con = RestaurantProfileController();


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
          _CreateCategoriesTile(con: _con),
          _CreateProductsTile(con: _con),
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



class _RolesTile extends StatelessWidget {
  const _RolesTile({
    required RestaurantProfileController con,
  }) : _con = con;

  final RestaurantProfileController _con;

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
class _CreateCategoriesTile extends StatelessWidget {
  const _CreateCategoriesTile({
    required RestaurantProfileController con,
  }) : _con = con;

  final RestaurantProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
    
    onTap: _con.goToCategoriesCreate,    
       
        leading: const Image(
          
          image:  AssetImage('assets/images/categories.png'),
          width: 29,
          height: 29,
        ),
        title: headerText(text: 'Crear Categoria', fontWeight: FontWeight.w400),
        trailing: Icon(
          Icons.chevron_right,
          color: MyColors.gris,
        )),
    );
  }
}


class _CreateProductsTile extends StatelessWidget {
  const _CreateProductsTile({
    required RestaurantProfileController con,
  }) : _con = con;

  final RestaurantProfileController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
    
    onTap: _con.goToProductsCreate,    
       
        leading: const Image(
          
          image:  AssetImage('assets/images/categories.png'),
          width: 29,
          height: 29,
        ),
        title: headerText(text: 'Crear Productos', fontWeight: FontWeight.w400),
        trailing: Icon(
          Icons.chevron_right,
          color: MyColors.gris,
        )),
    );
  }
}





class _Header extends StatelessWidget {
  const _Header({
    required RestaurantProfileController con,
  }) : _con = con;

  final RestaurantProfileController _con;
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
              
            ],
          )
        ],
      ),
    ),
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
    required RestaurantProfileController con,
  }) : _con = con;

  final RestaurantProfileController _con;

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

