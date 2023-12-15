import 'package:flutter/material.dart';
import 'package:restoranotomasyonu/GuncelSiparisler.dart';
import 'package:restoranotomasyonu/SiparisVer.dart';
import 'package:restoranotomasyonu/YemekEkle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEED1A2),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFA961),
        title: Text('Restoran Uygulaması'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text(
              "HOŞGELDİNİZ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF18C25),
              ),
            ),
            SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'images/restoran.png', // Bu yol, projenizin dosya yapısına göre değiştirilebilir
                ),
              ),
            ),
            SizedBox(height: 60), // Araya bir boşluk ekleyelim
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GuncelSiparisler()
                ));
                },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF18C25), // Buton rengi
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Buton boyutu
              ),
              child: Text('Güncel Siparişler'),
            ),
            SizedBox(height: 10), // Araya bir boşluk ekleyelim
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => YemekEkle()
                ));
                },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF18C25), // Buton rengi
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Buton boyutu
              ),
              child: Text('Sisteme Yemek Ekle'),
            ),
            SizedBox(height: 10), // Araya bir boşluk ekleyelim
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SiparisVer()
                ));
                },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF18C25), // Buton rengi
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Buton boyutu
              ),
              child: Text('Yemek Siparişi Ver'),
            ),
          ],
        ),
      ),
    );
  }
}
