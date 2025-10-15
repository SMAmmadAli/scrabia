import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_container.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({super.key});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Request Detail"),
      body: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            children: [
              MyContainer(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/person.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        width(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Smith"),
                            height(2),
                            Text(
                              "Seller",
                              style: TextStyle(
                                fontSize: 13,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    height(10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/nike.png",
                        height: Get.height * 0.24,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    height(15),
                    Text(
                      "Nike",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height(5),
                    Text(
                      "Create your account with a simple 2-step registration process.",
                      style: TextStyle(color: textLightColor),
                    ),
                    height(15),
                    Text(
                      "Information",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height(5),
                    Divider(),
                    height(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name", style: semiBold),
                        Text(
                          "John Smith",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date", style: semiBold),
                        Text(
                          "12/21/2025",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price", style: semiBold),
                        Text(
                          "\$12.00",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(30),
                    Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height(5),
                    Divider(),
                    height(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total", style: semiBold),
                        Text(
                          "\$45.00",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Platform fee", style: semiBold),
                        Text(
                          "\$02.00",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: semiBold),
                        Text(
                          "\$47.00",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(30),
                    MyButton(
                      onTap: () {
                        // mySuccessDialog(
                        //   title: "Thank you",
                        //   subtitle: "Your payment successfully submitted",
                        // );
                      },
                      label: "Payment",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
