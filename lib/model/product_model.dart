class ProductItemModel {
  final String imagePath;
  final String title;
  final double price;
  final double? oldPrice;
  final int? discount;
  final String parcelsInfo;
  final String productState;
  final DateTime createdAt;
  final String category;

  const ProductItemModel({
    required this.imagePath,
    required this.title,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.parcelsInfo,
    required this.productState,
    required this.createdAt,
    required this.category,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      imagePath: json['imagePath'],
      title: json['title'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice']?.toDouble(),
      discount: json['discount'],
      parcelsInfo: json['parcelsInfo'],
      productState: json['productState'],
      createdAt: DateTime.parse(json['createdAt'].toString()),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'title': title,
      'price': price,
      'oldPrice': oldPrice,
      'discount': discount,
      'parcelsInfo': parcelsInfo,
      'productState': productState,
      'createdAt': createdAt.toIso8601String(),
      'category': category
    };
  }
}
