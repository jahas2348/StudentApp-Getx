import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app_1/controllers/card_controller.dart';
import 'package:student_app_1/controllers/student_controller.dart';
import 'package:student_app_1/core/styles/colors.dart';
import 'package:student_app_1/database/student_database.dart';
import 'package:student_app_1/models/image_helper.dart';
import 'package:student_app_1/models/student.dart';
import 'package:student_app_1/views/home_screen.dart';
import 'package:student_app_1/widgets/card_item.dart';
import 'package:student_app_1/widgets/custom_input_field.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({super.key, this.student});
  Rx<StudentModel>? student;

  final RxString imagePath = RxString(' ');
  StudentController studentcontroller = Get.find();
  CardController cardController = Get.find();

  TextEditingController studentname = TextEditingController();

  TextEditingController studentBatch = TextEditingController();

  TextEditingController studentRegNum = TextEditingController();

  TextEditingController studentAge = TextEditingController();
  fetchuserdata() {
    studentname.text = student?.value.studentName ?? '';
    studentBatch.text = student?.value.studentBatch ?? '';
    studentRegNum.text = student?.value.studentregNum ?? '';
    studentAge.text = student?.value.studentAge ?? '';
    imagePath.value = student?.value.studentProfile ?? '';

    cardController.studentName.value = studentname.text;
    cardController.studentBatch.value = studentBatch.text;
    cardController.studentRegNum.value = studentRegNum.text;
    cardController.studentAge.value = studentAge.text;
  }

  @override
  Widget build(BuildContext context) {
    fetchuserdata();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                cardController.clearfields();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Add Student'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey.shade900,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        final newImagePath =
                                            await ImageHelper.openGallery();
                                        if (newImagePath != null) {
                                          imagePath.value = newImagePath;
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 130,
                                            decoration: imagePath.value
                                                    .trim()
                                                    .isNotEmpty
                                                ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    image: DecorationImage(
                                                      image: FileImage(File(
                                                          imagePath.value)),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.grey.shade700,
                                                  ),
                                            child: imagePath.value
                                                    .trim()
                                                    .isNotEmpty
                                                ? null
                                                : Container(
                                                    child: Center(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .drive_folder_upload_outlined,
                                                            size: 20,
                                                            color: Colors
                                                                .grey.shade100,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text(
                                                            'Select\nprofile image',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          Visibility(
                                            visible: imagePath.value
                                                .trim()
                                                .isNotEmpty,
                                            child: Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Container(
                                                height: 40,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    final newImagePath =
                                                        await ImageHelper
                                                            .openGallery();
                                                    if (newImagePath != null) {
                                                      imagePath.value =
                                                          newImagePath;
                                                    }
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 4),
                                                      CircleAvatar(
                                                          radius: 16,
                                                          child: Icon(
                                                              Icons.edit,
                                                              size: 18)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    cardItemWidget(
                                        cardController: cardController,
                                        Title: 'AGE',
                                        value:
                                            '${cardController.studentAge.value}'),
                                    cardItemWidget(
                                        cardController: cardController,
                                        Title: 'BATCH',
                                        value:
                                            '${cardController.studentBatch.value}'),
                                    cardItemWidget(
                                        cardController: cardController,
                                        Title: 'REG. NUMBER',
                                        value:
                                            '${cardController.studentRegNum.value}'),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'NAME',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                    letterSpacing: 4.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${cardController.studentName.value}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade200,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Full Name',
                inputController: studentname,
                inputType: TextInputType.name,
                onChanged: (value) {
                  cardController.updateName(value);
                },
              ),
              CustomTextField(
                hintText: 'Age',
                inputController: studentAge,
                inputType: TextInputType.number,
                maxLength: 2,
                onChanged: (value) {
                  cardController.updateAge(value);
                },
              ),
              CustomTextField(
                hintText: 'Batch',
                inputController: studentBatch,
                inputType: TextInputType.number,
                maxLength: 4,
                onChanged: (value) {
                  cardController.updateBatch(value);
                },
              ),
              CustomTextField(
                hintText: 'Register Number',
                inputController: studentRegNum,
                inputType: TextInputType.number,
                maxLength: 8,
                onChanged: (value) {
                  cardController.updateRegNum(value);
                },
              ),
              Container(
                width: double.maxFinite,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          CustomColors.primaryColor.shade500)),
                  onPressed: () {
                    addStudent();
                    // Get.snackbar(
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     margin:
                    //         EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    //     'Successful',
                    //     'Record Added Successfully');
                    //     Get.offAll(HomeScreen());

                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // addStudent() async {
  //   final name = studentname.text;
  //   final batch = studentBatch.text;
  //   final regnum = studentRegNum.text;
  //   final age = studentAge.text;
  //   final profileImage = imagePath;

  //   if (student == null) {
  //     final student = StudentModel(
  //       studentName: name,
  //       studentBatch: batch,
  //       studentregNum: regnum,
  //       studentAge: age,
  //       studentProfile: profileImage.value.toString(),
  //     ).obs;
  //     studentcontroller.addStudent(student);
  //   } else {
  //     student!.update((studentupdate) {
  //       studentupdate!.studentName = name;
  //       studentupdate.studentBatch = batch;
  //       studentupdate.studentregNum = regnum;
  //       studentupdate.studentAge = age;
  //       studentupdate.studentProfile = profileImage.value.toString();
  //     });
  //   }
  //   Get.back();
  // }
  addStudent() async {
    final name = studentname.text;
    final batch = studentBatch.text;
    final regnum = studentRegNum.text;
    final age = studentAge.text;
    final profileImage = imagePath;

    final newStudent = StudentModel(
      studentName: name,
      studentBatch: batch,
      studentregNum: regnum,
      studentAge: age,
      studentProfile: profileImage.value.toString(),
    );

    final studentDatabase = StudentDatabase();
    await studentDatabase.initializeDatabase();

    if (student == null) {
      final studentwithId = await studentDatabase.insertStudent(newStudent);
      studentcontroller.addStudent(newStudent.obs);
    } else {
      // Update the existing student record
      final existingStudent = student!.value;
      existingStudent.studentName = name;
      existingStudent.studentBatch = batch;
      existingStudent.studentregNum = regnum;
      existingStudent.studentAge = age;
      existingStudent.studentProfile = profileImage.value.toString();

      await studentDatabase.updateStudent(existingStudent);

      // You may also need to update the student in the studentController's list
      // studentcontroller.updateStudent(index, existingStudent.obs);
    }

    studentDatabase.closeDatabase();

    Get.snackbar(
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      'Successful',
      'Record ${student == null ? "Added" : "Updated"} Successfully',
    );

    Get.offAll(HomeScreen());
  }

  
  
 
 
}


