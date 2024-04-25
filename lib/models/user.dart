// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
    String? id;
  String? name;
  String? username;
  String? height;
  String? weight;
  String? age;
  String? bloodgroup;
  String? gender;
  String? address;
  String? image;
  String? authId;
  List<Record>? records;
  User({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.image,
    this.authId,
    this.records,
  });


  User copyWith({
    String? id,
    String? name,
    String? username,
    String? height,
    String? weight,
    String? age,
    String? bloodgroup,
    String? gender,
    String? address,
    String? image,
    String? authId,
    List<Record>? records,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      image: image ?? this.image,
      authId: authId ?? this.authId,
      records: records ?? this.records,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'height': height,
      'weight': weight,
      'age': age,
      'bloodgroup': bloodgroup,
      'gender': gender,
      'address': address,
      'image': image,
      'authId': authId,
      // 'records': records?.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      bloodgroup: map['bloodgroup'] != null ? map['bloodgroup'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      authId: map['authId'] != null ? map['authId'] as String : null,
      // records: map['records'] != null ? List<Record>.from((map['records'] as List<int>).map<Record?>((x) => Record.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, height: $height, weight: $weight, age: $age, bloodgroup: $bloodgroup, gender: $gender, address: $address, image: $image, authId: $authId, records: $records)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.username == username &&
      other.height == height &&
      other.weight == weight &&
      other.age == age &&
      other.bloodgroup == bloodgroup &&
      other.gender == gender &&
      other.address == address &&
      other.image == image &&
      other.authId == authId &&
      listEquals(other.records, records);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      age.hashCode ^
      bloodgroup.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      image.hashCode ^
      authId.hashCode ^
      records.hashCode;
  }
}
