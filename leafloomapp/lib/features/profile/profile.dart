import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:leafloom/features/profile/TentangKamiScreen.dart';
import 'package:leafloom/features/profile/kebijakanprivasi.dart';
import 'package:leafloom/features/profile/layananpelanggan.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import '../authentication/controllers.onboarding/auth_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthRepository _authRepo = AuthRepository.instance;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    userData = await _authRepo.fetchUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 16.0),
                if (userData != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, ${userData!['fullName']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      Text(
                        userData!['email'],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
            const SizedBox(height: 24.0),
            _buildSection(
              title: 'Aktivitas',
              subtitle: 'Informasi Pribadi',
              onTap: () {},
              icon: IconsConstant.profileCircle,
            ),
            const SizedBox(height: 12.0),
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
            const SizedBox(height: 12.0),
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
            const SizedBox(height: 12.0),
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
            const SizedBox(height: 12.0),
            _buildLogoutSection(
              onTap: () {
                _authRepo.logout();
              },
            ),
            const SizedBox(height: 12.0),
            Text(
              'Temukan Kami di',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                _buildSocialIcon(IconsConstant.instagram),
                const SizedBox(width: 8.0),
                _buildSocialIcon(IconsConstant.facebook),
                const SizedBox(width: 8.0),
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
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green[800]!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, color: Colors.green[800]),
            const SizedBox(width: 12.0),
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
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: const TextStyle(
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
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}
