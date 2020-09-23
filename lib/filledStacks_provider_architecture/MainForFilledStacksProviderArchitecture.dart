import 'package:flutter/material.dart';
import 'package:flutter_practise/filledStacks_provider_architecture/locator.dart';
import 'package:flutter_practise/filledStacks_provider_architecture/ui/views/login_view.dart';

class MainForFilledStacksProviderArchitecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoginView(),
    );
  }
}
