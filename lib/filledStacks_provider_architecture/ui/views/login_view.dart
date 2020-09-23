import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// app depemdencies
import 'package:flutter_practise/filledStacks_provider_architecture/core/viewmodels/login_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>();
  }
}
