import 'package:flutter/material.dart';
import 'package:leafloom/features/home/screen/cart.dart';
import 'package:leafloom/features/home/widget/category_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:leafloom/features/home/widget/card_product_widget.dart';
import 'package:leafloom/features/home/widget/category_name.dart';
import 'package:leafloom/features/home/widget/list_banner_widget.dart';
import 'package:leafloom/widget/global_app_bar_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/features/home/screen/notification_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.addListener(_onSearchChanged);
    super.dispose();
  }

  Widget _buildIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: ScrollingDotsEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotScale: 1.5,
        activeDotColor: LColors.primaryDark,
        dotColor: LColors.grey,
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> products = []; // Daftar produk
  List<Map<String, dynamic>> displayedProducts = []; // Produk yang ditampilkan

  void _onSearchChanged() {
    setState(() {
      displayedProducts = products.where((product) {
        return product['name']!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  void _handleNotification() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationScreen()),
    );
  }

  void _handleCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GlobalAppBar(
          searchController: _searchController,
          onCart: _handleCart,
          onNotification: _handleNotification,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 16),
                  // Banner Carousel
                  Container(
                    height: 180.0,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        const ListBannerWidget(
                          bannerPaths: [
                            LImages.banner1,
                            LImages.banner2,
                            LImages.banner3,
                          ],
                        ),
                        PageView(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.asset(
                                'assets/images/banner/Banner1.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.asset(
                                'assets/images/banner/Banner2.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.asset(
                                'assets/images/banner/Banner3.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildIndicator(),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 12,
                          ),
                          child: CategoryName(
                            text: 'Kategori',
                          ),
                        ),
                        CategoryList(),
                      ],
                    ),
                  ),
                  // Trending Products Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 12,
                          ),
                          child:
                              CategoryName(text: "Rekomendasi Produk Trending"),
                        ),
                        const SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('products')
                              .where('category', isEqualTo: 'Pakaian')
                              .limit(10)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return const Text('No products found.');
                              }
                              var products = snapshot.data!.docs;
                              return SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    var product = products[index].data();

                                    // Null check for required fields
                                    final imageUrl = product['url'] ?? '';
                                    final productName =
                                        product['name'] ?? 'Unknown';
                                    final productPrice =
                                        product['price'] ?? '0';
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        color: Colors.grey.shade200,
                                        child: SizedBox(
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Container(
                                                  height: 120,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    8)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          imageUrl),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      productName,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      'Rp$productPrice',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
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
