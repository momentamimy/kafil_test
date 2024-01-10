import 'package:flutter/material.dart';
import 'package:kafil_test/helper/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;

  const AppTextFormField(
      {Key? key,
      this.inputType,
      this.controller,
      this.focusNode,
      required this.hintText,
      this.validator,
      this.onSubmitted})
      : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = false;
  IconData _passwordIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(widget.hintText),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whitGrey),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
              textInputAction: widget.onSubmitted != null
                  ? TextInputAction.done
                  : TextInputAction.next,
              onFieldSubmitted: widget.onSubmitted,
              obscureText: _obscureText,
              keyboardType: widget.inputType ?? TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: widget.inputType == TextInputType.visiblePassword
                      ? IconButton(
                          icon: Icon(
                            _passwordIcon,
                            color: AppColors.grey,
                          ),
                          onPressed: _toggleVisibilityIcon,
                        )
                      : null,
                  hintText: ""),
              validator: widget.validator,
              controller: widget.controller,
              focusNode: widget.focusNode),
        ),
      ],
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _passwordIcon = Icons.visibility;
      } else {
        _passwordIcon = Icons.visibility_off;
      }
    });
  }
}
