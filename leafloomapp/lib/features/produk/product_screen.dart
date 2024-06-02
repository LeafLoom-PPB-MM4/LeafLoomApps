import 'package:flutter/material.dart';
import 'package:leafloom/features/produk/detail_produk.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> products = [
    {
      'name': 'sepatu tutup motif bunga',
      'price': 'Rp 553.000',
      'image': 'assets/Produk_Sepatu.png',
    },
    {
      'name': 'Selop Ecoprint Kulit Domba',
      'price': 'Rp 455.000',
      'image': 'assets/Produk_Sepatu.png',
    },
    {
      'name': 'Sepatu Tutup Motif Daun',
      'price': 'Rp 553.000',
      'image': 'assets/Produk_Sepatu.png',
    },
    {
      'name': 'Sepatu Tutup Wanita',
      'price': 'Rp 553.000',
      'image': 'assets/Produk_Sepatu.png',
    },
    {
      'name': 'Product Name',
      'price': 'Rp 900.000',
      'image': 'assets/Produk_Sepatu.png',
    },
    {
      'name': 'Product Name',
      'price': 'Rp 900.000',
      'image': 'assets/Produk_Sepatu.png',
    },
  ];

  List<Map<String, String>> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _searchController.addListener(_onSearchChanged);
    displayedProducts = products;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      displayedProducts = products.where((product) {
        return product['name']!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Cari produk...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            height: 30,
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
          _buildProductList(),
          _buildProductList(),
          _buildProductList(),
          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: displayedProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(),
              ),
            );
          },
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    image: DecorationImage(
                      image: AssetImage(displayedProducts[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayedProducts[index]['name']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        displayedProducts[index]['price']!,
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
        );
      },
    );
  }
}
