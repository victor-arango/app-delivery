// ignore_for_file: unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

class MercadoPagoFinancialInstitution {

  String? id;
  String? description;

  List<MercadoPagoFinancialInstitution> institutionList =[];

  MercadoPagoFinancialInstitution();

  MercadoPagoFinancialInstitution.fromJsonList( List<dynamic> jsonList  ){
    if ( jsonList == null ) {
      return;
    }
    jsonList.forEach((item) {
      final chat = MercadoPagoFinancialInstitution.fromJsonMap(item);
      institutionList.add(chat);
    });
  }

  MercadoPagoFinancialInstitution.fromJsonMap( Map<String, dynamic> json ) {
    id            = json['id'];
    description   = json['description'];
  }

  Map<String, dynamic> toJson() =>
      {
        'id'          : id,
        'description' : description
      };
}