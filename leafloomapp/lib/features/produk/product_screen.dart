import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/home/screen/cart.dart';
import 'package:leafloom/features/home/screen/notification_screen.dart';
import 'package:leafloom/features/produk/detail_produk.dart';

import '../../widget/global_app_bar_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _searchController.addListener(_onSearchChanged);
    _fetchProducts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _fetchProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      setState(() {
        products = snapshot.docs.map((doc) {
          var data = doc.data();
          data['id'] = doc.id;
          return data;
        }).toList();
        displayedProducts = products;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void _onSearchChanged() {
    setState(() {
      displayedProducts = products.where((product) {
        return product['name']
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            _buildTabBar(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        controller: _tabController,
        indicatorWeight: 4,
        tabs: [
          _buildTab('assets/icons/pakaian.png', 'Pakaian'),
          _buildTab('assets/icons/tas.png', 'Tas'),
          _buildTab('assets/icons/sepatu.png', 'Sepatu'),
          _buildTab('assets/icons/lainnya.png', 'Lainnya'),
        ],
      ),
    );
  }

  Widget _buildTab(String imagePath, String labelText) {
    return Tab(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 22,
          ),
          const SizedBox(height: 4),
          Text(labelText),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildProductList('Pakaian'),
          _buildProductList('Tas'),
          _buildProductList('Sepatu'),
          _buildProductList('Lainnya'),
        ],
      ),
    );
  }

  Widget _buildProductList(String category) {
    List<Map<String, dynamic>> filteredProducts = displayedProducts
        .where((product) => product['category'] == category)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
                ProductDetailScreen(productId: filteredProducts[index]['id']));
          },
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.grey.shade200,
            child: SizedBox(
              width: 120,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(filteredProducts[index]['url']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredProducts[index]['name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${filteredProducts[index]['price']}',
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
    );
  }
}
