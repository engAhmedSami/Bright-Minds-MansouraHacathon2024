import 'package:get_it/get_it.dart';
import 'package:new_bright_minds/core/services/data_serviec.dart';
import 'package:new_bright_minds/core/services/firebase_auth_service.dart';
import 'package:new_bright_minds/core/services/firestore_service.dart';
import 'package:new_bright_minds/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:new_bright_minds/feature/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
