import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_bright_minds/core/services/data_serviec.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}
