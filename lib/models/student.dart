// class StudentModel {
//   String? studentName;
//   String? studentAge;
//   String? studentregNum;
//   String? studentBatch;
//   String? studentProfile;
//   StudentModel({
//     this.studentName,
//     this.studentAge,
//     this.studentregNum,
//     this.studentBatch,
//     this.studentProfile,
//   });
// }

class StudentModel {
  int? id;
  String? studentName;
  String? studentAge;
  String? studentregNum;
  String? studentBatch;
  String? studentProfile;

  StudentModel({
    this.id,
    this.studentName,
    this.studentAge,
    this.studentregNum,
    this.studentBatch,
    this.studentProfile,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentName': studentName,
      'studentAge': studentAge,
      'studentregNum': studentregNum,
      'studentBatch': studentBatch,
      'studentProfile': studentProfile,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      studentName: map['studentName'],
      studentAge: map['studentAge'],
      studentregNum: map['studentregNum'],
      studentBatch: map['studentBatch'],
      studentProfile: map['studentProfile'],
    );
  }

  
}
