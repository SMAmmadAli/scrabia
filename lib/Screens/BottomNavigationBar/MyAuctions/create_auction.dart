import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/select_location.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_drop_down.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class CreateAuction extends StatefulWidget {
  const CreateAuction({super.key});

  @override
  State<CreateAuction> createState() => _CreateAuctionState();
}

class _CreateAuctionState extends State<CreateAuction> {
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  String? typedropdownvalue;
  List<File>? images;

  uploadMultiImageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    var value = await imagePicker.pickMultiImage();
    if (value.isNotEmpty) {
      setState(() {
        images = value.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Create A Auction"),
      body: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload Pictures"),
              height(5),
              GestureDetector(
                onTap: () {
                  uploadMultiImageFromGallery();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor, width: 1.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/create_auction.png",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              images == null || images!.isEmpty
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        height: 70,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: Get.width * 0.03),
                          itemCount: images?.length ?? 0,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.file(
                                    images![index],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: InkWell(
                                      onTap: () {
                                        images!.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: mainThemeColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              height(15),
              Text("Title"),
              MyTextField(hintText: "Enter title", controller: titleController),
              height(10),
              Text("Category"),
              MyTextField(
                hintText: "Enter category",
                controller: categoryController,
              ),
              height(10),
              Text("Location"),
              MyTextField(
                hintText: "Select Location",
                controller: locationController,
                readOnly: true,
                onTap: () {
                  Get.to(() => SelectLocation());
                },
              ),
              height(10),
              Text("Auction Type"),
              MyDropdown(
                items: ['Type 1', 'Type 2', 'Type 3'],
                label: "Select Auction Type",
                dropdownvalue: typedropdownvalue,
                onChanged: (value) {
                  setState(() {
                    typedropdownvalue = value!;
                  });
                },
              ),
              height(10),
              Text("Starting Price"),
              MyTextField(
                hintText: "Enter price",
                controller: priceController,
                keyboardType: TextInputType.number,
              ),
              height(10),
              Text("Auction Date"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.44,
                    child: MyTextField(
                      hintText: "Start Date",
                      controller: startDateController,
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              startDateController.text =
                                  "${value.day}/${value.month}/${value.year}";
                            });
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.44,
                    child: MyTextField(
                      hintText: "End Date",
                      controller: endDateController,
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              endDateController.text =
                                  "${value.day}/${value.month}/${value.year}";
                            });
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text("Description (Optional)"),
              MyTextField(
                hintText: "Enter description",
                controller: descriptionController,
                maxLines: 4,
              ),
              height(10),
              MyButton(
                onTap: () {
                  Get.back();
                },
                label: "Create Auction",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
