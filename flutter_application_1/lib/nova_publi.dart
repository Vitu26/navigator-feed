import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class novaPubli extends StatefulWidget {
  const novaPubli({Key? key}) : super(key: key);

  @override
  State<novaPubli> createState() => _novaPubliState();
}

class _novaPubliState extends State<novaPubli> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
     backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            backgroundColor: Colors.redAccent.shade700,
            title: Row(
              children: [
                Image.asset(
                  'Images/brasao.png',
                  fit: BoxFit.contain,
                  height: 40,
                ),
                Text(
                  "    Nova publicação",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(25),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("Images/Unknown_person.jpg"),
                    ),
                    Text(
                      "    Geraldo",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                //margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.6, color: Colors.black),
                    bottom: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                      fontSize: 40.0, height: 1.0, color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      hintText: "Título",
                      hintStyle: TextStyle(fontSize: 30),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                ),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8),
                    hintText: "Descrição",
                    hintStyle: TextStyle(fontSize: 20),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          color: Colors.red.shade700,
          child: InkWell(
            onTap: () {
              //print('called on tap');
            },
            child: SizedBox(
                height: 56,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.perm_media_outlined),
                    Text(
                      '  Adicionar foto/vídeo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade700,
          onPressed: () {},
          child: Icon(
            Icons.check,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
