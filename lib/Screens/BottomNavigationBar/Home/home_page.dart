import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/auctions_list.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/search_filter.dart';
import 'package:scrabia/Screens/Drawer/my_drawer.dart';
import 'package:scrabia/Widgets/auction_widget.dart';
import 'package:scrabia/Widgets/my_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final ScrollController _featuredController = ScrollController();
  final ScrollController _lastSeenController = ScrollController();

  // sample featured data (8 items). Replace with your real data source.
  final List<Map<String, String>> featured = List.generate(8, (i) {
    return {
      'status': i % 2 == 0 ? 'Starting Soon' : 'In Progress',
      'image': 'assets/nike.png',
      'title': 'Nike ${i + 1}',
      'price': (20.0 + i).toStringAsFixed(2),
      'description':
          'Create your account with a simple 2-step registration process.',
    };
  });

  @override
  void dispose() {
    searchController.dispose();
    _featuredController.dispose();
    _lastSeenController.dispose();
    super.dispose();
  }

  void _scrollBy(ScrollController controller, double offset) {
    if (!controller.hasClients) return; // safe-guard: don't call before build
    final max = controller.position.maxScrollExtent;
    final target = (controller.offset + offset).clamp(0.0, max);
    controller.animateTo(
      target,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildAuctionItem(int index, double width) {
    final item = featured[index];
    return SizedBox(
      width: width,
      child: AuctionWidget(
        status: item['status']!,
        image: item['image']!,
        title: item['title']!,
        price: item['price']!,
        description: item['description']!,
      ),
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    "assets/drawer.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                Image.asset("assets/notifications.png", height: 40, width: 40),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    height(20),
                    TextFormField(
                      controller: searchController,
                      readOnly: true,
                      onTap: () {
                        Get.to(() => SearchFilter());
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12.0),
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFB2B2B2),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFB2B2B2),
                            width: 1,
                          ),
                        ),
                        hintStyle: TextStyle(
                          // color: blackColor.withValues(alpha: 0.5),
                          fontSize: 13,
                        ),
                        hintText: "Search your products",
                      ),
                    ),
                    height(30),
                    Image.asset("assets/banner.png"),
                    height(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: MyContainer(
                            margin: const EdgeInsets.only(right: 3),
                            borderRadius: 10,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: const Text("See More"),
                          ),
                        ),
                      ],
                    ),
                    height(20),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.85,
                          ),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyContainer(
                            onTap: () {
                              Get.to(() => AuctionsList());
                            },
                            padding: EdgeInsets.zero,
                            borderRadius: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "All",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                height(5),
                                Image.asset(
                                  "assets/all.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ],
                            ),
                          );
                        }
                        return MyContainer(
                          onTap: () {
                            Get.to(() => AuctionsList());
                          },
                          padding: EdgeInsets.zero,
                          borderRadius: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Electronics",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              height(5),
                              Image.asset(
                                "assets/electronics.png",
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Feature Auctions",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: MyContainer(
                            borderRadius: 10,
                            margin: const EdgeInsets.only(right: 3),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: const Text("See More"),
                          ),
                        ),
                      ],
                    ),
                    height(20),

                    // Featured (uses _featuredController)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final itemWidth = constraints.maxWidth * 0.475;
                        final scrollBy = (itemWidth + 10) * 2;
                        return Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.36,
                              child: SingleChildScrollView(
                                controller: _featuredController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 4),
                                    ...List.generate(featured.length, (i) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10.0,
                                        ),
                                        child: _buildAuctionItem(i, itemWidth),
                                      );
                                    }),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                            height(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyContainer(
                                  padding: const EdgeInsets.all(8),
                                  onTap: () =>
                                      _scrollBy(_featuredController, -scrollBy),
                                  child: const Icon(
                                    Icons.chevron_left,
                                    size: 28,
                                  ),
                                ),
                                width(20),
                                MyContainer(
                                  padding: const EdgeInsets.all(8),
                                  onTap: () =>
                                      _scrollBy(_featuredController, scrollBy),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Last Seen", style: TextStyle(fontSize: 16)),
                        GestureDetector(
                          onTap: () {},
                          child: MyContainer(
                            borderRadius: 10,
                            margin: const EdgeInsets.only(right: 3),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: const Text("See More"),
                          ),
                        ),
                      ],
                    ),
                    height(20),

                    // Last Seen (uses _lastSeenController)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final itemWidth = constraints.maxWidth * 0.475;
                        final scrollBy = (itemWidth + 10) * 2;
                        return Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.36,
                              child: SingleChildScrollView(
                                controller: _lastSeenController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 4),
                                    ...List.generate(featured.length, (i) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10.0,
                                        ),
                                        child: _buildAuctionItem(i, itemWidth),
                                      );
                                    }),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                            height(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyContainer(
                                  padding: const EdgeInsets.all(8),
                                  onTap: () =>
                                      _scrollBy(_lastSeenController, -scrollBy),
                                  child: const Icon(
                                    Icons.chevron_left,
                                    size: 28,
                                  ),
                                ),
                                width(20),
                                MyContainer(
                                  padding: const EdgeInsets.all(8),
                                  onTap: () =>
                                      _scrollBy(_lastSeenController, scrollBy),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    height(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
