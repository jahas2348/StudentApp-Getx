import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_app_1/controllers/student_controller.dart';
import 'package:student_app_1/core/styles/colors.dart';
import 'package:student_app_1/database/student_database.dart';
import 'package:student_app_1/models/student.dart';
import 'package:get/get.dart';
import 'package:student_app_1/views/add_student_screen.dart';
import 'package:student_app_1/views/home_screen.dart';
import 'package:student_app_1/widgets/card_item_large.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Rx<StudentModel> student;
  final int index;
  final StudentController studentController = Get.find();
  StudentDetailsScreen({
    super.key,
    required this.student,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.to(AddStudent(
                student: student,
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Get.snackbar('Test', 'Message',
              // backgroundColor: Colors.amber);
              Get.bottomSheet(
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Your bottom sheet content goes here
                        Text('Are you sure you want to delete this record ?'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.shade800),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('No. Cancel'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.red.shade900),
                                ),
                                onPressed: () async {
                                  final studentDatabase = StudentDatabase();
                                  await studentDatabase.initializeDatabase();

                                  await studentDatabase.deleteStudent(student
                                      .value
                                      .id!); // Assuming you have an 'id' field in your StudentModel

                                  studentDatabase.closeDatabase();

                                  studentController.deleteStudent(index);

                                  Get.back(); // Close the bottom sheet

                                  Get.snackbar(
                                      snackPosition: SnackPosition.BOTTOM,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      'Successful',
                                      'Record Deleted Successfully');

                                  Get.offAll(HomeScreen());
                                },
                                child: Text('Yes. Delete'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
              );
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade900,
                          image: DecorationImage(
                              image: FileImage(
                                  File(student.value.studentProfile!)))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    cardItemWidgetLarge(
                        Title: 'NAME', value: '${student.value.studentName!}'),
                    cardItemWidgetLarge(
                        Title: 'AGE', value: '${student.value.studentAge!}'),
                    cardItemWidgetLarge(
                        Title: 'BATCH',
                        value: '${student.value.studentBatch!}'),
                    cardItemWidgetLarge(
                        Title: 'REG. NUMBER',
                        value: '${student.value.studentregNum!}'),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void showCustomDialog() {
    Get.defaultDialog(
      title: 'Dialog Title',
      content: Container(
        height: 200,
        color: Colors.amber,
      ),
    );
  }
}
