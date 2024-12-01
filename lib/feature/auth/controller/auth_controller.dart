import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/scccess_top_snak_bar.dart';
import 'package:new_bright_minds/core/services/manage_http_response.dart';
import 'package:new_bright_minds/feature/auth/models/user_model.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/login_view.dart';

class AuthController {
  Future<void> signUpUser({
    required String email,
    required String password,
    required String fullName,
    required context,
  }) async {
    try {
      UserModel user = UserModel(
        id: '',
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: '',
        dateofBirth: '',
        specialization: '',
        educationalLevel: '',
        interests: '',
        cv: '',
        token: '',
        profilePicture: '',
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            succesTopSnackBar(
              context,
              'Account created successfully',
            );
            Navigator.of(context).pushReplacement(
              buildPageRoute(
                const LoginView(),
              ),
            );
          });
    } catch (e) {
      log(
        'Error in AuthController: ${e.toString()}',
      );
    }
  }

  //  signInUser() {}
  Future<void> signInUser({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            succesTopSnackBar(context, 'Signed in successfully');
          });
    } catch (e) {
      log('Error in AuthController: ${e.toString()}');
    }
  }
}
