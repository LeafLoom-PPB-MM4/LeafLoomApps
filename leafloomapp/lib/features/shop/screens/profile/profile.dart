import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar dan informasi pengguna
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  // Tambahkan gambar avatar jika ada
                  // backgroundImage: AssetImage('path_to_image'),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Nama Pengguna',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    Text(
                      'email@example.com',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            // Informasi Pribadi
            _buildSection(
              title: 'Aktivitas',
              subtitle: 'Informasi Pribadi',
              onTap: () {
                // Tambahkan logika navigasi ke halaman detail informasi
              },
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Tentang Kami',
              subtitle: 'Informasi tentang aplikasi atau perusahaan',
              onTap: () {
                // Tambahkan logika navigasi ke halaman tentang kami
              },
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Layanan Pelanggan',
              subtitle: 'Informasi tentang layanan pelanggan',
              onTap: () {
                // Tambahkan logika navigasi ke halaman layanan pelanggan
              },
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Kebijakan Privasi',
              subtitle: 'Informasi tentang kebijakan privasi',
              onTap: () {
                // Tambahkan logika navigasi ke halaman kebijakan privasi
              },
            ),
            SizedBox(height: 12.0),
            // Kotak Keluar
            _buildLogoutSection(
              onTap: () {
                // Tambahkan logika untuk keluar
              },
            ),
            // Temukan Kami di
            SizedBox(height: 12.0),
            Text(
              'Temukan Kami di',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                _buildSocialIcon('assets/icons/instagram.png'),
                SizedBox(width: 8.0),
                _buildSocialIcon('assets/icons/facebook.png'),
                SizedBox(width: 8.0),
                _buildSocialIcon('assets/icons/tiktok.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green[800]!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.green[800]),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutSection({
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green[800]!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'Keluar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String iconName) {
    return Image.asset(
      iconName,
      width: 24,
      height: 24,
      color: Colors.green[800],
    );
  }
}
