import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  Future<QuerySnapshot> getAdminCredentials() {
    var res = FirebaseFirestore.instance.collection('users').get();
    return res;
  }
}
