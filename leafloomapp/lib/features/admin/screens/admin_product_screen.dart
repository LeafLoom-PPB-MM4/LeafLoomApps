import 'package:flutter/material.dart';

class AdminProductScreen extends StatefulWidget {
  @override
  _AdminProductScreenState createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  String _selectedCategory = 'Pakaian';
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Nadya Set',
      'details': 'Satu set outer dengan celana motif...',
      'price': 'Rp688.000',
      'image': 'assets/images/product_image_placeholder.png',
    },
    {
      'name': 'Nadya Set',
      'details': 'Satu set outer dengan celana motif...',
      'price': 'Rp688.000',
      'image': 'assets/images/product_image_placeholder.png',
    },
    {
      'name': 'Nadya Set',
      'details': 'Satu set outer dengan celana motif...',
      'price': 'Rp688.000',
      'image': 'assets/images/product_image_placeholder.png',
    },
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AdminProductScreen(),
    OrderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addProduct() {
    // Implement add product functionality
  }

  void _editProduct(int index) {
    // Implement edit product functionality
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: DropdownButton<String>(
          value: _selectedCategory,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          items: <String>['Pakaian', 'Tas', 'Sepatu']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue!;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.green),
            onPressed: _addProduct,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              _products[index]['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(_products[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_products[index]['details']),
                Text(_products[index]['price']),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.green),
                  onPressed: () => _deleteProduct(index),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.green),
                  onPressed: () => _editProduct(index),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pesanan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Beranda'),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Produk'),
    );
  }
}

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pesanan'),
    );
  }
}
