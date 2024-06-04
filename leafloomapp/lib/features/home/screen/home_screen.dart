import 'package:flutter/material.dart';
import 'package:leafloom/features/home/screen/cart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:leafloom/features/home/widget/card_product_widget.dart';
import 'package:leafloom/features/home/widget/category_model.dart';
import 'package:leafloom/features/home/widget/category_name.dart';
import 'package:leafloom/features/home/widget/list_banner_widget.dart';
import 'package:leafloom/widget/global_app_bar_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/features/home/screen/notification_screen.dart';

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

  int sliderIndex = 0;
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
      appBar: GlobalAppBar(
        onSearch:
            _onSearchChanged, // Mengubah fungsi yang dipanggil saat pencarian berubah
        onCart: _handleCart,
        onNotification: _handleNotification,
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
                            child: CategoryName(
                                text: "Rekomendasi Produk Trending")),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 170,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 16),
                            itemCount: displayedProducts
                                .length, // Menggunakan jumlah produk yang ditampilkan
                            itemBuilder: (context, index) {
                              return CardProductWidget(
                                product: displayedProducts[index],
                              );
                            },
                          ),
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
