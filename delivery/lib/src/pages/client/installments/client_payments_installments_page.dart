

// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:delivery/src/controllers/clientControllers/client_payments_installments_controllers.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_installment.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/routes/routes.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientPaymentsInstallmentsCreatePage extends StatefulWidget {
  final String? cardToken;

  const ClientPaymentsInstallmentsCreatePage({Key? key, this.cardToken}) : super(key: key);

  @override
  State<ClientPaymentsInstallmentsCreatePage> createState() =>
      _ClientPaymentsInstallmentsCreatePagePageState(cardToken: cardToken);
}

class _ClientPaymentsInstallmentsCreatePagePageState
    extends State<ClientPaymentsInstallmentsCreatePage> {
  final String? cardToken;
  final ClientPaymentInstallmentsController _con = ClientPaymentInstallmentsController();

  _ClientPaymentsInstallmentsCreatePagePageState({this.cardToken});

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh, cardToken); // Pasa el cardToken al método init del controlador
    });
  }



    String? _selectedCategory;
  void _onCategorySelected( value) {
    print('Categoría seleccionada: $value');
    setState(() {
   _con.selectedInstallments = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.primaryColor,
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  InkWell(
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
                    child:
                        headerText(text: 'Cuotas', color: MyColors.white),
                  )
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 17.0, horizontal: 10),
                  child: Stack(
                    children: const <Widget>[
                      Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textDescription(),
          _DropDownCategory(value: _selectedCategory,documentType: _con.installmentList, con: _con, onChanged: _onCategorySelected)
             // _DropDownInstallments(con: _con,value: _selectedCategory,installmentList:_con.installmentList,onChanged: _onCategorySelected),
        ],
      ),
      bottomNavigationBar: SizedBox(
                height: screenHeight.getScreenHeight(
                    context: context, multiplier: 0.20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
                  child: Column(
                    children: [
                      SizedBox(
                          width: screenHeight.getScreenHeight(
                              context: context, multiplier: 1),
                          child: 
                      Container(
                          width: screenHeight.getScreenHeight(
                              context: context, multiplier: 1),
                          height: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 209, 209, 209),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total A Pagar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.negro,
                                  ),
                                ),
                                Text(
                                  '${_con.totalPayment}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.negro,
                                  ),
                                ),
                              ], 
                            ),
                          )),
                      ),
                      
                        GestureDetector(
                        onTap:_con.payOrder,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 30),
                          child: Container(
                            height: 40,
                            width: screenHeight.getScreenHeight(
                                context: context, multiplier: 8),
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const  Center(
                              child:  Text(
                                 'Confirmar Pago',
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      
                    ],
                  
                  ),
                )
                
                ),
                
      
    );
  }



  void refresh() {
    setState(() {});
  }
}




Widget _textDescription(){
  return Container(
    margin: const EdgeInsets.all(30),
    child: headerText(text: 'Escoge el número de cuotas!', fontSize: 20),

  );
}


class _DropDownCategory extends StatelessWidget {
  const _DropDownCategory({
    required this.documentType,
    required this.con,
    required this.onChanged,
    this.value,
  });
  final List<MercadoPagoInstallment> documentType;
  final ClientPaymentInstallmentsController con;
  final void Function(String?) onChanged;
  final String? value;



  List<DropdownMenuItem<String>> _dropDownItems(List<MercadoPagoInstallment> installmentList) {
    List<DropdownMenuItem<String>> list = [];
    installmentList.forEach((installment) {
      list.add(DropdownMenuItem(
        child: Text('${installment.installments}'),
        value: '${installment.installments}',
      ));
    });
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Material(
              elevation: 2.0,
              color: MyColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButton(
                        underline: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: MyColors.primaryColor,
                          ),
                        ),
                        elevation: 3,
                        isExpanded: true,
                        hint: headerText(text: 'Selecciona las Cuotas', fontSize: 12),
                        items: _dropDownItems(con.installmentList),
                value: con.selectedInstallments,
                onChanged: onChanged,
                        
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}



