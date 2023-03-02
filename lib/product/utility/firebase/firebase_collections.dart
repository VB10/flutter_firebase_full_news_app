import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  version;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
