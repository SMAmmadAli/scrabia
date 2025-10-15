import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: authPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Password", style: heading),
                  height(5),
                  Text(
                    "Your identity has been verified set your new password  ",
                    style: TextStyle(fontSize: 13),
                  ),
                  height(15),
                  MyTextField(
                    hintText: "New Password",
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isObscure: showPass,
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                        showPass
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        // color: blackColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  MyTextField(
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    isObscure: showConfirmPass,
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          showConfirmPass = !showConfirmPass;
                        });
                      },
                      icon: Icon(
                        showConfirmPass
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        // color: blackColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  height(15),
                  MyButton(onTap: () {}, label: "Continue"),
                  height(5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPinInputField extends StatelessWidget {
  final TextEditingController? controller;
  final int index;

  const MyPinInputField({super.key, this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        width: Get.width * .1,
        height: 38,
        child: TextField(
          style: const TextStyle(fontSize: 25),
          controller: controller,
          autofocus: index == 0,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          cursorColor: blackColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: borderColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
