import 'package:flutter/material.dart';
import 'package:restoranotomasyonu/YemekServisi.dart';

class YemekEkle extends StatefulWidget {
  const YemekEkle({Key? key}) : super(key: key);

  @override
  State<YemekEkle> createState() => _YemekEkleState();
}

class _YemekEkleState extends State<YemekEkle> {
  // Servis üzerinden yemek verilerine erişim
  List<Map<String, dynamic>> get yemekVerileri => YemekServisi.yemekVerileri;

  TextEditingController adController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();

  void _veriEkle() {
    String ad = adController.text;
    double fiyat = double.tryParse(fiyatController.text) ?? 0.0;

    if (ad.isNotEmpty && fiyat > 0) {
      setState(() {
        yemekVerileri.add({'ad': ad, 'fiyat': fiyat});
      });

      // Text alanlarını temizle
      adController.clear();
      fiyatController.clear();

      // Yemeğin başarıyla eklendiğini bildiren AlertDialog göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Yemeğiniz Başarıyla Eklenmiştir!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEED1A2),
      appBar: AppBar(
        title: Text('Yemek Ekle'),
        backgroundColor: Color(0xFFEFA961),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: yemekVerileri.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
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
                Text(
                  yemekVerileri[index]['ad'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Fiyat: ${yemekVerileri[index]['fiyat']} TL',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Yemek Ekle'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: adController,
                      decoration: InputDecoration(labelText: 'Yemek Adı'),
                    ),
                    TextField(
                      controller: fiyatController,
                      decoration: InputDecoration(labelText: 'Yemek Fiyatı'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('İptal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _veriEkle();
                      Navigator.of(context).pop();
                      AlertDialog();
                    },
                    child: Text('Ekle'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF18C25),
      ),
    );
  }
}
