class ApiException implements Exception {
  ApiException(this.message, {this.errors}) : super();

  final String message;
  final dynamic errors;

  @override
  String toString() {
    return message;
  }
}
