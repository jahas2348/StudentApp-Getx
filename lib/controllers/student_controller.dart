// import 'package:get/get.dart';
// import 'package:student_app_1/models/student.dart';

// class StudentController extends GetxController {

//   final List<Rx<StudentModel>> _studentlist = [];
//   List<Rx<StudentModel>> get studentlist => _studentlist;

//   addStudent (Rx<StudentModel> student){
//     _studentlist.add(student);
//     update();
//     print(_studentlist);
//   }
//   deleteStudent(int index){
//     _studentlist.removeAt(index);
//     update();
//   }
// }
import 'package:get/get.dart';
import 'package:student_app_1/models/student.dart';
import 'package:student_app_1/database/student_database.dart';

class StudentController extends GetxController {
  List<Rx<StudentModel>> _studentlist = [];
  List<Rx<StudentModel>> _searchStudentlist = [];

  List<Rx<StudentModel>> get studentlist => _searchStudentlist;

  
  @override
  void onReady() {
    super.onReady();
    fetchStudentsFromDatabase(); // Fetch students when the controller is initialized
  }

  void fetchStudentsFromDatabase() async {
    final studentDatabase = StudentDatabase();
    await studentDatabase.initializeDatabase();
    final students = await studentDatabase.fetchStudents();
    print('Fetch Function');
    print(students);
    // Convert fetched students to Rx and add to the list
    // _searchStudentlist.addAll(students.map((student) => student.obs));
    _searchStudentlist = students.map((student) => student.obs).toList();
    _studentlist = students.map((student) => student.obs).toList();

    studentDatabase.closeDatabase();
    update();
  }

  addStudent(Rx<StudentModel> student) {
    _studentlist.add(student);
    _searchStudentlist.add(student);
    update();
  }

  deleteStudent(int index) {
    _studentlist.removeAt(index);
    _searchStudentlist.removeAt(index);
    update();
  }

   
   searchStudent(String? query) {
      print(_studentlist);

    if (query==null) {
      print('Query null');
      _searchStudentlist = _studentlist;
      print('**********');
      print(_searchStudentlist);
      print('**********');
       print(_studentlist);

    } else {
      print('Query found');
      _searchStudentlist = _studentlist.where((student) =>
              student.value.studentName!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
          print('###########');
           print(_searchStudentlist);
           print('###########');
            print(_studentlist);
           
    }
    update();
  }
}
