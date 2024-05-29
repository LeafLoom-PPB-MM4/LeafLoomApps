import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leafloom/features/profile/TentangKamiScreen.dart';
import 'package:leafloom/features/profile/kebijakanprivasi.dart';
import 'package:leafloom/features/profile/layananpelanggan.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';

import '../authentication/controllers.onboarding/auth_repository.dart';

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
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
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
            _buildSection(
              title: 'Aktivitas',
              subtitle: 'Informasi Pribadi',
              onTap: () {},
              icon: IconsConstant.profileCircle,
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Tentang Kami',
              subtitle: 'Informasi tentang aplikasi atau perusahaan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TentangKamiScreen()),
                );
              },
              icon: IconsConstant.tentangKami,
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Layanan Pelanggan',
              subtitle: 'Informasi tentang layanan pelanggan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Layananpelanggan()),
                );
              },
              icon: IconsConstant.layanan,
            ),
            SizedBox(height: 12.0),
            _buildSection(
              title: 'Kebijakan Privasi',
              subtitle: 'Informasi tentang kebijakan privasi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Kebijakanprivasi()),
                );
              },
              icon: IconsConstant.privacy,
            ),
            SizedBox(height: 12.0),
            _buildLogoutSection(
              onTap: () {
                AuthRepository.instance.logout();
              },
            ),
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
                _buildSocialIcon(IconsConstant.instagram),
                SizedBox(width: 8.0),
                _buildSocialIcon(IconsConstant.facebook),
                SizedBox(width: 8.0),
                _buildSocialIcon(IconsConstant.tiktok),
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
    required String icon,
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
            SvgPicture.asset(icon, color: Colors.green[800]),
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
            SvgPicture.asset(IconsConstant.arrowNext,
                width: 24, height: 24, color: Colors.green[800]),
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
    return SvgPicture.asset(
      iconName,
      width: 24,
      height: 24,
      color: Colors.green[800],
    );
  }
}
