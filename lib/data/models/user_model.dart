import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String name;
  final String email;
  final String uid;
  final String? avatar;

  AppUser({
    required this.name,
    required this.email,
    required this.uid,
    this.avatar,
  });

  factory AppUser.fromApi(User user, Map<String, dynamic>? userInfo) => AppUser(
    name: userInfo?['name'] ?? 'Unknown name',
    email: user.email!,
    uid: user.uid,
  );

  AppUser copyWith(String? name, String? email, String? uid, String? avatar) {
    return AppUser(
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}
