import 'package:flutter/material.dart';
import 'package:kafil_test/helper/app_colors.dart';
import 'package:kafil_test/modules/registration/provider/registration_provider.dart';
import 'package:provider/provider.dart';

class RegisterSteps extends StatelessWidget {
  const RegisterSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RegistrationProvider>();
    return Column(
      children: [
        Row(children: [
          const Spacer(flex: 4),
          const Text(
            "Register",
            style: TextStyle(color: AppColors.green),
          ),
          const Spacer(
            flex: 4,
          ),
          Text(
            "Complete Data",
            style: TextStyle(
                color: provider.isFirstPage
                    ? AppColors.darkGrey
                    : AppColors.green),
          ),
          const Spacer(
            flex: 3,
          ),
        ]),
        Row(
          children: [
            const Expanded(
                flex: 3, child: _StepLine(lineColor: AppColors.green)),
            _StepNumber(
                number: provider.isFirstPage ? '1' : null,
                isDone: !provider.isFirstPage),
            Expanded(
                flex: 4,
                child: _StepLine(
                    lineColor: provider.isFirstPage
                        ? AppColors.midGrey
                        : AppColors.green)),
            _StepNumber(
                number: !provider.isFirstPage ? "2" : null,
                isActive: !provider.isFirstPage),
            const Expanded(
                flex: 3, child: _StepLine(lineColor: AppColors.midGrey)),
          ],
        )
      ],
    );
  }
}

class _StepNumber extends StatelessWidget {
  final String? number;
  final bool isActive;
  final bool isDone;

  const _StepNumber(
      {super.key, this.number, this.isActive = true, this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: BoxDecoration(
        color: _getCircleColor(),
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(
          color: _getBorderColor(),
          width: 1.0,
        ),
      ),
      child: number == null
          ? isActive
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16.0,
                )
              : const SizedBox()
          : Center(
              child: Text(
                number!,
                style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }

  Color _getCircleColor() {
    if (number != null) {
      return Colors.white;
    } else if (isActive || isDone) {
      return AppColors.green;
    } else {
      return AppColors.midGrey;
    }
  }

  Color _getBorderColor() {
    if (number != null || isActive || isDone) {
      return AppColors.green;
    } else {
      return AppColors.midGrey;
    }
  }
}

class _StepLine extends StatelessWidget {
  final Color lineColor;

  const _StepLine({super.key, required this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: lineColor,
    );
  }
}
