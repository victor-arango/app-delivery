import 'package:delivery/src/models/rol/rol.dart';
import 'package:delivery/src/pages/roles/roles_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/extensions/screen_size.dart';
import '../../utils/my_colors.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {

  final RolesController _con = RolesController();

  @override
  void initState() {

    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context,refresh);
    });
  } 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('Selecciona un rol'),
      ),
      body: Container(
        margin: EdgeInsets.only(top:  screenHeight.getScreenHeight(
                      context: context, multiplier: 0.14), ),
        // ignore: unnecessary_null_comparison
        child: ListView(children: _con.user != null ? _con.user!.roles!.map((Rol rol){
          return _cardRol(rol);
        }).toList() : []
        ),
      ),
     );
  }


  Widget _cardRol(Rol rol){

    return GestureDetector(
      onTap: (){
        _con.goToPage(rol.route.toString());
      },
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: FadeInImage(
            image: rol.image != null
                ? NetworkImage(rol.image.toString()) as ImageProvider
                :const AssetImage('assets/images/no-camera.png'),
              fit: BoxFit.contain,
              fadeInDuration: (const Duration(milliseconds: 50)),
              placeholder: const AssetImage('assets/images/no-camera.png'),
            ),
    
          ),
          const SizedBox(height: 15,),
          Text(
            rol.name ?? '',
            style: TextStyle(fontSize: 16,
            color: MyColors.negro),
          ),
    
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  void refresh(){
    setState(() {
      
    });
  }





}
