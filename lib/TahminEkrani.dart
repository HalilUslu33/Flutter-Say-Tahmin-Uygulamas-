import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/SonucEkrani.dart';

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {

  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101); // 0-100 arası sayı
    print("Rastgele Sayı : $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "TAHMİN ET",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  // TextField boş ise işlem yapma
                  if (tfTahmin.text.isEmpty) return;

                  setState(() {
                    kalanHak--;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if (tahmin == rasgeleSayi){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Sonucekrani(sonuc: true))
                    );
                    return;
                  }

                  if(tahmin > rasgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }

                  if(tahmin < rasgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }

                  if (kalanHak == 0){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Sonucekrani(sonuc: false))
                    );
                  }

                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}