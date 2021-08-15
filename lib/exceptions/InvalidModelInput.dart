class InvalidModelInput implements Exception {
  String _message = "";
  InvalidModelInput (String message) {
    this._message = message;
  }
  String get message => _message;
}