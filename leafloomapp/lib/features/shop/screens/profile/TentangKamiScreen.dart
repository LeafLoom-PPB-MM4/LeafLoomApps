import 'package:flutter/material.dart';

class TentangKamiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8.0),
                  Text(
                    'Tentang Kami',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/leafloom_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        "Welcome to LeafLoom, tempat di mana kecantikan dan keberlanjutan bersatu. Sejak tahun 2023, kami berkomitmen untuk menciptakan produk fashion yang tidak hanya memanjakan mata, tetapi juga ramah lingkungan. Di LeafLoom, kami memandang tanaman sebagai kunci keberlanjutan dan keindahan alami.\n\nLeafLoom bukan hanya tentang produk, tetapi juga tentang memberdayakan komunitas lokal. Kami bekerja sama dengan ibu-ibu di sekitar lingkungan kami untuk memproduksi kain Ecoprint. Ini adalah langkah nyata kami untuk mendukung perekonomian lokal dan menciptakan dampak positif dalam komunitas kami.\n\nEcoprint adalah teknik pencetakan tekstil yang menggunakan bahan-bahan alami seperti daun, bunga, dan kulit untuk menciptakan pola unik dan indah pada kain. Proses ini menghilangkan kebutuhan akan pewarna sintetis dan bahan kimia berbahaya, menciptakan produk akhir yang tidak hanya indah tetapi juga ramah lingkungan.\n\nDi LeafLoom, kami percaya bahwa keberlanjutan dan keindahan dapat bersatu dalam dunia fashion. Dengan setiap produk yang kami hasilkan, kami berharap dapat menginspirasi perubahan positif menuju industri fashion yang lebih berkelanjutan dan peduli lingkungan. Selamat berbelanja dengan hati yang ringan dan penuh kesadaran lingkungan di LeafLoom!",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.justify, // Teks rata kanan kiri
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
