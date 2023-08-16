import 'package:get/get.dart';
import 'package:student_app_1/controllers/card_controller.dart';
import 'package:student_app_1/controllers/student_controller.dart';
import 'package:student_app_1/database/student_database.dart';

class InitControllers extends Bindings {
  @override
  void dependencies (){
    Get.put(StudentController());
    Get.put(CardController());
    final studentDatabase = StudentDatabase();
    studentDatabase.initializeDatabase();
  }

}