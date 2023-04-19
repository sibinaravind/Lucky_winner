import 'package:get/state_manager.dart';

class TextController extends GetxController {
  RxBool visible1 = true.obs;
  RxBool selected1 = true.obs;
  RxBool visible2 = true.obs;
  RxBool selected2 = true.obs;
  var player1 = '999'.obs;
  RxBool buttondis = false.obs;
  var player2 = '999'.obs;
  var Player1Select = 1.obs;
  var player2Select = 1.obs;
}
