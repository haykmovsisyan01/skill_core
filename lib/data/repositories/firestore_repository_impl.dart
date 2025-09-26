import 'package:skill_core/config/constants.dart';
import 'package:skill_core/data/exceptions.dart';
import 'package:skill_core/data/sources/remote/firebase_firestore_client.dart';
import 'package:skill_core/domain/entities/guide/guide.dart';
import 'package:skill_core/domain/repositories/firestore_repository.dart';

import '../../domain/entities/firestore/firestore_response.dart';
import '../../domain/entities/test/test.dart';
import '../../domain/entities/user/user.dart';

/// Implements [FireStoreRepository] and realizes all FireStore futures
class FireStoreRepositoryImpl implements FireStoreRepository {
  final FirebaseFireStoreClient client;

  FireStoreRepositoryImpl(this.client);

  /// Fetches document from FireStore.
  /// Returns a [FireStoreResponseEntity] with [Map] if all have gone successfully.
  Future<FireStoreResponseEntity<Map<String, dynamic>>> _fetchDocument(
    String collection,
    String id,
  ) async {
    try {
      final result = await client.doc(collection, id).get();
      if (result.data() == null) {
        return FireStoreResponseEntity(message: 'Not found', failed: true);
      }
      return FireStoreResponseEntity(
        message: 'Success',
        failed: false,
        data: result.data(),
      );
    } on FireStoreException catch (e) {
      return FireStoreResponseEntity(
        message: e.message,
        failed: true,
        code: e.status,
      );
    }
  }

  /// Fetches all documents from collection.
  /// Returns a [FireStoreResponseEntity] with [List] of [Map] if all have gone successfully.
  Future<FireStoreResponseEntity<List<Map<String, dynamic>>>> _fetchCollection(
    String collection,
  ) async {
    try {
      final result = await client.allDocs(collection);
      final List<Map<String, dynamic>> dataList = result.docs
          .map((el) => el.data())
          .toList();

      return FireStoreResponseEntity(
        message: 'Success',
        failed: false,
        data: dataList,
      );
    } on FireStoreException catch (e) {
      return FireStoreResponseEntity(
        message: e.message,
        failed: true,
        code: e.status,
      );
    }
  }

  /// Returns same [FireStoreResponseEntity] with [GuideEntity] data if all have gone successfully
  @override
  Future<FireStoreResponseEntity<GuideEntity>> fetchGuide(String id) async {
    final result = await _fetchDocument(guidesCollection, id);
    final data = (result.data) as Map<String, dynamic>;

    return result.copyWithType<GuideEntity>(data: GuideEntity.fromJson(data));
  }

  /// Returns same [FireStoreResponseEntity] with [List] of [GuideEntity] data if all have gone successfully
  @override
  Future<FireStoreResponseEntity<List<GuideEntity>>> fetchGuides() async {
    final result = await _fetchCollection(guidesCollection);
    if (result.data == null || result.data!.isEmpty) {
      return FireStoreResponseEntity(
        message: result.message,
        failed: true,
        code: result.code,
      );
    }
    final data = (result.data) as List<Map<String, dynamic>>;

    return result.copyWithType<List<GuideEntity>>(
      data: data.map((el) => GuideEntity.fromJson(el)).toList(),
    );
  }

  /// Returns same [FireStoreResponseEntity] with [TestEntity] data if all have gone successfully
  @override
  Future<FireStoreResponseEntity<TestEntity>> fetchTest(String id) async {
    final result = await _fetchDocument(testsCollection, id);
    final data = (result.data) as Map<String, dynamic>;

    return result.copyWithType<TestEntity>(data: TestEntity.fromJson(data));
  }

  /// Returns same [FireStoreResponseEntity] with [List] of [TestEntity] data if all have gone successfully
  @override
  Future<FireStoreResponseEntity<List<TestEntity>>> fetchTests() async {
    final result = await _fetchCollection(testsCollection);
    if (result.data == null) {
      return FireStoreResponseEntity(
        message: result.message,
        failed: true,
        code: result.code,
      );
    }
    final data = (result.data) as List<Map<String, dynamic>>;

    return result.copyWithType<List<TestEntity>>(
      data: data.map((el) => TestEntity.fromJson(el)).toList(),
    );
  }

  /// Returns same [FireStoreResponseEntity] with [UserEntity] data if all have gone successfully
  @override
  Future<FireStoreResponseEntity<UserEntity>> fetchUser(String uid) async {
    final result = await _fetchDocument(usersCollection, uid);

    if (result.data == null) {
      return FireStoreResponseEntity(
        message: result.message,
        failed: true,
        code: result.code,
      );
    }

    final data = (result.data) as Map<String, dynamic>;

    return result.copyWithType<UserEntity>(data: UserEntity.fromJson(data));
  }

  /// Adds the [user] to FireStore and his information
  @override
  Future<FireStoreResponseEntity> addUser(String uid, UserEntity user) async {
    try {
      await client.doc(usersCollection, uid).set(user.toJson());

      return FireStoreResponseEntity(message: 'Success', failed: false);
    } on FireStoreException catch (e) {
      return FireStoreResponseEntity(
        message: e.message,
        failed: true,
        code: e.status,
      );
    }
  }

  /// Changes some information of that user by his [uid]
  @override
  Future<FireStoreResponseEntity> changeUser(
    String uid,
    UserEntity newOptions,
  ) async {
    try {
      await client.updateDoc(
        usersCollection,
        uid,
        newOptions.toJsonWithoutNull(),
      );
      return FireStoreResponseEntity(message: 'Success', failed: false);
    } on FireStoreException catch (e) {
      return FireStoreResponseEntity(
        message: e.message,
        failed: true,
        code: e.status,
      );
    }
  }
}
