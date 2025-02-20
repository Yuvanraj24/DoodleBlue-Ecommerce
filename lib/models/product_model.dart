class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  ProductRating? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  static ProductModel empty() => ProductModel();

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? ProductRating.fromJson(json['rating']) : null;
  }
}

class ProductRating {
  num? rate;
  int? count;

  ProductRating({this.rate, this.count});

  ProductRating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
