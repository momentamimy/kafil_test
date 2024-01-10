import 'package:flutter/material.dart';
import 'package:kafil_test/helper/app_colors.dart';
import 'package:kafil_test/modules/login/provider/login_provider.dart';
import 'package:kafil_test/widgets/app_button.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginProvider>();
    return AppButton(
      text: "Login",
      onPressed: loginProvider.login,
    );
  }
}
