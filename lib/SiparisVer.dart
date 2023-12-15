import 'package:flutter/material.dart';
import 'package:restoranotomasyonu/YemekServisi.dart';

class SiparisVer extends StatefulWidget {
  const SiparisVer({Key? key}) : super(key: key);

  @override
  State<SiparisVer> createState() => _SiparisVerState();
}

class _SiparisVerState extends State<SiparisVer> {
  String? secilenYemek;
  double odenecekFiyat = 0.0;

  // Servis üzerinden yemek verilerine erişim
  List<Map<String, dynamic>> get yemekVerileri => YemekServisi.yemekVerileri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEED1A2),
      appBar: AppBar(
        title: Text('Sipariş Ver'),
        backgroundColor: Color(0xFFEFA961),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'images/Restoran2.png', // Bu yol, projenizin dosya yapısına göre değiştirilebilir
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Yemeğinizi Seçin',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: DropdownButton<String>(
                  value: secilenYemek,
                  onChanged: (String? newValue) {
                    setState(() {
                      secilenYemek = newValue;
                      // Seçilen yemeğin fiyatını bul
                      odenecekFiyat = _fiyatBul(newValue);
                    });
                  },
                  items: yemekVerileri.map((Map<String, dynamic> yemek) {
                    return DropdownMenuItem<String>(
                      value: yemek['ad'],
                      child: Text(yemek['ad']),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ödenecek Fiyat: $odenecekFiyat TL',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Siparişi Onayla
                _siparisOnayla();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF18C25), // Turuncu renk
              ),
              child: Text('Onayla'),
            ),
          ],
        ),
      ),
    );
  }

  // Seçilen yemeğin fiyatını bulan yardımcı fonksiyon
  double _fiyatBul(String? yemekAdi) {
    if (yemekAdi != null) {
      for (var yemek in yemekVerileri) {
        if (yemek['ad'] == yemekAdi) {
          return yemek['fiyat'];
        }
      }
    }
    return 0.0;
  }

  // Siparişi Onaylayan yardımcı fonksiyon
// Siparişi Onaylayan yardımcı fonksiyon
  void _siparisOnayla() {
    if (secilenYemek != null) {
      // Seçilen yemeği yemekVerileri listesinden sil
      yemekVerileri.removeWhere((yemek) => yemek['ad'] == secilenYemek);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sipariş Verildi'),
            content: Text('Seçilen yemek: $secilenYemek\nÖdenecek Fiyat: $odenecekFiyat TL\n\n\nSipariş Listeden Düşüldü!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF18C25), // Turuncu renk
                ),
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

}
