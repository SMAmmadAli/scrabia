import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Auth/new_password.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({super.key});

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  final pin1 = TextEditingController();
  final pin2 = TextEditingController();
  final pin3 = TextEditingController();
  final pin4 = TextEditingController();
  final pin5 = TextEditingController();
  final pin6 = TextEditingController();
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();

    controllers = [pin1, pin2, pin3, pin4, pin5, pin6];

    for (var controller in controllers) {
      controller.addListener(() {
        String text = controller.text;
        if (text.length == 6) {
          for (int i = 0; i < 6; i++) {
            controllers[i].text = text[i];
          }
          FocusScope.of(context).unfocus(); // Dismiss keyboard
        }
      });
    }
  }

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
                  Text("Verify Your Email", style: heading),
                  height(5),
                  Text(
                    "Your OTP has been sent to you email no*******gmail.com",
                    style: TextStyle(fontSize: 13),
                  ),
                  height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return MyPinInputField(
                        index: index,
                        controller: controllers[index],
                      );
                    }),
                  ),
                  height(20),
                  MyButton(
                    onTap: () {
                      Get.to(() => NewPassword());
                    },
                    label: "Continue",
                  ),
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
