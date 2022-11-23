// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopLoginModel _$ShopLoginModelFromJson(Map<String, dynamic> json) =>
    ShopLoginModel()
      ..status = json['status'] as bool?
      ..message = json['message'] as String?
      ..data = json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$ShopLoginModelToJson(ShopLoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      points: json['points'] as int?,
      credit: json['credit'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'image': instance.image,
      'points': instance.points,
      'credit': instance.credit,
      'token': instance.token,
    };
