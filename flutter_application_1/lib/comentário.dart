import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter_application_1/perfil.dart';
import 'package:flutter_application_1/pageini.dart';
import 'package:flutter_application_1/salvos.dart';

class coments extends StatefulWidget {
  const coments({Key? key}) : super(key: key);

  @override
  State<coments> createState() => _comentsState();

  void isHideBottomNavBar(bool bool) {}
}

class _comentsState extends State<coments> {
  int currentIndex = 0;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red.shade800,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: buildBody(),
        floatingActionButton: buildFloatingActionButton(),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
        child: Column(children: [
      Row(
        children: [
          IconButton(
              icon: Icon(Icons.account_circle), iconSize: 55, onPressed: () {}),
          Container(
              margin: EdgeInsets.all(10),
              child: Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Policial Santos\n",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                TextSpan(text: " Há 13min", style: TextStyle(fontSize: 10))
              ]))),
        ],
      ),
      Card(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "A lazy rain am I The skies refuse to cry Cremation takes its piece of your supply The night is dressed like noon A sailor spoke too soon And China's on the dark side of the Moon Hear me now Platypus are a few The secret life of roo A personality I never knew.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ),
        ]),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Pablo\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "The skies refuse to cry é tipo isso e tá tudo bem!",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Nino\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Concordo plenamente!",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Ademir\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Sem palavras!",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Maicon\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "É algo a se discutir.",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
      Container(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            child: TextField(
              style:
                  TextStyle(fontSize: 20.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8),
                  hintText: "Adicionar comentário",
                  hintStyle: TextStyle(fontSize: 30),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
            ),
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
    ]));
  }

  buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 255, 47, 47)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/brasao.png", height: 40),
          Text(
            "Página Inicial",
            style: TextStyle(color: Colors.black),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red.shade800,
      selectedFontSize: 12,
      selectedItemColor: Colors.grey.shade300,
      unselectedItemColor: Colors.black,
      iconSize: 30,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
            label: "Página Inicial"),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            label: "Procurar"),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.groups_rounded),
              onPressed: () {},
              color: Colors.black,
            ),
            label: "Grupos"),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Salvos();
                }));
              },
            ),
            label: "Salvos"),
      ],
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return novaPubli();
          }),
        );
      },
      child: Icon(Icons.add_rounded, color: Colors.black, size: 30),
      backgroundColor: Colors.red.shade800,
    );
  }
}
