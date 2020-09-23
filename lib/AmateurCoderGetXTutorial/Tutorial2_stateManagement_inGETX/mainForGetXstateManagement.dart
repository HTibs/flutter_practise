import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_practise/AmateurCoderGetXTutorial/Tutorial2_stateManagement_inGETX/screens/first.dart';

class mainForGetXstateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //don't need 'Get' before Material App if you're only using State Management
      home: First(),
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
    );
  }
}
