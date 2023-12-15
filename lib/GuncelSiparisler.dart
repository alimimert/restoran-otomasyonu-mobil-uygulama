import 'package:flutter/material.dart';
import 'package:restoranotomasyonu/YemekServisi.dart';

class GuncelSiparisler extends StatelessWidget {
  // Servis üzerinden yemek verilerine erişim
  List<Map<String, dynamic>> get yemekVerileri => YemekServisi.yemekVerileri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEED1A2),
      appBar: AppBar(
        title: Text('Güncel Siparişler'),
        backgroundColor: Color(0xFFEFA961),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: yemekVerileri.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return _buildSiparisCard(yemekVerileri[index]);
        },
      ),
    );
  }

  Widget _buildSiparisCard(Map<String, dynamic> yemek) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              'images/ikon.png', // Bu yol, projenizin dosya yapısına göre değiştirilebilir
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  yemek['ad'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Fiyat: ${yemek['fiyat']} TL',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
