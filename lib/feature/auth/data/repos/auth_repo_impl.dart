import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:new_bright_minds/core/errors/exceptions.dart';
import 'package:new_bright_minds/core/errors/failures.dart';
import 'package:new_bright_minds/core/services/data_serviec.dart';
import 'package:new_bright_minds/core/services/firebase_auth_service.dart';
import 'package:new_bright_minds/core/utils/backend_endpoint.dart';
import 'package:new_bright_minds/feature/auth/data/models/user_model.dart';
import 'package:new_bright_minds/feature/auth/domain/entites/user_entity.dart';
import 'package:new_bright_minds/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      var userEntity = UserModel.fromFirebaseUser(user);

      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithGoogle :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithFacebook :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> sendPasswordResetLink(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetLink(email: email);
      return right(null);
    } on CustomExceptions catch (e) {
      log('FirebaseAuthException in AuthRepoImpl.sendPasswordResetLink :${e.toString()}');

      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.sendPasswordResetLink :${e.toString()}');
      return left(ServerFailure('An error occurred. Please try again later.'));
    }
  }

  @override
  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
