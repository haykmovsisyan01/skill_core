class AuthException implements Exception {
  final String message;
  final String? statusCode;

  AuthException({required this.message, this.statusCode});
}
