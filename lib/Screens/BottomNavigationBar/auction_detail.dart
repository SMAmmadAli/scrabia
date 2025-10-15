import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Profile/agent_profile.dart';
import 'package:scrabia/Widgets/back_widget.dart';
import 'package:scrabia/Widgets/info_widget.dart';
import 'package:scrabia/Widgets/my_container.dart';

class AuctionDetail extends StatefulWidget {
  const AuctionDetail({super.key});

  @override
  State<AuctionDetail> createState() => _AuctionDetailState();
}

class _AuctionDetailState extends State<AuctionDetail> {
  final images = [
    'assets/nike.png',
    'assets/apartment.png',
    'assets/car.png',
    'assets/nike.png',
    'assets/apartment.png',
    'assets/car.png',
  ];
  late final PageController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final infoList = [
    {'textOne': 'City', 'textTwo': 'New York'},
    {'textOne': 'Bedrooms', 'textTwo': '2 Bedrooms'},
    {'textOne': 'Floor', 'textTwo': 'Third Floor'},
    {'textOne': 'Facade', 'textTwo': 'Western'},
    {'textOne': 'Lister Type', 'textTwo': 'Landlord'},
    {'textOne': 'Building Age', 'textTwo': '23 years'},
    {'textOne': 'Payment Method', 'textTwo': 'Cash'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: Get.height * 0.32,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (index) => setState(() => _current = index),
                  itemBuilder: (context, index) {
                    final url = images[index];
                    return FadeInImage(
                      placeholder: const AssetImage(
                        'assets/placeholder.png',
                      ), // optional
                      image: AssetImage(url),
                      fit: BoxFit.fill,
                      imageErrorBuilder: (c, e, s) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                left: 15,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF127997),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${_current + 1}/${images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      width(10),
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 17,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              // left back button
              Positioned(top: 40, left: 15, child: BackWidget()),

              // right favorite button
              Positioned(
                top: 40,
                right: 15,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_outline, size: 22),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$65,000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    height(5),
                    Text("Apartment for sale", style: TextStyle(fontSize: 16)),
                    height(5),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 18),
                        width(5),
                        Text(
                          "Lorem ipsum dolor smit",
                          style: TextStyle(color: textLightColor),
                        ),
                      ],
                    ),
                    height(15),
                    Text(
                      "Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    height(10),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: infoList.length,
                      separatorBuilder: (context, index) => height(5),
                      itemBuilder: (context, index) {
                        return InfoWidget(
                          textOne: infoList[index]['textOne']!,
                          textTwo: infoList[index]['textTwo']!,
                        );
                      },
                    ),
                    height(10),
                    Divider(),
                    height(10),
                    Text(
                      "Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    height(5),
                    Text(
                      "Norem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, ",
                    ),
                    height(10),
                    MyContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              height(5),
                              Text(
                                "Closing at:8 Jul, 9:00",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: Get.width * 0.44,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  mainThemeColor,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: BorderSide(color: mainThemeColor),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/watch.png",
                                    height: 17,
                                    width: 17,
                                  ),
                                  width(10),
                                  Text(
                                    "02 : 12 : 54",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(20),
                    MyContainer(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Winner",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          height(10),
                          SizedBox(
                            height: Get.height * 0.3,
                            child: Scrollbar(
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: 8,
                                separatorBuilder: (context, index) => Divider(),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          "assets/person.png",
                                          height: 38,
                                          width: 38,
                                        ),
                                      ),
                                      width(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ronald Richards",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "20s",
                                            style: TextStyle(
                                              color: textLightColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$24.5k",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      width(20),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 8,
                                          ),
                                          width: Get.width * 0.25,
                                          decoration: BoxDecoration(
                                            color: mainThemeColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                "Send Request",
                                                style: TextStyle(
                                                  color: whiteColor,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(20),
                    MyContainer(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  height(5),
                                  Text(
                                    "Dubai",
                                    style: TextStyle(color: textLightColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                                width: Get.width * 0.44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      mainThemeColor,
                                    ),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        side: BorderSide(color: mainThemeColor),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Show On Map",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height(10),
                          Image.asset("assets/map.png"),
                        ],
                      ),
                    ),
                    height(20),
                    MyContainer(
                      onTap: () {
                        Get.to(() => AgentProfile());
                      },
                      padding: myPadding,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/person.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          width(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Smith",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              height(2),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (rating) {
                                      myPrint(rating);
                                    },
                                  ),

                                  width(5),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: textLightColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
