abstract class MyFailures {
  String message;
  MyFailures(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalFailures extends MyFailures {
  LocalFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class RemoteFailures extends MyFailures {
  RemoteFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class InvalidCredentionalFailures extends MyFailures {
  InvalidCredentionalFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}
