import 'package:delivery/src/features/presentations/login_page/login_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../custom-widgets/Headers/header_text.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final loginController _con = loginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(context),
          _contentProfile(),
        ],
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'profile-detail');
    },
    child: Container(
      margin: const EdgeInsets.only(top: 25),
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      color: MyColors.colorProfile,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            radius: 70,
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
                        text: 'Andrea Ortiz',
                        fontSize: 22,
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

Widget _contentProfile() {
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
