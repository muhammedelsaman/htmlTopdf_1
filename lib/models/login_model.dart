
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopLoginModel {
  bool? status;
  String? message;
  late UserData userData;

  ShopLoginModel();


  factory ShopLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ShopLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopLoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });



  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}
