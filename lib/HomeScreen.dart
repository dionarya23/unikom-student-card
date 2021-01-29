import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:unikom_student_card/PhotoDetail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String nim = "0", uri = "https://akademik.unikom.ac.id/foto";
  bool photoTersedia = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 58.0, bottom: 24.0),
          child: Container(
            child: Text(
              "사진",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              setState(() {
                nim = text;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF3F3F4),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  var res = await http.get('$uri/$nim.jpg');
                  if (res.statusCode == 200) {
                  setState(() {
                    photoTersedia = true;
                  });
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return PhotoDetail(
                        url: '$uri/$nim.jpg',
                        nim: nim,
                      );
                    }));
                  }else {
                  setState(() {
                    photoTersedia = false;
                  });
                } 
                },
              ),
              labelText: "Find by NIM",
              labelStyle: TextStyle(fontWeight: FontWeight.w300),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Color(0xFFF3F3F4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(color: Color(0xFFF3F3F4)),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: (photoTersedia)
                ? Text("")
                : Text(
                    "Sorry, not found  😥",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
          ),
        )
      ],
    )));
  }
}
