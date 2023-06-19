// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_card_token.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_document_type.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/pages/custom-widgets/my_snackbar.dart';
import 'package:delivery/src/provider/mercado_pago_provider.dart';
import 'package:delivery/src/routes/routes.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:http/http.dart';

class ClientPaymentCreateController {
  BuildContext? context;
  Function? refresh;
  User? user;
  final SharedPref _sharedPref = SharedPref();

  TextEditingController documenNumerController = TextEditingController();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<MercadoPagoDocumentType> documentTypeList = [];
  final MercadoPagoProvider _mercadoPagoProvider = MercadoPagoProvider();

  String typeDocument = 'CC';
  String? expirationYear;
  int? expirationMonth;
  MercadoPagoCardToken? cardToken;

  Future<void> init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    _mercadoPagoProvider.init(context, user!);
    getIdentificationTypes();
    refresh();
  }

  void getIdentificationTypes() async {
    documentTypeList = await _mercadoPagoProvider.getIdentificationtypes();
    refresh!();
  }




  void createCardToken() async {
    String documentNumber = documenNumerController.text;

    if (cardNumber.isEmpty) {
      MySnackbar.show(
        context: context,
        contentType: ContentType.warning,
        text: 'Ingresa el número de la tarjeta',
        title: 'Alerta',
      );
      return;
    }

    if (expiryDate.isEmpty) {
      MySnackbar.show(
        context: context,
        contentType: ContentType.warning,
        text: 'Ingresa la fecha de expiración de la tarjeta',
        title: 'Alerta',
      );
      return;
    }

    if (cvvCode.isEmpty) {
      MySnackbar.show(
        context: context,
        contentType: ContentType.warning,
        text: 'Ingresa el código CCV de la tarjeta',
        title: 'Alerta',
      );
      return;
    }
    if (cardHolderName.isEmpty) {
      MySnackbar.show(
        context: context,
        contentType: ContentType.warning,
        text: 'Ingresa el titular de la tarjeta',
        title: 'Alerta',
      );
      return;
    }
    if (documentNumber.isEmpty) {
      MySnackbar.show(
        context: context,
        contentType: ContentType.warning,
        text: 'Ingresa el número del documento',
        title: 'Alerta',
      );
      return;
    }

    if (expiryDate != null) {
      List<String> list = expiryDate.split('/');
      if (list.length == 2) {
        expirationMonth = int.parse(list[0]);
        expirationYear = '20${list[1]}';
      } else {
        MySnackbar.show(
          context: context,
          contentType: ContentType.warning,
          text: 'Ingresa el Mes y el Año de expiración',
          title: 'Alerta',
        );
      }
    }

    if (cardNumber != null) {
      cardNumber = cardNumber.replaceAll(RegExp(' '), '');
    }

    Response response = await _mercadoPagoProvider.createCardToken(
      cvv: cvvCode,
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      documentId: typeDocument,
      documentNumber: documentNumber,
      expirationYear: expirationYear,
      expirationMonth: expirationMonth,
    );

    if (response != null) {
      final data = json.decode(response.body);

      if (response.statusCode == 201) {
        cardToken = MercadoPagoCardToken.fromJsonMap(data);
        print('JSON CARD TOKEN: ${cardToken?.toJson()}');
        // Navigator.pushNamed(
        //   context!,
        //   'client/payments/installments',
        //   arguments: {
        //     'identification_type' :typeDocument,
        //     'identification_number' :documentNumber,
        //     'card_token': cardToken?.toJson()

        //   },
        // );
        print('JSON CARD TOKEN: ${cardToken?.toJson()}');
        Navigator.pushNamed(
          context!,
          'client/payments/installments',
          arguments: Arguments(cardToken: cardToken?.firstSixDigits),
        );
      } else {
        print('Se produjo un error al generar el token');
        int? status = int.tryParse(data['cause'][0]['code'] ?? data['status']);
        String message = data['message'] ?? 'Error al registrar la tarjeta';
        MySnackbarResponseApi.show(
          context: context,
          title: false,
          contentType: false,
          text: 'status Code $status - $message',
        );
      }
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    refresh!();
  }
}
