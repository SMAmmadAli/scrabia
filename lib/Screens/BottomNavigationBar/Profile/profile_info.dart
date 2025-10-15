import 'package:flutter/material.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final dateOfBirthController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Full Name",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            MyTextField(
              controller: fullNameController,
              hintText: "Enter full name",
            ),
            height(10),
            Text("Phone Number", style: TextStyle(fontWeight: FontWeight.w600)),
            MyTextField(
              controller: phoneController,
              hintText: "Enter phone number",
              keyboardType: TextInputType.number,
            ),
            height(10),

            Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            MyTextField(
              controller: emailController,
              hintText: "Enter email address",
            ),
            height(10),
            Text("City", style: TextStyle(fontWeight: FontWeight.w600)),
            MyTextField(
              controller: cityController,
              hintText: "Enter your city",
            ),
            height(10),

            Text("State", style: TextStyle(fontWeight: FontWeight.w600)),
            MyTextField(
              controller: stateController,
              hintText: "Enter your state",
            ),
            height(10),

            Text(
              "Date of Birth",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            MyTextField(
              controller: dateOfBirthController,
              hintText: "Enter date of birth",
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
