import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_core/data/exceptions.dart';
import 'package:skill_core/domain/entities/login/login_request.dart';
import 'package:skill_core/domain/entities/reg/reg_request.dart';

class FirebaseAuthClient {
  final FirebaseAuth firebase;

  FirebaseAuthClient(this.firebase);

  Future<UserCredential> registerWithEmailAndPassword(
    RegRequestEntity entity,
  ) async {
    try {
      final response = await firebase.createUserWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
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
      return response;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebase.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    }
  }

  Future<void> signOut() async {
    try {
      await firebase.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    }
  }
}
