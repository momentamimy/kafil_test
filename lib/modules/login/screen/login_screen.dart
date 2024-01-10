import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kafil_test/generated/res.dart';
import 'package:kafil_test/helper/app_colors.dart';
import 'package:kafil_test/helper/validator.dart';
import 'package:kafil_test/modules/login/components/login_button.dart';
import 'package:kafil_test/modules/login/components/remember_me_check_box.dart';
import 'package:kafil_test/modules/login/provider/login_provider.dart';
import 'package:kafil_test/modules/registration/screen/registration_screen.dart';
import 'package:kafil_test/widgets/app_text_form_field.dart';
import 'package:kafil_test/widgets/default_app_bar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(),
        builder: (context, child) {
          final loginProvider = context.read<LoginProvider>();
          return Scaffold(
            appBar: const DefaultAppBar(title: "Account Login"),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: loginProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Res.svgLoginCuate,
                          height: 200, width: 100),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        controller: loginProvider.emailController,
                        hintText: "Email Address",
                        inputType: TextInputType.emailAddress,
                        validator: Validator.emailValidation,
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        controller: loginProvider.passwordController,
                        hintText: "Password",
                        inputType: TextInputType.visiblePassword,
                        onSubmitted: (_) {
                          loginProvider.login();
                        },
                      ),
                      Row(
                        children: [
                          RememberMeCheckBox(onChange: (value) {}),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Text("Forget password?",
                                style: TextStyle(color: AppColors.grey)),
                          ),
                          const SizedBox(width: 20)
                        ],
                      ),
                      const LoginButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an Account ?"),
                          TextButton(
                              onPressed: () {
                                Get.to(const RegistrationScreen());
                              },
                              child: const Text("Register",style: TextStyle(color: AppColors.green),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
