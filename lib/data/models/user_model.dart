import '../../domain/entities/user/user.dart';

class AppUser {
  final String name;
  final String surname;
  final String email;
  final String uid;

  AppUser({
    required this.name,
    required this.surname,
    required this.email,
    required this.uid,
  });

  factory AppUser.fromApi(UserEntity userInfo) => AppUser(
    name: userInfo.name!,
    surname: userInfo.surname!,
    email: userInfo.email!,
    uid: userInfo.uid!,
  );

  AppUser copyWith(String? name, String? surname, String? email, String? uid) {
    return AppUser(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser && runtimeType == other.runtimeType && uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}
