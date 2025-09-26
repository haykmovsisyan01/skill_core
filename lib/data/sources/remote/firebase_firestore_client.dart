import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_core/data/exceptions.dart';

class FirebaseFireStoreClient {
  final FirebaseFirestore client;

  FirebaseFireStoreClient(this.client);

  /// Returns [DocumentReference]
  /// if doc doesn't exist, it will be created
  DocumentReference<Map<String, dynamic>> doc(
    String collection,
    String? document,
  ) {
    try {
      return client.collection(collection).doc(document);
    } on FirebaseException catch (e) {
      throw FireStoreException.fromCode(e.code);
    }
  }

  /// Returns all docs in collection
  Future<QuerySnapshot<Map<String, dynamic>>> allDocs(String collection) async {
    try {
      final result = await client.collection(collection).get();
      if (result.docs.isEmpty) {
        throw FireStoreException.fromCode('not-found');
      }
      return result;
    } on FirebaseException catch (e) {
      throw FireStoreException.fromCode(e.code);
    }
  }

  /// Updates document
  Future<void> updateDoc(
    String collection,
    String document,
    Map<String, dynamic> data,
  ) async {
    try {
      return await doc(collection, document).update(data);
    } on FirebaseException catch (e) {
      throw FireStoreException.fromCode(e.code);
    }
  }

  /// Deletes document
  Future<void> deleteDoc(String collection, String document) async {
    try {
      await doc(collection, document).delete();
    } on FirebaseException catch (e) {
      throw FireStoreException.fromCode(e.code);
    }
  }
}
