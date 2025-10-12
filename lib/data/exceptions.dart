class AuthException implements Exception {
  final String message;
  final String? status;

  AuthException({required this.message, this.status});

  /// Using given [code], returns exception with user-friendly message
  factory AuthException.fromCode(String? code) {
    switch (code) {
      case 'invalid-email':
        return AuthException(
          message: 'The email address is not valid.',
          status: code,
        );
      case 'user-disabled':
        return AuthException(
          message: 'This account has been disabled. Please contact support.',
          status: code,
        );
      case 'user-not-found':
        return AuthException(
          message: 'No user found with this email.',
          status: code,
        );
      case 'wrong-password':
        return AuthException(
          message: 'Incorrect password. Please try again.',
          status: code,
        );
      case 'email-already-in-use':
        return AuthException(
          message: 'This email is already in use. Please log in instead.',
          status: code,
        );
      case 'weak-password':
        return AuthException(
          message: 'Your password is too weak. Try a stronger one.',
          status: code,
        );
      case 'operation-not-allowed':
        return AuthException(
          message:
              'This sign-in method is not enabled. Please contact support.',
          status: code,
        );
      case 'too-many-requests':
        return AuthException(
          message: 'Too many attempts. Please wait and try again later.',
          status: code,
        );
      case 'network-request-failed':
        return AuthException(
          message: 'Network error. Please check your connection.',
          status: code,
        );
      default:
        return AuthException(
          message: 'Something went wrong. Please try again.',
          status: code,
        );
    }
  }
}

class FireStoreException implements Exception {
  final String message;
  final String? status;

  FireStoreException({required this.message, this.status});

  /// Using given [code], returns exception with user-friendly message
  factory FireStoreException.fromCode(String? code) {
    switch (code) {
      case 'cancelled':
        return FireStoreException(
          message: 'The request was cancelled. Please try again.',
          status: code,
        );
      case 'ok':
        return FireStoreException(
          message: 'All has gone successful.',
          status: code,
        );
      case 'unknown':
        return FireStoreException(
          message: 'An unknown error occurred. Please try again later.',
          status: code,
        );
      case 'invalid-argument':
        return FireStoreException(
          message: 'Some data was invalid. Please check and try again.',
          status: code,
        );
      case 'deadline-exceeded':
        return FireStoreException(
          message:
              'The request took too long. Check your connection and retry.',
          status: code,
        );
      case 'not-found':
        return FireStoreException(
          message: 'We couldn’t find what you were looking for.',
          status: code,
        );
      case 'already-exists':
        return FireStoreException(
          message: 'This item already exists.',
          status: code,
        );
      case 'permission-denied':
        return FireStoreException(
          message: 'You don’t have permission to do this action.',
          status: code,
        );
      case 'unauthenticated':
        return FireStoreException(
          message: 'Please sign in to continue.',
          status: code,
        );
      case 'resource-exhausted':
        return FireStoreException(
          message: 'You’ve reached a usage limit. Please try again later.',
          status: code,
        );
      case 'failed-precondition':
        return FireStoreException(
          message: 'The action could not be completed due to a precondition.',
          status: code,
        );
      case 'aborted':
        return FireStoreException(
          message: 'The operation was aborted. Please retry.',
          status: code,
        );
      case 'out-of-range':
        return FireStoreException(
          message: 'The request was out of range. Please try again.',
          status: code,
        );
      case 'unimplemented':
        return FireStoreException(
          message: 'This feature is not supported yet.',
          status: code,
        );
      case 'internal':
        return FireStoreException(
          message: 'An internal error occurred. Try again later.',
          status: code,
        );
      case 'unavailable':
        return FireStoreException(
          message:
              'The service is currently unavailable. Please try again later.',
          status: code,
        );
      case 'data-loss':
        return FireStoreException(
          message:
              'Data loss occurred. Please contact support if this happens again.',
          status: code,
        );
      default:
        return FireStoreException(
          message: 'Something went wrong. Please try again.',
          status: code,
        );
    }
  }
}
