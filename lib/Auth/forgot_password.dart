import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Auth/enter_otp.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
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
                  Text("Forgot Password", style: heading),
                  height(10),
                  MyTextField(
                    hintText: "Email Address",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  height(15),
                  MyButton(
                    onTap: () {
                      Get.to(() => EnterOTP());
                    },
                    label: "Send Code",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
