import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_core/data/exceptions.dart';
import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';

class FirebaseClient {
  final FirebaseAuth firebase;

  FirebaseClient(this.firebase);

  Future<UserCredential> registerWithEmailAndPassword(
    RegRequestEntity entity,
  ) async {
    try {
      final response = await firebase.createUserWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );
      print('Token: ${response.credential?.token}');

      return response;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: e.message ?? 'Invalid error',
        statusCode: e.code,
      );
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
    LoginRequestEntity entity,
  ) async {
    try {
      final response = await firebase.signInWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );
      print('Token: ${response.credential?.token}');

      return response;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: e.message ?? 'Invalid error',
        statusCode: e.code,
      );
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }
}
