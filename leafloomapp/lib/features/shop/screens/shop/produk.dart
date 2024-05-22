import 'package:flutter/material.dart';

class ProdukScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 221, 216, 216),
            expandedHeight: 105.0,
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
                              fillColor: Colors.grey[200],
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle category button press
                                },
                                child: Image.asset(
                                  'assets/icons/pakaian.png',
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                              Text('Pakaian'),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle category button press
                                },
                                child: Image.asset(
                                  'assets/icons/tas.png',
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                              Text('Tas'),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle category button press
                                },
                                child: Image.asset(
                                  'assets/icons/sepatu.png',
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                              Text('Sepatu'),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle more options button press
                                },
                                child: Image.asset(
                                  'assets/icons/lainya.png',
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                              Text('Lainnya'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Produk Pilihan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 4,
            children: List.generate(
              10,
              (index) {
                return Card(
                  child: Center(
                    child: Text('Produk ${index + 1}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
