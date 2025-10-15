import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Auth/forgot_password.dart';
import 'package:scrabia/Auth/sign_up.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/my_bottom_bar.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPass = true;
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
                  Text("Login", style: heading),
                  height(10),
                  MyTextField(
                    hintText: "Email Address",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  MyTextField(
                    hintText: "Password",
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
                  height(5),
                  InkWell(
                    onTap: () {
                      Get.to(() => ForgotPassword());
                    },
                    child: Text(
                      " Forget Password?",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  height(15),
                  MyButton(
                    onTap: () {
                      Get.to(() => const MyBottomBar());
                    },
                    label: "Login",
                  ),
                  height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      width(5),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
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
