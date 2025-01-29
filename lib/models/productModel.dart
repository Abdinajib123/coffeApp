class Productmodel {
  String? sId;
  String? name;
  String? image;
  String? shortDescription;
  String? longDescription;
  double? price;
  int? qty;

  Productmodel(
      {this.sId,
      this.name,
      this.image,
      this.shortDescription,
      this.longDescription,
      this.price,
      this.qty});

  Productmodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    price = json['price'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['shortDescription'] = this.shortDescription;
    data['longDescription'] = this.longDescription;
    data['price'] = this.price;
    data['qty'] = this.qty;
    return data;
  }
}
