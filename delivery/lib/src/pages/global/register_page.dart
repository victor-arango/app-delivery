import 'package:delivery/src/pages/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/pages/global/register_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:delivery/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../custom-widgets/Headers/header_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final RegisterController _con = RegisterController();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    _AvatarUser(con: _con),
                    headerText(
                        text: 'Crea una cuenta',
                        color: MyColors.primaryColorDark,
                        fontSize: 25.0),
                    _Username(con: _con),
                    _LastName(
                      con: _con,
                    ),
                    _EmailInput(con: _con),
                    _PhoneInput(con: _con),
                    _PasswordInput(con: _con),
                    _ConfirmPasswordInput(con: _con),
                    _SingUpButton(con: _con),
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}

class _AvatarUser extends StatelessWidget {
  const _AvatarUser({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _con.showAlertDialog,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: createDecorationWithShadows(
                borderRadius: BorderRadius.circular(65)),
            width: 142,
            height: 142,
            child: CircleAvatar(
              backgroundImage: _con.imageFile != null
                  ? FileImage(_con.imageFile!)
                  : const AssetImage('assets/images/user.png')
                      as ImageProvider,
              backgroundColor: MyColors.white,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -35),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.camera_alt,
                color: MyColors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SingUpButton extends StatelessWidget {
  const _SingUpButton({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      margin: const EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        onPressed: _con.isEnable ? _con.register : (){},
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: const Text(
          'Registrar',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.confirmPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: ' Confirmar Contraseña',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Contraseña',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: 'Telefono',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class _LastName extends StatelessWidget {
  const _LastName({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.lastNameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: 'Apellidos',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 40.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: 'Nombre',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({
    required RegisterController con,
  }) : _con = con;

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: MyColors.gris, borderRadius: BorderRadius.circular(40.0)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}