import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Auth/forgot_password.dart';
import 'package:scrabia/Auth/sign_up_view.dart';
import 'package:scrabia/controllers/auth_controller.dart';
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
  final _authController = AuthController();

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
                      onPressed: () => setState(() {
                        showPass = !showPass;
                      }),
                      icon: Icon(
                        showPass
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  height(5),
                  InkWell(
                    onTap: () => Get.to(() => const ForgotPassword()),
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  height(15),
                  MyButton(
                    label: "Login",
                    onTap: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                            "Error", "Please enter email and password");
                        return;
                      }

                      Get.dialog(
                        const Center(child: CircularProgressIndicator()),
                        barrierDismissible: false,
                      );

                      final result =
                          await _authController.login(email, password);

                      Get.back();

                      if (result != null &&
                          result.token != null &&
                          result.token!.isNotEmpty) {
                        Get.snackbar("Success", "Login successful");
                        Get.offAll(() => const MyBottomBar());
                      } else {
                        Get.snackbar(
                          "Login Failed",
                          "Invalid credentials or server error",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.shade600,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),
                  height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      width(5),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignUp()),
                        child: const Text(
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
