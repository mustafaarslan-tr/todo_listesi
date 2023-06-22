import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/Sabitler/renkler.dart';

class OncelikButonu extends StatefulWidget {
  String metin;
  Color renk;
  OncelikButonu({super.key, required this.metin, required this.renk});

  @override
  State<OncelikButonu> createState() => _OncelikButonuState();
}

class _OncelikButonuState extends State<OncelikButonu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.renk,
      ),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        widget.metin,
        textAlign: TextAlign.center,
        style: GoogleFonts.comfortaa(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: beyaz,
        ),
      ),
    );
  }
}
