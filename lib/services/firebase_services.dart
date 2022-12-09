import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
    Future<DocumentSnapshot> getAdminCredentials(id) {
      var res = FirebaseFirestore.instance.collection('Admin').doc(id).get();
      return res;
    }
  }
