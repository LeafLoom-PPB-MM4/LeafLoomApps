import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Color.fromARGB(255, 212, 209, 209),
                expandedHeight: 160.0,
                collapsedHeight: 80.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50.0),
                        // Search bar and icons
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari Produk',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                // Handle cart icon press
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications),
                              onPressed: () {
                                // Handle notification icon press
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Color.fromARGB(255, 212, 209, 209),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Card slider
                          Container(
                            width: double.infinity,
                            height: 180,
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(4.0), // optional
                                    child: Image.asset(
                                      'assets/images/banner/Banner1.png',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                                Card(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(4.0), // optional
                                    child: Image.asset(
                                      'assets/images/banner/Banner2.png',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                                Card(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(4.0), // optional
                                    child: Image.asset(
                                      'assets/images/banner/Banner3.png',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          // Slider indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          // Section title
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Rekomendasi Produk Trending',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Recommendations
                          GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 8.0),
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                child:
                                    Center(child: Text('Product ${index + 1}')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
