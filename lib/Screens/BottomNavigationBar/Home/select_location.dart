import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/back_widget.dart';
import 'package:scrabia/Widgets/my_button.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class SelectLocation extends StatefulWidget {
  final bool fromEdit;
  const SelectLocation({super.key, this.fromEdit = false});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  var mapController = TextEditingController();

  String location = 'C-13 Kazimabad, Model Colony, Karachi';

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    mapController.text = location;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/large_map.png'),
          ),
        ),

        child: Column(
          children: [
            height(25),
            Padding(
              padding: myPadding,
              child: Row(children: [BackWidget()]),
            ),
            Spacer(),
            Container(
              padding: myPadding,
              width: Get.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  height(10),
                  Text(
                    'Confirm Your Address',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  height(10),
                  MyTextField(
                    readOnly: true,
                    // typedColor: blackColor,
                    hintText: "Enter your location",
                    controller: mapController,
                    leading: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: blackColor,
                      ),
                    ),
                  ),
                  height(15),

                  MyButton(
                    label: 'Continue',
                    onTap: () {
                      if (widget.fromEdit) {
                        //Do Changes
                      } else {
                        Get.back();
                        // Get.to(() => Hobbies());
                      }
                    },
                  ),
                  height(0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
