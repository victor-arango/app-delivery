import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_card_token.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_installment.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_issuer.dart';
import 'package:delivery/src/models/mercado_pago/mercado_pago_payment_method_installments.dart';
import 'package:delivery/src/models/product/product.dart';
import 'package:delivery/src/models/users/user.dart';
import 'package:delivery/src/provider/mercado_pago_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../pages/custom-widgets/my_snackbar.dart';

class ClientPaymentInstallmentsController {
  String? _cardToken;

  BuildContext? context;
  Function? refresh;
  List<Product> selectedProducts = [];

  User? user;
  final SharedPref _sharedPref = SharedPref();
  final MercadoPagoProvider _mercadoPagoProvider = MercadoPagoProvider();

  double totalPayment = 0;
  MercadoPagoPaymentMethodInstallments? installments;
  List<MercadoPagoInstallment> installmentList = [];
  MercadoPagoIssuer? issuer;
  String? selectedInstallments;

  Future<void> init(BuildContext context, Function refresh, String? cardToken) async {
    this.context = context;
    this.refresh = refresh;
    _cardToken = cardToken;

    print('CARD TOKEN ARGUMENTS: $cardToken');

    var orderData = await _sharedPref.read('order');
    selectedProducts = orderData != null ? Product.fromJsonList(orderData).toList : [];
    user = User.fromJson(await _sharedPref.read('user'));
    _mercadoPagoProvider.init(context, user!);

    gettotalPayment();
    getInstallments();
  }

  void getInstallments() async {
    print('Ejecutando el Installments: $_cardToken');

    if (_cardToken != null) {
      installments = await _mercadoPagoProvider.getInstallments(_cardToken!, totalPayment);
    }

    if (installments != null) {
      installmentList = installments!.payerCosts;
      issuer = installments!.issuer;

      print('INSTALLMENTS: ${installments?.toJson()}');
      refresh!();
    } else {
      // Manejo del caso en que 'installments' sea nulo
      // Puedes lanzar una excepción, mostrar un mensaje de error, o realizar alguna otra acción adecuada para tu aplicación.
    }
  }
    void payOrder() async{

 MySnackbar.show(
        context: context,
        contentType: ContentType.success,
        text: 'El pago se efectuo correctamente',
        title: '',
 );
      await _sharedPref.remove('order');
       Navigator.pushReplacementNamed(context!, 'client/products/list');
      // Navigator.pushAndRemoveUntil(context!, 'client/products/list' as Route<String?>, (route) => false);
  }

  void gettotalPayment() {
    selectedProducts.forEach((product) {
      totalPayment = totalPayment + ((product.quantify)! * product.price!);
    });
    refresh!();
  }
}
