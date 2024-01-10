import 'package:flutter/material.dart';
import 'package:kafil_test/helper/app_colors.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key, required this.onChange});

  final Function(bool) onChange;

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeCheck();
      },
      child: Row(
        children: [
          Checkbox(
            value: isCheck,
            onChanged: (value) => changeCheck(value: value),
          ),
          const Text("Remember me", style: TextStyle(color: AppColors.grey)),
        ],
      ),
    );
  }

  changeCheck({bool? value}) {
    setState(() {
      isCheck = value ?? !isCheck;
      widget.onChange(isCheck);
    });
  }
}
