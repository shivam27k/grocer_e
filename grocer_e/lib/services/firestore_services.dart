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

  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getShops(category) {
    return firestore
        .collection(shopsCollectionRetail)
        .where('s_category', isEqualTo: category)
        .snapshots();
  }

  static getAddress(uid) {
    return firestore
        .collection("add_delivery_address")
        .where('address_of', isEqualTo: uid)
        .snapshots();
  }

  static getFavorites() {
    return firestore
        .collection(shopsCollectionRetail)
        .where('s_favorite', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static getOrders() {
    return firestore
        .collection("orders")
        .where('order_by_id', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static searchProducts(title) {
    return firestore
        .collection(productsCollection)
        .where('p_name', isLessThanOrEqualTo: title)
        .get();
  }
}
