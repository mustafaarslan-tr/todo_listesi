import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Itemler/gorev_ekleme_menu.dart';
import 'package:todo_list/Itemler/oncelik_butonu.dart';
import 'package:todo_list/Itemler/to_do_item.dart';
import 'package:todo_list/Modeller/to_to_model.dart';
import 'package:todo_list/Sabitler/provider.dart';
import 'package:todo_list/Sabitler/renkler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: beyaz,
        appBar: AppBar(
            backgroundColor: beyaz,
            elevation: 0.6,
            shadowColor: renk21,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ToDo Listesi",
                  style: GoogleFonts.comfortaa(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                    color: renk21,
                  ),
                ),
                IconButton(
                    onPressed: ListeyeGorevEkleme,
                    icon: Icon(
                      Icons.add_circle,
                      color: renk21,
                      size: 30,
                    ))
              ],
            )),
        body: Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: context.watch<ProviderData>().gorevler.isNotEmpty
                ? ListView.builder(
                    itemCount: context.watch<ProviderData>().gorevler.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(model: context.watch<ProviderData>().gorevler[index]);
                    },
                  )
                : Center(
                    child: GestureDetector(
                    onTap: ListeyeGorevEkleme,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: renk21, width: 2),
                          color: beyaz),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_task,
                            size: 40,
                            color: renk21,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Listede hiç görev yok.\nEklemek için tıkla!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.comfortaa(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: renk21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))));
  }


  void ListeyeGorevEkleme() {
    bool secili_durumu = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return GorevEklemeMenusu();
      },
    );
  }
}
