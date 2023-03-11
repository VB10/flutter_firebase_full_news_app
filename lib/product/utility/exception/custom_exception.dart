class FirebaseCustomException implements Exception {
  FirebaseCustomException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}

class ItemCreateException implements Exception {
  ItemCreateException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}

class VersionCustomException implements Exception {
  VersionCustomException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}
