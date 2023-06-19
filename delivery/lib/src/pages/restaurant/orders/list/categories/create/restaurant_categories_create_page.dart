import 'package:delivery/src/controllers/restaurantsControllers/categories/restaurant_categories_create_controller.dart';
import 'package:delivery/src/pages/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../../utils/extensions/screen_size.dart';
import '../../../../../../utils/my_colors.dart';

class RestaurantCategoriesCreatePage extends StatefulWidget {
  const RestaurantCategoriesCreatePage({super.key});
  @override
  State<RestaurantCategoriesCreatePage> createState() => _RestaurantCategoriesCreatePageState();
}
class _RestaurantCategoriesCreatePageState extends State<RestaurantCategoriesCreatePage> {
    final RestaurantCategoriController _con = RestaurantCategoriController();
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            centerTitle: true,
            title: headerText(text: 'Nueva Categoria', color: MyColors.white),
            backgroundColor: MyColors.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1545575950-59f935d6521c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1.3),
                    ),
                  ),
              
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
                return backButton(context, Colors.white);
            }),
          ),
           SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    _NameCategory(con: _con),
                    _DescriptionCategory(con: _con),                    
                  ],
                ),
              ),
            ),
          ]))
      ],       
      ),
      bottomNavigationBar: _CreateButton(con: _con),
    );
  }
   void refresh() {
    setState(() {});
  }
}

class _NameCategory extends StatelessWidget {
  const _NameCategory({
    required RestaurantCategoriController con,
  }) : _con = con;
  final RestaurantCategoriController _con;
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(10),
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:   ListTile(
        title: TextField(
          controller: _con.nameController,
          keyboardType: TextInputType.emailAddress,
          decoration:  const InputDecoration(
              hintText: 'Nombre de la Categoria',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}

class _DescriptionCategory extends StatelessWidget {
  const _DescriptionCategory({
    required RestaurantCategoriController con,
  }) : _con = con;
  final RestaurantCategoriController _con;
  @override
  Widget build(BuildContext context) {
    return Container(
             margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:   ListTile(
        title: TextField(
          maxLines: 3,
          maxLength: 255,
          controller: _con.descripcionController,
          keyboardType: TextInputType.emailAddress,
          decoration: const   InputDecoration(
              contentPadding:  EdgeInsets.all(15),
              hintText: 'Descripcion de la Categoria',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    required RestaurantCategoriController con,
  }) : _con = con;
  final RestaurantCategoriController _con;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.1),
      height: 45.0,
      margin: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: (){
          _con.createCategory();
        },
        // onPressed: _con.isEnable ? _con.register : (){},
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0))),
        child: const Text(
          'Crear Categoria',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}