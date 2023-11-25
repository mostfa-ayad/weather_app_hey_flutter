class Failure {
  String msg;
  Failure({
    required this.msg,
  });
}

class ServerException implements Exception {
  String msg;
  ServerException({
    required this.msg,
  });
}
