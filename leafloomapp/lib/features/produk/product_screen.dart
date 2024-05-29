import 'package:flutter/material.dart';
import 'package:leafloom/widget/global_app_bar_widget.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onSearch: () {},
        onCart: () {},
        onNotification: () {},
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
      height: 100, // Atur tinggi sesuai kebutuhan Anda
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorWeight: 4,
            tabs: [
              _buildTab(IconsConstant.pakaian, 'Pakaian'),
              _buildTab(IconsConstant.tas, 'Tas'),
              _buildTab(IconsConstant.sepatu, 'Sepatu'),
              _buildTab(IconsConstant.lainnya, 'Lainnya'),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildTab(String iconPath, String labelText) {
    return Container(
      margin: EdgeInsets.only(right: 16, top: 16, bottom: 16),
      child: Tab(
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: 50,
              width: 50,
              semanticLabel: labelText,
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildProductList(IconsConstant.pakaian),
          _buildProductList(IconsConstant.tas),
          _buildProductList(IconsConstant.sepatu),
          _buildProductList(IconsConstant.lainnya),
        ],
      ),
    );
  }

  Widget _buildProductList(String categoryIcon) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: LColors.softGrey, // Tambahkan warna pada Card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120, // Atur sesuai kebutuhan Anda
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  image: DecorationImage(
                    image: AssetImage(categoryIcon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rp900.000',
                      style: TextStyle(
                        fontSize: 12,
                        color: LColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
