// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_document_type.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_payment_method_installments.dart';
import 'package:delivery/src/models/order/order.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class MercadoPagoProvider{
final String _urlMercadoPago = 'api.mercadopago.com';
final String _url = Environment.API_DELIVERY;
final _mercadoPagoCredentials = Environment.mercadoPagoCredentials;

BuildContext? context;
User? user;



Future<void> init(BuildContext context, User user) async {
  this.context = context;
  this.user = user;
}

Future<List<MercadoPagoDocumentType>> getIdentificationtypes() async{
  try{
    final url = Uri.https(_urlMercadoPago, '/v1/identification_types',{
      'access_token': _mercadoPagoCredentials.accessToken
    });

    final res = await http.get(url);
    final data = json.decode(res.body);
    final result = MercadoPagoDocumentType.fromJsonList(data);
    return result.documentTypeList;



  }catch(e){
    print('Error: $e');
    return [];
  }
}



Future<http.Response?> createPayment({
required String cardId,
required double transactionAmout,
required int installments,
required String paymentMethodId,
required String paymentTypeId,
required String issuerId,
required String emailCustomer,
required String cardToken,
required String identificationType,
required String identificationNumber,
required Order order,
}) async{

  try {
    final url = Uri.http(_url,'/api/payments/create',{
        '/api/payments/create': _mercadoPagoCredentials.publicKey,

      
      });
    Map<String, dynamic> body ={
                'description': 'App-delivery',
                'transaction_amout':transactionAmout,
                'installments': installments,
                'payment_method_id': paymentMethodId,
                'token': cardToken,
                'payer':{
                    'email':emailCustomer,
                    'identification':{
                        'type': identificationType,
                        'number': identificationNumber,

                    }
                }
            };


            String bodyParams = json.encode(body);

             Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': user!.sessionToken.toString()
      };

      final res = await http.post(url, headers: headers, body: bodyParams);
       if(res.statusCode == 401){ //No autorizado
      Fluttertoast.showToast(msg: 'La sesion Expiro');
      SharedPref().logout(context!, user!.id.toString());
      return null;
      }

      return res;
  } catch (e) {
    print('error: ${e}');
    return null;
  }

}


Future<MercadoPagoPaymentMethodInstallments?> getInstallments(String bin, double amount) async {
  try {
    final url = Uri.https(
      _urlMercadoPago,
      '/v1/payment_methods/installments',
      {
        'access_token': _mercadoPagoCredentials.accessToken,
        'bin': bin,
        'amount': amount.toString(),
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = MercadoPagoPaymentMethodInstallments.fromJsonList(data);
      return result.installmentList.first;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      // Manejar el error de acuerdo a tus necesidades
      throw Exception('Error en la solicitud de cuotas');
    }
  } catch (e) {
    print('Error: $e');
    // Manejar el error de acuerdo a tus necesidades
    throw Exception('Error en la obtención de cuotas');
  }
}




Future<http.Response> createCardToken({
  String? cvv,
  String? expirationYear,
  int? expirationMonth,
  String? cardNumber,
  String? documentNumber,
  String? documentId,
  String? cardHolderName,
}) async {
  try {
    final url = Uri.https(_urlMercadoPago, '/v1/card_tokens', {
      'public_key': _mercadoPagoCredentials.publicKey
    });

    final body = {
      'security_code': cvv,
      'expiration_year': expirationYear,
      'expiration_month': expirationMonth,
      'card_number': cardNumber,
      'card_holder': {
        'identification': {
          'number': documentNumber,
          'type': documentId,
        },
        'name': cardHolderName
      },
    };

    final res = await http.post(url, body: json.encode(body));
    return res;
  } catch (e) {
    print('Error: $e');
    return http.Response('', 500); // O devuelve un objeto de respuesta vacío o maneja el error de otra manera.
  }
}


}



