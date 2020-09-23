import 'package:get/get.dart';

import 'package:flutter_practise/AmateurCoderGetXTutorial/Tutorial2_stateManagement_inGETX/models/user.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    //Which is better??

    //Option #1
    user().name = "Tadas";
    user().count = count;

    //Option #2
    user.update((value) {
      value.name = 'Tadas';
      value.count = count;
    });
  }
}
