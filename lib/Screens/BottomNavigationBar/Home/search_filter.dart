import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/auctions_list.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/select_location.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final sellerNameController = TextEditingController();
  final categoryController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  String? selectedInterest;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Auction Search"),
      body: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(10),
              Text("Search By Seller"),
              MyTextField(
                controller: sellerNameController,
                hintText: "Seller name",
              ),
              height(10),
              Text("Category"),
              MyTextField(controller: categoryController, hintText: "Category"),
              height(10),
              Text("Location"),
              MyTextField(
                readOnly: true,
                onTap: () {
                  Get.to(() => SelectLocation());
                },
                controller: locationController,
                hintText: "Enter your location",
              ),
              height(10),
              Text("Price"),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      keyboardType: TextInputType.number,
                      controller: minPriceController,
                      hintText: "Min",
                    ),
                  ),
                  Text("  To  "),
                  Expanded(
                    child: MyTextField(
                      keyboardType: TextInputType.number,
                      controller: maxPriceController,
                      hintText: "Max",
                    ),
                  ),
                ],
              ),
              height(10),
              Text("Date"),
              MyTextField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2050),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        dateController.text =
                            "${value.day}/${value.month}/${value.year}";
                      });
                    }
                  });
                },
                controller: dateController,
                hintText: "DD/MM/YYYYY",
              ),
              height(10),
              Text("Interest"),
              height(5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInterest = "Yes";
                      });
                    },
                    child: Container(
                      height: 37,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedInterest == "Yes"
                              ? mainThemeColor
                              : borderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: selectedInterest == "Yes"
                                ? blackColor
                                : textLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  width(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInterest = "No";
                      });
                    },
                    child: Container(
                      height: 37,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedInterest == "No"
                              ? mainThemeColor
                              : borderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: selectedInterest == "No"
                                ? blackColor
                                : textLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height(10),
              Text("Status"),
              height(5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedStatus = "Ongoing";
                      });
                    },
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedStatus == "Ongoing"
                              ? mainThemeColor
                              : borderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Ongoing",
                          style: TextStyle(
                            color: selectedStatus == "Ongoing"
                                ? blackColor
                                : textLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  width(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedStatus = "Ended";
                      });
                    },
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedStatus == "Ended"
                              ? mainThemeColor
                              : borderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Ended",
                          style: TextStyle(
                            color: selectedStatus == "Ended"
                                ? blackColor
                                : textLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  width(5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedStatus = "Coming Soon";
                      });
                    },
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedStatus == "Coming Soon"
                              ? mainThemeColor
                              : borderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Coming Soon",
                          style: TextStyle(
                            color: selectedStatus == "Coming Soon"
                                ? blackColor
                                : textLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height(30),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainThemeColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Clear",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  width(8),
                  Expanded(
                    child: MyButton(
                      onTap: () {
                        Get.to(() => AuctionsList());
                      },
                      label: "Apply Filters",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
