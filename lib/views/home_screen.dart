import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_1/controllers/student_controller.dart';
import 'package:student_app_1/core/styles/colors.dart';
import 'package:student_app_1/views/add_student_screen.dart';
import 'package:student_app_1/views/student_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.find();
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Student Sheet'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Icon(Icons.settings),
            SizedBox(
              width: 20,
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton.extended(
            backgroundColor: CustomColors.primaryColor.shade500,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(4)),
            elevation: 0,
            onPressed: () {
              Get.to(AddStudent());
            },
            label: Text(
              'Add Student',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          //
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              onChanged: (value) {
                                studentController.searchStudent(value);
                              },
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Search Students',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<StudentController>(builder: (_) {
                return ListView.builder(
                  
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: studentController.studentlist.length,
                  itemBuilder: (context, index) {
                    print('List View:');
                    print(studentController.studentlist);
                    final item = studentController.studentlist[index];
                    return Obx(() => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade900,
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.to(
                                StudentDetailsScreen(
                                    index: index, student: item),
                                transition: Transition.fadeIn);
                          },
                          minVerticalPadding: 25,
                          leading: CircleAvatar(
                            // child: Text('${index + 1}'.toString()),
                            backgroundImage:
                                FileImage(File(item.value.studentProfile!)),
                          ),
                          title: Text(item.value.studentName!),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          ),
                        )));
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
