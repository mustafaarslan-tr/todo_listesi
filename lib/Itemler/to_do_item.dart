import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Itemler/gorev_silme.dart';
import 'package:todo_list/Modeller/to_to_model.dart';
import 'package:todo_list/Sabitler/provider.dart';
import 'package:todo_list/Sabitler/renkler.dart';

class ToDoItem extends StatefulWidget {
  ToDoModel model;

  ToDoItem({required this.model});

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool secim = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          secim = !secim;
        });
      },
      onLongPress: () {
        setState(() {
          GorevSilme(context: context, model: widget.model);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Checkbox(
              activeColor: renk20,
              value: secim,
              onChanged: (value) {
                setState(() {
                  secim = value!;
                });
              },
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                widget.model.metin,
                style: secim
                    ? GoogleFonts.comfortaa(
                        fontSize: 14.0,
                        color: gri,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      )
                    : GoogleFonts.comfortaa(
                        fontSize: 14.0,
                        color: renk20,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
                width: 14,
                height: 14,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.model.oncelik_rengi,
                ))
          ],
        ),
      ),
    );
  }
}
