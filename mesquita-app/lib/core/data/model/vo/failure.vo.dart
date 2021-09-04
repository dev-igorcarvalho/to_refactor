//UST: 29/09 - FailureVO - id:7 - 0,5pts - Criação
class FailureVO {
  FailureVO({List<String> errors}) : _errors = errors {
    _errors = _errors ?? [];
  }
  List<String> _errors;
  List<String> get errors => _errors;

  @override
  String toString() {
    return _errors.toString();
  }

  void addError(String error) {
    _errors.add(error);
  }

  bool hasNoErrors() {
    if (_errors == null || _errors.isEmpty) {
      return true;
    }
    return false;
  }
}
