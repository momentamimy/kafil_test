import 'package:flutter/material.dart';

class UserTypesRadio extends StatefulWidget {
  const UserTypesRadio({Key? key}) : super(key: key);

  @override
  State<UserTypesRadio> createState() => _UserTypesRadioState();
}

class _UserTypesRadioState extends State<UserTypesRadio> {
  int selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("User Type"),
        ),
        Row(
          children: [
            Radio<int>(
                value: 1,
                groupValue: selectedItem,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value!;
                  });
                }),
            const Text("Seller"),
            Radio<int>(
                value: 2,
                activeColor: Colors.green,
                groupValue: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value!;
                  });
                }),
            const Text("Buyer"),
            Radio<int>(
                value: 3,
                activeColor: Colors.green,
                groupValue: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value!;
                  });
                }),
            const Text("Both")
          ],
        )
      ],
    );
  }
}
