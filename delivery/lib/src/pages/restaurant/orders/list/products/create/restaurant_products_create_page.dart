
// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:io';


import 'package:delivery/src/controllers/restaurantsControllers/products/restaurant_products_create_controller.dart';
import 'package:delivery/src/features/presentations/custom-widgets/BackButtons/back_button.dart';
import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/models/category/category.dart';
import 'package:delivery/src/pages/restaurant/orders/list/tabs/profile_tab/View/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../../utils/extensions/screen_size.dart';
import '../../../../../../utils/my_colors.dart';

class RestaurantProductsCreatePage extends StatefulWidget {
  const RestaurantProductsCreatePage({super.key});

  @override
  State<RestaurantProductsCreatePage> createState() => _RestaurantProductsCreatePageState();
}

class _RestaurantProductsCreatePageState extends State<RestaurantProductsCreatePage> {

    final RestaurantProductController _con = RestaurantProductController();



  @override
  void initState() {
    super.initState();
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
     _con.init(context, refresh);
    });
  }

    String? _selectedCategory;

  void _onCategorySelected(String? value) {
    print('Categoría seleccionada: $value');
    setState(() {
      _selectedCategory = value;
      _con.idCategory = value!;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
    backgroundColor: MyColors.primaryColor,
    elevation: 0.0,
    leading:Builder(builder: (BuildContext context) {
                return backButton(context, Colors.white);
            }
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
      padding: const  EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(),
          GestureDetector(
            onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ProfileTabRestaurant(),
                ),
              );
            },
            child: CircleAvatar(
              
              radius: 20,
              backgroundImage: Image.network(
                _con.user?.image ?? 'assets/images/user.png',
                errorBuilder: (_, __, ___) {
                  return  Image.asset('assets/images/user.png');
                },
              ).image,
            ),
          ),
          
        ],
      ),
    )
    ),
 
  ),
      body: CustomScrollView(
        slivers: <Widget>[
           SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    _NameProduct(con: _con),
                    _DescriptionProduct(con: _con),
                    _PriceProduct(con: _con),
                    
                    const SizedBox(height: 20),  
                       _CardImage(con: _con,
                    imageFile: _con.imageFile1,
                    numberFile: 1,
                    ),
                    _CardImage(con: _con,
                    imageFile: _con.imageFile2,
                    numberFile: 2,
                    ),
                    _CardImage(con: _con,
                    imageFile: _con.imageFile3,
                    numberFile: 3,
                    ),
                        const SizedBox(height: 20),  
                        _DropDownCategory(
                          con: _con,
                          categories:_con.categories,
                          onChanged: _onCategorySelected,
                          value: _selectedCategory,
                      ),
                  
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

class _CardImage extends StatelessWidget {
  const _CardImage({
    
    required RestaurantProductController con,
    required this.imageFile,
    required this.numberFile,

  }) : _con = con;
  final  imageFile;
  final int numberFile;
  final RestaurantProductController _con;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      _con.showAlertDialog(numberFile);
    },
    child: imageFile != null 
    ?  Card(
          elevation: 3,
          child: InkWell(
            onTap: (){
              _con.showAlertDialog(numberFile);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              width: 600,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      
      Text(
    'Agregar Imagen',
    style: TextStyle(fontSize: 17.0, color: Colors.grey[600]),
                  ),
                  Icon(
    Icons.photo_camera,
    color: MyColors.primaryColor,
                  )
    ],
                  ),
                   Row(
      children: <Widget>[
        
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                              child: Image.file(
                                
                                imageFile,
                                
                              )
                        ),
                      ),
                    ],
                  ),
                ),
  
                ],
              ),
                 ],
            ),
            )
          )
          )
          :
          Card(
          elevation: 3,
          child: InkWell(
            onTap: (){
              _con.showAlertDialog(numberFile);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              width: 600,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      
      Text(
    'Agregar Imagen',
    style: TextStyle(fontSize: 17.0, color: Colors.grey[600]),
                  ),
                  Icon(
    Icons.photo_camera,
    color: MyColors.primaryColor,
                  )
    ],
                  ),
                   Row(
      children: <Widget>[
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                              child: const Image(image:
                              AssetImage('assets/images/no-image.png')
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
  
                ],
              ),
                 ],
            ),
            )
          )
          ),
  );
  }
}





class _NameProduct extends StatelessWidget {
  const _NameProduct({
    required RestaurantProductController con,
  }) : _con = con;

  final RestaurantProductController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal:10),
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:   ListTile(
        title: TextField(
          controller: _con.nameController,
          keyboardType: TextInputType.text,
          decoration:  const InputDecoration(
              hintText: 'Nombre del producto',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}



class _DescriptionProduct extends StatelessWidget {
  const _DescriptionProduct({
    required RestaurantProductController con,
  }) : _con = con;

  final RestaurantProductController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
             margin: const EdgeInsets.only(top: 25),

   
      padding: const EdgeInsets.symmetric(horizontal:10),
  
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:   ListTile(
        title: TextField(
          maxLines: 2,
          maxLength: 100,
          controller: _con.descripcionController,
          keyboardType: TextInputType.text,
          decoration: const   InputDecoration(
              contentPadding:  EdgeInsets.all(15),
              hintText: 'Descripcion del producto',
              border: OutlineInputBorder(borderSide: BorderSide.none)),
              
        ),
        
      ));
  }
}

class _PriceProduct extends StatelessWidget {
  const _PriceProduct({
    required RestaurantProductController con,
  }) : _con = con;

  final RestaurantProductController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
             margin: const EdgeInsets.only(top: 10),

      padding: const EdgeInsets.symmetric(horizontal:10),
  
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MyColors.divider)),
      ),
      child:   ListTile(
        title: TextField(
          maxLines: 1,
          controller: _con.priceController ,
          keyboardType: TextInputType.phone,
          decoration:    InputDecoration(
              contentPadding:  const EdgeInsets.all(15),
              hintText: 'Precio',
              suffixIcon: Icon(Icons.monetization_on,color: MyColors.primaryColor,),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ));
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    required RestaurantProductController con,
  }) : _con = con;

  final RestaurantProductController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth.getScreenWidth(context: context, multiplier: 0.1),
      height: 45.0,
      margin: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: (){
          _con.createProduct();
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




class _DropDownCategory extends StatelessWidget {
  const _DropDownCategory({
    required this.categories,
    required this.con,
    required this.onChanged,
    this.value,
  });

  final List<Category> categories;
  final RestaurantProductController con;
  final void Function(String?) onChanged;
  final String? value;

  List<DropdownMenuItem<String>> _dropDownItems(List<Category> categories) {
    List<DropdownMenuItem<String>> list = [];
    categories.forEach((category) {
      list.add(DropdownMenuItem(
        child: Text(category.name!),
        value: category.id,
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: MyColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: MyColors.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                headerText(
                    text: 'Categorias', fontWeight: FontWeight.w500)
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton(
                underline: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down_circle,
                    color: MyColors.primaryColor,
                  ),
                ),
                hint: headerText(text: 'Selecciona la categoria'),
                elevation: 3,
                isExpanded: true,
                items: _dropDownItems(categories),
                value: value,
                onChanged: onChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}