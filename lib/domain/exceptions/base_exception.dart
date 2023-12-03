abstract class BaseException implements Exception {
  final String message;
  final String code;
  StackTrace? stackTrace;

  BaseException({required this.message, required this.code, this.stackTrace});
}
