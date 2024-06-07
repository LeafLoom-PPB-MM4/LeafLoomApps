import 'package:flutter/material.dart';

class AdminOrderScreen extends StatefulWidget {
  @override
  _AdminOrderScreenState createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen> {
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> _orders = [
    {
      'category': 'Pakaian',
      'name': 'Nadya Set',
      'price': 'Rp688.000',
      'image': 'assets/images/product_image_placeholder.png',
      'status': 'Confirm'
    },
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductScreen(),
    AdminOrderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'List Pesanan',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              _orders[index]['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(_orders[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_orders[index]['category']),
                Text(_orders[index]['price']),
              ],
            ),
            trailing: Text(
              _orders[index]['status'],
              style: TextStyle(color: Colors.green),
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
