
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/Sabitler/renkler.dart';

void HataDialog({
  required BuildContext context,
  required String baslik,
  required String metin,
  bool disari_tiklama = true
}) {
  showDialog(
    context: context,
    barrierDismissible: disari_tiklama,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          baslik,
          style: GoogleFonts.comfortaa(
              color: renk21, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        content: Container(
          width: 400,
          child: Text(
          metin,
          style: GoogleFonts.comfortaa(
              color: siyah, fontWeight: FontWeight.normal, fontSize: 16),
        ),),
        actions: [
         disari_tiklama == true ? TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Kapat",
              style: GoogleFonts.comfortaa(
                  color: renk2, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ) : Container(),
        ],
      );
    },
  );
}
