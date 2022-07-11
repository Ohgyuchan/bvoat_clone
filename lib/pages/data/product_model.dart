class ProductModel {
  final int id;
  final String title;
  final String brand;
  final String description;
  final String price;

  ProductModel(
      {required this.id,
      required this.title,
      required this.brand,
      required this.description,
      required this.price});

  String get getAssetName => 'assets/$id.jpeg';
}
