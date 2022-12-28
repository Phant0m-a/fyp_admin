import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Services {

  FirebaseFirestore firestore =  FirebaseFirestore.instance;
  CollectionReference banners =  FirebaseFirestore.instance.collection('slider');
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket:'gs://mobileandweb-344d0.appspot.com');
    Future<DocumentSnapshot> getAdminCredentials(id) {
      var res = FirebaseFirestore.instance.collection('Admin').doc(id).get();
      return res;
    }

    Future<String>uploadBannerImageToDb(url)async{
      String downloadUrl = await storage.ref(url).getDownloadURL();
      if(downloadUrl != null){
        firestore.collection('slider').add({
          'image': downloadUrl,
        });
        return downloadUrl;
      }
    }

  }
