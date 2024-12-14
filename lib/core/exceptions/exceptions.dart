abstract class MyExceptions {
  String message;
  MyExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalException extends MyExceptions {
  LocalException(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class RemoteException extends MyExceptions {
  RemoteException(super.message);

  @override
  String toString() {
    return super.message;
  }
}
