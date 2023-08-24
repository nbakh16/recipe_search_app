import 'package:recipe_app/app/data/models/recipe_model.dart';

class SearchModel {
  String? q;
  num? from;
  num? to;
  bool? more;
  num? count;
  List<Hits>? hits;

  SearchModel({this.q, this.from, this.to, this.more, this.count, this.hits});

  SearchModel.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    from = json['from'];
    to = json['to'];
    more = json['more'];
    count = json['count'];
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['from'] = this.from;
    data['to'] = this.to;
    data['more'] = this.more;
    data['count'] = this.count;
    if (this.hits != null) {
      data['hits'] = this.hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  Recipe? recipe;

  Hits({this.recipe});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe =
    json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    return data;
  }
}





