// import 'package:get/get.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:get/get.dart';
import 'package:grocer_e/components/my_text_field.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/components/bg_widget.dart';
import 'package:grocer_e/views/user_profile_screen/edit_profile_screen/profile_controller.dart';
// import 'package:grocer_e/views/user_profile_screen/edit_profile_screen/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Your Profile",
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  40.heightBox,
                  data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                      ? Image.asset(defaultUser,
                              width: 150, height: 150, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : data['imageUrl'] != '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.network(data['imageUrl'],
                                  width: 150, height: 150, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                          : Image.file(File(controller.profileImgPath.value),
                                  width: 150, height: 150, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                  15.heightBox,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 40,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 9),
                          color: blackColor,
                          spreadRadius: -10,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: blueColor,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        controller.changeImage(context);
                      },
                      child: const Text(
                        "Change",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  30.heightBox,
                  Column(
                    children: [
                      SizedBox(
                        width: (context.screenWidth * 0.77),
                        child: const Text(
                          "Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      3.heightBox,
                      MyTextField(
                        controller: controller.nameController,
                        hintText: "Enter your Name",
                        obscureText: false,
                      ),
                    ],
                  ),
                  20.heightBox,
                  Column(
                    children: [
                      SizedBox(
                        width: (context.screenWidth * 0.77),
                        child: const Text(
                          "Old Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      3.heightBox,
                      MyTextField(
                        controller: controller.oldPasswordController,
                        hintText: "Enter your old password",
                        obscureText: true,
                      ),
                    ],
                  ),
                  20.heightBox,
                  Column(
                    children: [
                      SizedBox(
                        width: (context.screenWidth * 0.77),
                        child: const Text(
                          "New Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      3.heightBox,
                      MyTextField(
                        controller: controller.newPasswordController,
                        hintText: "Enter your new password",
                        obscureText: true,
                      ),
                    ],
                  ),
                  30.heightBox,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 9),
                          color: blackColor,
                          spreadRadius: -10,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: blueColor,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: logoTextColor,
                              ),
                            );
                          },
                        );

                        if (controller.profileImgPath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileImageLink = data['imageUrl'];
                        }

                        if (data['password'] ==
                            controller.oldPasswordController.text.trim()) {
                          await controller.changeAuthPassword(
                            email: data['email'],
                            password:
                                controller.oldPasswordController.text.trim(),
                            newPassword:
                                controller.newPasswordController.text.trim(),
                          );
                          await controller.updateProfile(
                            imageUrl: controller.profileImageLink,
                            password:
                                controller.newPasswordController.text.trim(),
                            name: controller.nameController.text.trim(),
                          );
                          Navigator.pop(context);
                          VxToast.show(context,
                              bgColor: lightGrey,
                              textColor: blueColor,
                              msg: "Updated");
                        } else {
                          Navigator.pop(context);
                          VxToast.show(context,
                              msg: "Old Password Does Not Match.");
                        }
                      },
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
