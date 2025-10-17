import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_text_field.dart';
import 'package:scrabia/controllers/auth_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;
  String selectedRole = '';

  final _formKey = GlobalKey<FormState>();
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: authPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                height(Get.height * 0.1),
                MyContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoleWidget(
                            onTap: () => setState(() => selectedRole = "Buyer"),
                            image: "assets/buyer.png",
                            text: "Buyer",
                            selectedRole: selectedRole,
                          ),
                          RoleWidget(
                            onTap: () =>
                                setState(() => selectedRole = "Seller"),
                            image: "assets/seller.png",
                            text: "Seller",
                            selectedRole: selectedRole,
                          ),
                          RoleWidget(
                            onTap: () => setState(() => selectedRole = "Both"),
                            image: "assets/both.png",
                            text: "Both",
                            selectedRole: selectedRole,
                          ),
                        ],
                      ),
                      height(10),
                      Text("Sign up", style: heading),
                      height(10),
                      Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              controller: firstNameController,
                              hintText: "First Name",
                              // validator: (v) =>
                              //     v!.isEmpty ? "Enter first name" : null,
                            ),
                          ),
                          width(10),
                          Expanded(
                            child: MyTextField(
                              controller: lastNameController,
                              hintText: "Last Name",
                              // validator: (v) =>
                              //     v!.isEmpty ? "Enter last name" : null,
                            ),
                          ),
                        ],
                      ),
                      MyTextField(
                        hintText: "Email Address",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        // validator: (v) =>
                        //     v!.isEmpty ? "Enter email" : null,
                      ),
                      MyTextField(
                        hintText: "Phone Number",
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        // validator: (v) =>
                        //     v!.isEmpty ? "Enter phone number" : null,
                      ),
                      MyTextField(
                        hintText: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: showPass,
                        // validator: (v) =>
                        //     v!.length < 6 ? "Password too short" : null,
                        trailing: IconButton(
                          onPressed: () => setState(() => showPass = !showPass),
                          icon: Icon(showPass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off),
                        ),
                      ),
                      MyTextField(
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: showConfirmPass,
                        // validator: (v) => v != passwordController.text
                        //     ? "Passwords don't match"
                        //     : null,
                        trailing: IconButton(
                          onPressed: () => setState(
                              () => showConfirmPass = !showConfirmPass),
                          icon: Icon(showConfirmPass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off),
                        ),
                      ),
                      height(15),
                      MyButton(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) return;

                          if (selectedRole.isEmpty) {
                            Get.snackbar("Error", "Please select a role");
                            return;
                          }

                          Get.dialog(
                            const Center(child: CircularProgressIndicator()),
                            barrierDismissible: false,
                          );

                          final success = await _authController.registerBasic(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            position: selectedRole,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            mobileNumber: phoneController.text.trim(),
                          );

                          Get.back(); // close loader

                          if (success) {
                            Get.snackbar("Success", "Registration successful");
                            Get.back(); // go to login
                          } else {
                            Get.snackbar(
                                "Failed", "Something went wrong, try again");
                          }
                        },
                        label: "Continue",
                      ),
                      height(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          width(5),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(
                              "Login",
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
        ),
      ),
    );
  }
}

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    super.key,
    required this.image,
    required this.text,
    required this.selectedRole,
    required this.onTap,
  });

  final String image;
  final String text;
  final String selectedRole;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85,
        width: Get.width * 0.25,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDCDCDC)),
          color: selectedRole == text ? mainThemeColor : Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 40, width: 40),
            height(5),
            Text(text),
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
