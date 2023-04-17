import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';
// import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/consts/firebase_consts.dart';

class ShopController extends GetxController {
  var isFav = false.obs;

  addToWishList(docId, context) async {
    await firestore.collection(shopsCollectionRetail).doc(docId).set(
      {
        's_favorite': FieldValue.arrayUnion([currentUser!.uid])
      },
      SetOptions(merge: true),
    );
    isFav(true);
    VxToast.show(context, msg: "Added to favorties");
  }

  removeFromWishList(docId, context) async {
    await firestore.collection(shopsCollectionRetail).doc(docId).set(
      {
        's_favorite': FieldValue.arrayRemove([currentUser!.uid])
      },
      SetOptions(merge: true),
    );
    isFav(false);
    VxToast.show(context, msg: "Removed from favorties");
  }

  checkIfFav(data) {
    if (data['s_favorite'].contains(currentUser!.uid)) {
      return true;
    } else {
      return false;
    }
  }
}
