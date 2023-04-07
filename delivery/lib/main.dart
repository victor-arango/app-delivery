import 'package:flutter/material.dart';
import 'package:delivery/src/utils/my_colors.dart';

//Routes
import 'package:delivery/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: 'welcome',
        theme: ThemeData(
          primaryColor: MyColors.primaryColor,
        ));
  }
}
