
class Product {
  bool? success;
  int? statusCode;
  String? message;
  List<Data>? data;

  Product({this.success, this.statusCode, this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    statusCode = json["statusCode"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["statusCode"] = statusCode;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? productCode;
  String? name;
  double? price;
  int? stock;
  String? description;
  String? image;
  List<String>? categories;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.productCode, this.name, this.price, this.stock, this.description, this.image, this.categories, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    productCode = json["productCode"];
    name = json["name"];
    price = json["price"];
    stock = json["stock"];
    description = json["description"];
    image = json["image"];
    categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["productCode"] = productCode;
    _data["name"] = name;
    _data["price"] = price;
    _data["stock"] = stock;
    _data["description"] = description;
    _data["image"] = image;
    if(categories != null) {
      _data["categories"] = categories;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}