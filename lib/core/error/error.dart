class Failure {
  Failure({this.message});
  final String message;
}

class APIFailure extends Failure {
  APIFailure({String message}) : super(message: message);
}
