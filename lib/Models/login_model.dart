
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel();

  // ShopLoginModel.fromJson(Map<String, dynamic> json) {
  //   status = json['status'];
  //   message = json['message'];
  //   data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  // }

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ShopLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopLoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  // named constructor

  // UserData.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   phone = json['phone'];
  //   image = json['image'];
  //   points = json['points'];
  //   credit = json['credit'];
  //   token = json['token'];
  // }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}
