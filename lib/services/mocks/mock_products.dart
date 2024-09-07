// import '../../../modules/dashboard/model/product_model.dart';

abstract class ProductsMock {
  static Map<String, dynamic> json() {
    return {
      'code': '200',
      'message': 'success',
      'data': [
        {
          "category": "Dentística e Estética",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/conditioner.png",
          "title": "Condicionador Ácido Fosfórico 37% - AllPrime",
          "price": 29.90,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now()
        },
        {
          "category": "Dentística e Estética",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/conditioner.png",
          "title": "Condicionador Ácido Fosfórico 37% - AllPrime",
          "price": 290.90,
          "oldPrice": 300.00,
          "discount": 10,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now()
        },
        {
          "category": "Descartáveis",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/mask.png",
          "title": "Máscaras Descartáveis Brancas - NTFlex",
          "price": 8.78,
          "oldPrice": 19.99,
          "discount": 56,
          "parcelsInfo": "Em até 12x de R\$ 0,73",
          "productState": "NOVO",
          "createdAt": DateTime.now().subtract(const Duration(days: 1)),
        },
        {
          "category": "Dentística e Estética",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/conditioner.png",
          "title": "Condicionador Ácido Fosfórico 37% - AllPrime",
          "price": 29.90,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now().subtract(const Duration(days: 1)),
        },
        {
          "category": "Descartáveis",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/mask.png",
          "title": "Máscaras Descartáveis Brancas - NTFlex",
          "price": 29.90,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now().subtract(const Duration(days: 1)),
        },
        {
          "category": "Descartáveis",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/mask.png",
          "title": "Máscaras Descartáveis Brancas - NTFlex",
          "price": 29.90,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now().subtract(const Duration(days: 5)),
        },
        {
          "category": "Descartáveis",
          "imagePath": "https://raw.githubusercontent.com/claylton/corelab_app_challenge/main/assets/images/mask.png",
          "title": "Máscaras Descartáveis Brancas - NTFlex",
          "price": 29.90,
          "parcelsInfo": "Em até 12x de R\$ 249,00",
          "productState": "NOVO",
          "createdAt": DateTime.now().subtract(const Duration(days: 6)),
        },
      ],
    };
  }
}
