// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThailandLocation {
  dynamic district;
  dynamic amphoe;
  dynamic province;
  dynamic zipcode;
  dynamic districtCode;
  dynamic amphoeCode;
  dynamic provinceCode;

  ThailandLocation(
      {this.district,
      this.amphoe,
      this.province,
      this.zipcode,
      this.districtCode,
      this.amphoeCode,
      this.provinceCode});

  ThailandLocation.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    amphoe = json['amphoe'];
    province = json['province'];
    zipcode = json['zipcode'];
    districtCode = json['district_code'];
    amphoeCode = json['amphoe_code'];
    provinceCode = json['province_code'];
  }

  @override
  String toString() {
    return 'ThailandLocation(district: $district, amphoe: $amphoe, province: $province, zipcode: $zipcode, districtCode: $districtCode, amphoeCode: $amphoeCode, provinceCode: $provinceCode)';
  }
}
