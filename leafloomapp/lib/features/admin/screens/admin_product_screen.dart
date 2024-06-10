import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/admin/screens/add_product.dart';
import 'package:leafloom/features/admin/screens/admin_edit_screen.dart';
import 'package:leafloom/features/admin/screens/admin_home_screen.dart';
import 'package:leafloom/features/admin/screens/admin_order_screen.dart';

import '../controllers/home_controller.dart';

class AdminProductScreen extends StatefulWidget {
  @override
  _AdminProductScreenState createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  final AdminHomeController controller = Get.put(AdminHomeController());

  String _selectedCategory = 'Pakaian';
  int _selectedIndex = 1;

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
          //
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllDocs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listAllDocs.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.network(
                    listAllDocs[index]
                        ['url'], // Mengambil URL gambar dari dokumen
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(listAllDocs[index]['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listAllDocs[index]['category']),
                      Text('Rp ${listAllDocs[index]['price']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.green),
                        onPressed: () =>
                            controller.deleteProduct(listAllDocs[index].id),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green),
                        onPressed: () => Get.to(AdminEditScreen(),
                            arguments: listAllDocs[index].id),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(AddProductScreen()),
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}
