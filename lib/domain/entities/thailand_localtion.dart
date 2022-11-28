import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThailandLocation {
  dynamic subDistrict;
  dynamic disctrict;
  dynamic province;
  dynamic postalCode;
  ThailandLocation({
    this.subDistrict,
    this.disctrict,
    this.province,
    this.postalCode,
  });

  @override
  String toString() {
    return 'ThailandLocation(subDistrict: $subDistrict, disctrict: $disctrict, province: $province, postalCode: $postalCode)';
  }

  ThailandLocation copyWith({
    dynamic subDistrict,
    dynamic disctrict,
    dynamic province,
    dynamic postalCode,
  }) {
    return ThailandLocation(
      subDistrict: subDistrict ?? this.subDistrict,
      disctrict: disctrict ?? this.disctrict,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subDistrict': subDistrict,
      'disctrict': disctrict,
      'province': province,
      'postalCode': postalCode,
    };
  }

  factory ThailandLocation.fromMap(Map<String, dynamic> map) {
    return ThailandLocation(
      subDistrict: map['subDistrict'] as dynamic,
      disctrict: map['disctrict'] as dynamic,
      province: map['province'] as dynamic,
      postalCode: map['postalCode'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThailandLocation.fromJson(String source) =>
      ThailandLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
