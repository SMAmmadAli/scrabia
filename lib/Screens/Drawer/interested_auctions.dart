import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/large_auction_widget.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class InterestedAuctions extends StatefulWidget {
  const InterestedAuctions({super.key});

  @override
  State<InterestedAuctions> createState() => _InterestedAuctionsState();
}

class _InterestedAuctionsState extends State<InterestedAuctions> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: MyAppBar(title: "Interested Auctions"),
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            MyTextField(
              controller: searchController,
              textStyle: TextStyle(fontSize: 13.5),
              bordersColor: Color(0xFFD8D8D8),
              leading: Icon(
                Icons.search,
                // color: blackColor.withValues(alpha: 0.3),
              ),
              hintText: "Search auction",
            ),
            height(10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(2),
                separatorBuilder: (context, index) => height(15),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return LargeAuctionWidget(
                    status: "Starting Soon",
                    image: "assets/nike.png",
                    title: "Nike",
                    price: "20.00",
                    description:
                        "Create your account with a simple 2-step registration process.",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
