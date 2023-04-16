import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  var profileImageLink = '';

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var fileName = basename(profileImgPath.value);

    var destination = 'images/${currentUser!.uid}/$fileName';

    Reference ref = FirebaseStorage.instance.ref().child(destination);

    await ref.putFile(File(profileImgPath.value));

    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imageUrl}) async {
    var store =
        FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);

    await store.set({'name': name, 'password': password, 'imageUrl': imageUrl},
        SetOptions(merge: true));
  }

  changeAuthPassword({email, password, newPassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!
        .reauthenticateWithCredential(cred)
        .then(
          (value) => currentUser!.updatePassword(newPassword),
        )
        .catchError((error) {
      // ignore: avoid_print
      print(
        error.toString(),
      );
    });
  }
}
