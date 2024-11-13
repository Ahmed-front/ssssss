class ProductModel {
  List model;
  ProductModel({required this.model});
  factory ProductModel.fromJson(Map json) {
    return ProductModel(model: json["data"]["products"]);
  }
}
