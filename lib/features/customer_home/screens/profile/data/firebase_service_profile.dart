import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServiceProfile {
  static void makeTheUserSupplier(String userId) {
    User? user  = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('supplier')
        .doc(user!.uid)
        .update(
          {
           'name' : user.displayName,
           'email' : user.email,

          });
  }
}
