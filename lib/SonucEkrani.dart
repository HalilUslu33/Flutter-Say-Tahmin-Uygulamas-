import 'package:flutter/material.dart';

class Sonucekrani extends StatefulWidget {

  final bool sonuc;

  const Sonucekrani({super.key, required this.sonuc});

  @override
  State<Sonucekrani> createState() => _SonucekraniState();
}

class _SonucekraniState extends State<Sonucekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            widget.sonuc ? Image.asset("resimler/mutlu_resim.png") : Image.asset("resimler/uzgun_resim.png"),
            Text( widget.sonuc ?
              "Kazandınız" : "Kaybettiniz",
              style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "TEKRAR DENE",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}