import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Modeller/to_to_model.dart';
import 'package:todo_list/Sabitler/provider.dart';
import 'package:todo_list/Sabitler/renkler.dart';

void GorevSilme({required BuildContext context, required ToDoModel model}){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Görev Silinecek",
          style: GoogleFonts.comfortaa(
              color: renk_esitlikler, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: Container(
          width: 400,
          child: RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "${model.metin}",
                style: GoogleFonts.comfortaa(
                    color: renk21, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextSpan(
                text: " silinsin mi?",
                style: GoogleFonts.comfortaa(
                    color: siyah, fontWeight: FontWeight.normal, fontSize: 16),
              )
            ]
          ),
          ),),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<ProviderData?>(context, listen: false)!.ListedenGorevSilme(model);
              Navigator.pop(context);
            },
            child: Text(
              "Sil",
              style: GoogleFonts.comfortaa(
                  color: renk21, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Kapat",
              style: GoogleFonts.comfortaa(
                  color: renk2, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ],
      );
    },
  );
}