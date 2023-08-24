class DigestSub {
  String? label;
  String? tag;
  String? schemaOrgTag;
  num? total;
  bool? hasRDI;
  num? daily;
  String? unit;

  DigestSub(
      {this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRDI,
        this.daily,
        this.unit});

  DigestSub.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
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
    return data;
  }
}