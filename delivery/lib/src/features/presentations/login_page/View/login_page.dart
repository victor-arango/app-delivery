import 'package:flutter/material.dart';
import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/utils/my_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Container(
              //     width: double.infinity,
              //     height: 350.0,
              //     child: SlideShow(
              //       slides: <Widget>[
              //         Image.network(
              //             'https://images.unsplash.com/photo-1541592391523-5ae8c2c88d10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
              //         Image.network(
              //             'https://images.unsplash.com/photo-1457460866886-40ef8d4b42a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
              //         Image.network(
              //             'https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              //       ],
              //     )),

              const Image(
                  width: double.infinity,
                  height: 350.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1541592391523-5ae8c2c88d10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
              Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: backButton(context, Colors.white))
            ],
          ),
          Transform.translate(
            offset: const Offset(0.0, -20.0),
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Bienvenido Nuevamente',
                          style: TextStyle(
                              color: MyColors.primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 0.0),
                        child: Text(
                          'Inicia Sesión en tu cuenta',
                          style: TextStyle(
                            color: MyColors.gris,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      _emailInput(),
                      _passwordInput(),
                      _loginButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'forgot-password');
                          },
                          child: const Text(
                            'Olvidaste tu contraseña ?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No tienes una cuenta ?',
                              style: TextStyle(
                                  color: MyColors.gris,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'sing-up');
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Registrate',
                                  style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: MyColors.gris, borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'tabs');
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
    ),
  );
}
