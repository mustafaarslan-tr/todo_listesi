import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Itemler/hata_dialog.dart';
import 'package:todo_list/Itemler/oncelik_butonu.dart';
import 'package:todo_list/Modeller/to_to_model.dart';
import 'package:todo_list/Sabitler/provider.dart';
import 'package:todo_list/Sabitler/renkler.dart';

class GorevEklemeMenusu extends StatefulWidget {
  const GorevEklemeMenusu({super.key});

  @override
  State<GorevEklemeMenusu> createState() => _GorevEklemeMenusuState();
}

class _GorevEklemeMenusuState extends State<GorevEklemeMenusu> {
  TextEditingController _textEditingController = TextEditingController();

  Color secili_renk = gri;
  String gorev_metni = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(maxHeight: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yeni Görev Ekleme",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: renk16,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: renk16,
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: renk16,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                constraints: BoxConstraints(maxHeight: 100),
                child: SingleChildScrollView(
                  child: TextField(
                    maxLines: null,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Görev metnini buraya yazın.',
                      filled: true,
                      fillColor: kirik_beyaz,
                      hintStyle: GoogleFonts.comfortaa(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: gri,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: kirik_beyaz,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: kirik_beyaz,
                          width: 2.0,
                        ),
                      ),
                    ),
                    cursorColor: Colors.transparent,
                    showCursor: false,
                    style: GoogleFonts.comfortaa(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: siyah,
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secili_renk = renk10;
                    });
                  },
                  child: OncelikButonu(
                      metin: "Düşük",
                      renk: secili_renk == renk10 ? secili_renk : gri),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secili_renk = renk9;
                    });
                  },
                  child: OncelikButonu(
                      metin: "Orta",
                      renk: secili_renk == renk9 ? secili_renk : gri),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secili_renk = renk20;
                    });
                  },
                  child: OncelikButonu(
                      metin: "Yüksek",
                      renk: secili_renk == renk20 ? secili_renk : gri),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: renk19,
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Kaydet",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: beyaz,
                  ),
                ),
              ),
              onTap: () {
                if (_textEditingController.text.isEmpty) {
                  HataDialog(
                      context: context,
                      baslik: "Hata!",
                      metin: "Görev metnini girmediniz!");
                } else if (secili_renk == gri) {
                  HataDialog(
                      context: context,
                      baslik: "Hata!",
                      metin: "Görev için öncelik seçmediniz!");
                } else {
                  Navigator.of(context).pop();

                  Provider.of<ProviderData?>(context, listen: false)!
                      .YeniGorevEkleme(ToDoModel(
                          metin: _textEditingController.text,
                          oncelik_rengi: secili_renk));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
