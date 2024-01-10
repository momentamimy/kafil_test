import 'package:flutter/material.dart';
import 'package:kafil_test/modules/registration/components/register_steps.dart';
import 'package:kafil_test/modules/registration/components/user_types_radio.dart';
import 'package:kafil_test/modules/registration/provider/registration_provider.dart';
import 'package:kafil_test/widgets/app_button.dart';
import 'package:kafil_test/widgets/app_text_form_field.dart';
import 'package:kafil_test/widgets/default_app_bar.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegistrationProvider>(
        create: (context) => RegistrationProvider(),
        builder: (context, child) {
          final registrationProvider = context.read<RegistrationProvider>();
          return Scaffold(
              appBar: const DefaultAppBar(title: "Register"),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const RegisterSteps(),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                            child: AppTextFormField(hintText: "First Name")),
                        SizedBox(width: 10),
                        Expanded(
                            child: AppTextFormField(hintText: "Last Name")),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const AppTextFormField(hintText: "Email Address"),
                    const SizedBox(height: 10),
                    const AppTextFormField(hintText: "Password"),
                    const SizedBox(height: 10),
                    const AppTextFormField(hintText: "Confirm Password"),
                    const SizedBox(height: 10),
                    const UserTypesRadio(),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          child: AppButton(text: "Next", onPressed: () {}),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ));
        });
  }
}
