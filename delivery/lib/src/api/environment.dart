import 'package:delivery/src/models/mercado_pago/mercado_pago_credentials.dart';

class Environment {
  // ignore: constant_identifier_names
  static const String API_DELIVERY = '192.168.1.3:3000';
  // ignore: constant_identifier_names
  static const String API_KEY_MAPS = 'AIzaSyA2wb17jnrnqpqspD0h7kCQJm-4LZI_Wbg';
  static MercadoPagoCredentials mercadoPagoCredentials = MercadoPagoCredentials(
    publicKey: 'TEST-c121d1be-46bf-4757-9712-119d6637cbd8', 
    accessToken: 'TEST-980686583810200-052821-0598734a07c610c39b268be2474ee9b4-1385327954'
  );
}
