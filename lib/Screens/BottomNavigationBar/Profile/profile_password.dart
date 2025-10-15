import 'package:flutter/material.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class ProfilePassword extends StatefulWidget {
  const ProfilePassword({super.key});

  @override
  State<ProfilePassword> createState() => _ProfilePasswordState();
}

class _ProfilePasswordState extends State<ProfilePassword> {
  @override
  Widget build(BuildContext context) {
    final currentPassController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Password",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            MyTextField(
              controller: currentPassController,
              hintText: "Enter current password",
              isObscure: true,
            ),
            height(10),
            Text("New Password", style: TextStyle(fontWeight: FontWeight.w600)),
            MyTextField(
              controller: newPassController,
              hintText: "Enter new password",
              isObscure: true,
            ),
            height(10),

            Text(
              "Confirm Password",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            MyTextField(
              controller: confirmPassController,
              hintText: "Enter confirm password",
              isObscure: true,
            ),
            height(35),
            MyButton(onTap: () {}, label: "Update"),
            height(10),
          ],
        ),
      ),
    );
  }
}
