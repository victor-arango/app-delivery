

import 'package:delivery/src/controllers/clientControllers/client_payments_create_controllers.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_document_type.dart';
import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/routes/routes.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class ClientPaymentsCreatePage extends StatefulWidget {
  const ClientPaymentsCreatePage({super.key});

  @override
  State<ClientPaymentsCreatePage> createState() =>
      _ClientPaymentsCreatePageState();
}

class _ClientPaymentsCreatePageState extends State<ClientPaymentsCreatePage> {
  final ClientPaymentCreateController _con = ClientPaymentCreateController();


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
;

    });
  }
    String? _selectedCategory;
  void _onCategorySelected(String? value) {
    print('Categoría seleccionada: $value');
    setState(() {
      _selectedCategory = value;
      _con.typeDocument = value!;
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
                        headerText(text: 'Pagar Pedido', color: MyColors.white),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              CreditCardWidget(
                glassmorphismConfig: _con.useGlassMorphism
                    ? Glassmorphism.defaultConfig()
                    : null,
                cardNumber: _con.cardNumber,
                expiryDate: _con.expiryDate,
                cardHolderName: _con.cardHolderName,
                labelCardHolder: 'Nombre y Apellido',
                cvvCode: _con.cvvCode,
                bankName: '',
                frontCardBorder: _con.useGlassMorphism
                    ? Border.all(color: Colors.grey)
                    : null,
                backCardBorder: _con.useGlassMorphism
                    ? Border.all(color: Colors.grey)
                    : null,
                showBackView: _con.isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: MyColors.cardBgColor,
                backgroundImage: _con.useBackgroundImage
                    ? 'assets/images/card_bg.png'
                    : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        
                        formKey: _con.formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: _con.cardNumber,
                        cvvCode: _con.cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: _con.cardHolderName,
                        expiryDate: _con.expiryDate,
                        themeColor: Colors.white,
                        textColor: Colors.white,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Numero',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: _con.border,
                          enabledBorder: _con.border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: _con.border,
                          enabledBorder: _con.border,
                          labelText: 'Fecha Expiracion',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: _con.border,
                          enabledBorder: _con.border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: _con.border,
                          enabledBorder: _con.border,
                          labelText: 'Nombre Titular',
                        ),
                        onCreditCardModelChange: _con.onCreditCardModelChange,
                      ),
                      // _documentInfo(con: _con,onChanged:_onCategorySelected,documentTypeList: []),
                      _DropDownCategory(con: _con,value: _selectedCategory,documentType:_con.documentTypeList,onChanged: _onCategorySelected),
                       
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: _con.createCardToken,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'Continuar',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (_con.formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void refresh() {
    setState(() {});
  }
}

class _DropDownCategory extends StatelessWidget {
  const _DropDownCategory({
    required this.documentType,
    required this.con,
    required this.onChanged,
    this.value,
  });
  final List<MercadoPagoDocumentType> documentType;
  final ClientPaymentCreateController con;
  final void Function(String?) onChanged;
  final String? value;
  List<DropdownMenuItem<String>> _dropDownItems(List<MercadoPagoDocumentType> documentType) {
    List<DropdownMenuItem<String>> list = [];
    documentType.forEach((document) {
      list.add(DropdownMenuItem(
        child: Text(document.name.toString()),
        value: document.id,
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
                        hint: headerText(text: 'T.Documento', fontSize: 12),
                        items: _dropDownItems(documentType),
                value: value,
                onChanged: onChanged,
                        
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
           Flexible(
            flex: 4,
            child: TextField(
              
  controller: con.documenNumerController,
  
  keyboardType: TextInputType.phone,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    
    labelText: 'Número Documento',
    labelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    // Establecer el color del texto en blanco
    hintStyle: TextStyle(color: Colors.white),
  ),
    style: const TextStyle(color: Colors.white),
),

          )
        ],
      ),
    );
  }
}

