import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? firstname;
  final String? lastname;
  final String? contactNumber;
  final String? houseNo;
  final String? moo;
  final String? village;
  final String? building;
  final String? floorNo;
  final String? roomNo;
  final String? soi;
  final String? street;
  final String? subDistrict;
  final String? district;
  final String? province;
  final String? postalCode;
  final bool? isPrimary;

  const Address({
    this.firstname,
    this.lastname,
    this.contactNumber,
    this.houseNo,
    this.moo,
    this.village,
    this.building,
    this.floorNo,
    this.roomNo,
    this.soi,
    this.street,
    this.subDistrict,
    this.district,
    this.province,
    this.postalCode,
    this.isPrimary,
  });

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        contactNumber,
        houseNo,
        moo,
        village,
        building,
        floorNo,
        roomNo,
        soi,
        street,
        subDistrict,
        district,
        province,
        postalCode,
        isPrimary,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'contactNumber': contactNumber,
      'houseNo': houseNo,
      'moo': moo,
      'village': village,
      'building': building,
      'floorNo': floorNo,
      'roomNo': roomNo,
      'soi': soi,
      'street': street,
      'subDistrict': subDistrict,
      'district': district,
      'province': province,
      'postalCode': postalCode,
      'isPrimary': isPrimary,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      houseNo: map['houseNo'] != null ? map['houseNo'] as String : null,
      moo: map['moo'] != null ? map['moo'] as String : null,
      village: map['village'] != null ? map['village'] as String : null,
      building: map['building'] != null ? map['building'] as String : null,
      floorNo: map['floorNo'] != null ? map['floorNo'] as String : null,
      roomNo: map['roomNo'] != null ? map['roomNo'] as String : null,
      soi: map['soi'] != null ? map['soi'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      subDistrict:
          map['subDistrict'] != null ? map['subDistrict'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      province: map['province'] != null ? map['province'] as String : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      isPrimary: map['isPrimary'] != null ? map['isPrimary'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  Address copyWith({
    String? firstname,
    String? lastname,
    String? contactNumber,
    String? houseNo,
    String? moo,
    String? village,
    String? building,
    String? floorNo,
    String? roomNo,
    String? soi,
    String? street,
    String? subDistrict,
    String? district,
    String? province,
    String? postalCode,
    bool? isPrimary,
  }) {
    return Address(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      contactNumber: contactNumber ?? this.contactNumber,
      houseNo: houseNo ?? this.houseNo,
      moo: moo ?? this.moo,
      village: village ?? this.village,
      building: building ?? this.building,
      floorNo: floorNo ?? this.floorNo,
      roomNo: roomNo ?? this.roomNo,
      soi: soi ?? this.soi,
      street: street ?? this.street,
      subDistrict: subDistrict ?? this.subDistrict,
      district: district ?? this.district,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}
