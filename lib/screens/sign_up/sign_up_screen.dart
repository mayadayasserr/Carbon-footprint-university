import 'package:flutter/material.dart';



import '../../size_config.dart';
import '../sign_up//components/body.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName ="/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
