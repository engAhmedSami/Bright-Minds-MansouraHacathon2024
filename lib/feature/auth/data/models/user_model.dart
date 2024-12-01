import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_bright_minds/feature/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  final String password;
  final String phoneNumber;
  final String dateOfBirth;
  final String specialization;
  final String educationalLevel;
  final String interests;
  final String cv;
  final String profilePicture;
  final String token;

  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    required this.password,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.specialization,
    required this.educationalLevel,
    required this.interests,
    required this.cv,
    required this.profilePicture,
    required this.token,
  });

  // Serialization: Convert User object to a Map
  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'password': password,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'specialization': specialization,
      'educationalLevel': educationalLevel,
      'interests': interests,
      'cv': cv,
      'profilePicture': profilePicture,
      'token': token,
    };
  }

  // Serialization: Convert Map to a JSON String
  String toJson() {
    return json.encode(toMap());
  }

  // Deserialization: Convert a Map to a User Object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      uId: map['uId'] as String? ?? '',
      password: map['password'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
      dateOfBirth: map['dateOfBirth'] as String? ?? '',
      specialization: map['specialization'] as String? ?? '',
      educationalLevel: map['educationalLevel'] as String? ?? '',
      interests: map['interests'] as String? ?? '',
      cv: map['cv'] as String? ?? '',
      profilePicture: map['profilePicture'] as String? ?? '',
      token: map['token'] as String? ?? '',
    );
  }

  // fromJson: This factory constructor takes a JSON String and decodes it into a Map,
  // then uses fromMap to convert that Map into a User Object.
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Factory constructor to create UserModel from Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      password: '', // You will need to handle the password separately
      phoneNumber: user.phoneNumber ?? '',
      dateOfBirth: '', // You may need to store this separately
      specialization: '', // Assuming it's not part of Firebase User
      educationalLevel: '', // Assuming it's not part of Firebase User
      interests: '', // Assuming it's not part of Firebase User
      cv: '', // Assuming it's not part of Firebase User
      profilePicture: user.photoURL ?? '',
      token: '', // Assuming you will handle token separately
    );
  }
}
