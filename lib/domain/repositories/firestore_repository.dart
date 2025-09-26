import 'package:skill_core/domain/entities/firestore/firestore_response.dart';
import 'package:skill_core/domain/entities/guide/guide.dart';
import 'package:skill_core/domain/entities/test/test.dart';

import '../entities/user/user.dart';

abstract class FireStoreRepository {
  Future<FireStoreResponseEntity<List<GuideEntity>>> fetchGuides();

  Future<FireStoreResponseEntity<GuideEntity>> fetchGuide(String id);

  Future<FireStoreResponseEntity<List<TestEntity>>> fetchTests();

  Future<FireStoreResponseEntity<TestEntity>> fetchTest(String id);

  Future<FireStoreResponseEntity<UserEntity>> fetchUser(String uid);

  Future<FireStoreResponseEntity> addUser(String uid, UserEntity user);

  Future<FireStoreResponseEntity> changeUser(String uid, UserEntity newOptions);
}
