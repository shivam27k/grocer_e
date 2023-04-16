import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocer_e/consts/firebase_consts.dart';

class FireStoreServices {
  static getUser(uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: uid)
        .snapshots();
  }

  static getProducts(store) {
    return firestore
        .collection(productsCollection)
        .where('p_store', isEqualTo: store)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }
}
