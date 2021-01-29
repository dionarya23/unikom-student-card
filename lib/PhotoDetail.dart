import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final String url;
  final String nim;

  Map<String, String> jurusan = {
    "101": "Teknik Informatika",
    "102": "Sistem Komputer",
    "103": "Teknik Industri",
    "104": "Arsitektur",
    "105": "Sistem Informasi",
    "106": "Perancangan Wilayah Kota",
    "109": "Manajemen Informatika",
    "119": "Desain Komunikasi Visual",
    "120": "Desain Interior",
    "130": "Teknik Sipil",
    "131": "Teknik Elektro",
    "140": "Sistem Informasi Internasional",
    "418": "Ilmu Komunikasi",
    "638": "Sastra Jepang",
    "637": "Sastra Inggris",
    "123": "Komputerisasi Akuntansi",
    "417": "Ilmu Pemerintahan",
    "316": "Ilmu Hukum",
    "215": "Kuangan Perbankan",
    "212": "Manajemen",
  };

  PhotoDetail({@required this.url, this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 58.0, bottom: 40.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFFFEFEFE),
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        url,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: Text(
                  '#$nim',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    "MAJOR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFB1A9AB)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    jurusan[nim.substring(0,3)],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    "YEAR OF ENTRY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFB1A9AB)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    '20${nim.substring(3, 5)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
