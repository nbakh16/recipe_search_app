class Ingredients {
  String? text;
  num? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredients(
      {this.text, this.weight, this.foodCategory, this.foodId, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['weight'] = this.weight;
    data['foodCategory'] = this.foodCategory;
    data['foodId'] = this.foodId;
    data['image'] = this.image;
    return data;
  }
}