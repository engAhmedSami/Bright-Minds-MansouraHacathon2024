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

  // Convert UserModel to Map for saving as JSON
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

  // Convert Map to JSON string
  String toJson() {
    return json.encode(toMap());
  }

  // Convert Map to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uId: map['uId'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      specialization: map['specialization'] ?? '',
      educationalLevel: map['educationalLevel'] ?? '',
      interests: map['interests'] ?? '',
      cv: map['cv'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      token: map['token'] ?? '',
    );
  }

  // Convert JSON string to UserModel
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Convert Firebase User to UserModel
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      password: '', // Password needs to be handled separately
      phoneNumber: user.phoneNumber ?? '',
      dateOfBirth: '', // Requires separate storage and retrieval
      specialization: '', // Custom field not in Firebase User
      educationalLevel: '', // Custom field not in Firebase User
      interests: '', // Custom field not in Firebase User
      cv: '', // Custom field not in Firebase User
      profilePicture: user.photoURL ?? '',
      token: '', // Handle token separately
    );
  }
}
