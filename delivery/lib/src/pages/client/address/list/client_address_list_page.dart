
import 'package:delivery/src/controllers/clientControllers/client_address_list_controller.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/pages/custom-widgets/no_data_widget/no_data_widget.dart';
import 'package:delivery/src/models/address/address.dart';
import 'package:delivery/src/pages/client/list/tabs/profile_tab/View/client/profile_tab_client.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientAddressListPage extends StatefulWidget {
  const ClientAddressListPage({super.key});

  @override
  State<ClientAddressListPage> createState() => _ClientAddressListPageState();
}

class _ClientAddressListPageState extends State<ClientAddressListPage> {

  final ClientAddressListcontroller _con = ClientAddressListcontroller();


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
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.white,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ProfileTabClient(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.red,
                        backgroundImage: Image.network(
                          _con.user?.image ?? 'assets/images/user.png',
                          errorBuilder: (_, __, ___) {
                            return Image.asset('assets/images/user.png');
                          },
                        ).image,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      alignment: Alignment.center,
                    child: headerText(text: 'Mis Direcciones'),
                  )
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap: _con.goToNewAddress,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 10),
                    child: Stack(
                      children: const <Widget>[
                         Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                        //
                      ],
                    ),
                  ),
                ),
              ],
              
        ),
            bottomNavigationBar:   SizedBox( 
               height: screenHeight.getScreenHeight(
                context: context, multiplier: 0.15),
              
           
            child: Column(
              children: [
               GestureDetector(
            onTap: _con.createOrder,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              child: Container(
                height: 55,
                width: screenHeight.getScreenHeight(
                    context: context, multiplier: 8),
                decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child:const  Center(
                  child: Text(
                    'Continuar ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
         
              ],
            ),
        
          
            ),
        body:  Stack(
          children: [
          
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: headerText(text: 'Elige donde recibir tus compras', fontSize: 19)),

               Container(
                margin: const EdgeInsets.only(top: 60),
                 child: FutureBuilder(
                             future: _con.getAddress(_con.userId.toString()),
                             builder: (context, AsyncSnapshot<List<Address>> snapshot){
               
                  if(snapshot.hasData){
                    if((snapshot.data?.length)! > 0){
                      return ListView.builder(
                  padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 20), 
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder:(_, index){
                    return _radiusSelectorAddress(con: _con, address: snapshot.data![index], index: index);
                  }
                  
                  );
               
                    }else{
                      return EmptyWidget(text: 'No tienes direcciones agregadas',);
                    }
                  }else{
                      return EmptyWidget(text: 'No tienes direcciones agregadas',);
               
                  }
                             
                           }
                           
                           ),
               ),
          
        
        

        ],)
        
        
         
      
        );

 
  }
  void refresh(){
    setState(() {
      
    });
  }


}

class _radiusSelectorAddress extends StatelessWidget {
  const _radiusSelectorAddress({
    required this.con,
    required this.address,
    required this.index,
  });

  final ClientAddressListcontroller con;
  final Address? address;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio(
                  value: index,
                  groupValue: con.radioValue,
                  onChanged: (index){
                    con.handleRadioValueChange(index!.toInt());
                  },
                ),
                Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: headerText(text: address?.address ?? '', fontSize: 13)),
                   
                    Container(
                      alignment: Alignment.centerRight,
                      child: headerText(text: address?.neighborhood ?? '', fontSize: 13, fontWeight: FontWeight.w400)),
                   
            
                  ],
                ),
              Divider(color: MyColors.divider)                         
              ],
              
            ),
            
          
                
      
    );
  }
}


