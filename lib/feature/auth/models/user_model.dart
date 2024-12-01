import 'dart:convert';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String dateofBirth;
  final String specialization;
  final String educationalLevel;
  final String interests;
  final String cv;
  final String profilePicture;
  final String token;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.dateofBirth,
      required this.specialization,
      required this.educationalLevel,
      required this.interests,
      required this.cv,
      required this.profilePicture,
      required this.token});

//Serialization:Covert User object to a Map
//Map: A Map is a collection of key-value pairs
//Why: Covert ing to a map is an intermediate step that makes it easier to serial •ze
// the object to formats like Json for storage or transmission.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'dateofBirth': dateofBirth,
      'specialization': specialization,
      'educationalLevel': educationalLevel,
      'interests': interests,
      'cv': cv,
      'profilePicture': profilePicture,
      'token': token
    };
  }

  //Serialization:Covert Map to a Json String
// This method directly encodes the data from the Map into a Json String

  String toJson() {
    return json.encode(toMap());
  }

//Deserialization: Covert a Map to a User Object
//purpose - Manipulation and user : Once the data is coverted a to a User obj ct
// it can be easily manipuated and use within the application .

// For example
//we might want to display the user's fullName, email etc on the Ui. or we m •ght
//want to save the data locally.
// the factory contructor takes a Map(Usually obtained from a Json object)
  /// and coverts it into a User Obeject.if a field is not presend in the
  /// it defaults to an empty String.
  ///

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String? ?? '',
      fullName: map['fullName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
      dateofBirth: map['dateofBirth'] as String? ?? '',
      specialization: map['specialization'] as String? ?? '',
      educationalLevel: map['educationalLevel'] as String? ?? '',
      interests: map['interests'] as String? ?? '',
      cv: map['cv'] as String? ?? '',
      profilePicture: map['profilePicture'] as String? ?? '',
      token: map['token'] as String? ?? '',
    );
  }

//fromJson: This factory contructor takes Json String
// and decodes into a Map String, dynamic>
//and then uses fromMap to covert that Map into a User Object.

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
