import 'package:get/get.dart';

class CardController extends GetxController {
  RxString studentName = ''.obs;
  RxString studentAge = ''.obs;
  RxString studentBatch = ''.obs;
  RxString studentRegNum = ''.obs;

  updateName(String val) {
    studentName.value = val;
  }

  updateAge(String val) {
    studentAge.value = val;
  }
  updateBatch(String val) {
    studentBatch.value = val;
  }
  updateRegNum(String val) {
    studentRegNum.value = val;
  }

  clearfields() {
    studentName.value = '';
    studentAge.value = '';
    studentBatch.value = '';
    studentRegNum.value = '';
  }
}
