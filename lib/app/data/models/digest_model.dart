import 'package:recipe_app/app/data/models/digest_sub_model.dart';

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  num? total;
  bool? hasRDI;
  num? daily;
  String? unit;
  List<DigestSub>? sub;

  Digest(
      {this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRDI,
        this.daily,
        this.unit,
        this.sub});

  Digest.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = <DigestSub>[];
      json['sub'].forEach((v) {
        sub!.add(new DigestSub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['tag'] = this.tag;
    data['schemaOrgTag'] = this.schemaOrgTag;
    data['total'] = this.total;
    data['hasRDI'] = this.hasRDI;
    data['daily'] = this.daily;
    data['unit'] = this.unit;
    if (this.sub != null) {
      data['sub'] = this.sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}