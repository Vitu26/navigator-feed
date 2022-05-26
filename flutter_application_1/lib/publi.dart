import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter_application_1/perfil.dart';
import 'package:flutter_application_1/pageini.dart';
import 'package:flutter_application_1/salvos.dart';


class publi extends StatefulWidget {
  const publi({Key? key}) : super(key: key);

  @override
  State<publi> createState() => _publi();

  void isHideBottomNavBar(bool bool) {}
}

class _publi extends State<publi> {
  int currentIndex = 0;

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
          floatingActionButton: buildFloatingActionButton(),
          appBar: buildAppBar(),
          body: buildBody(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: buildBottomNavigationBar(),
          ),
          
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return novaPubli();
        }),
        );
      },
      child: Icon(Icons.add_rounded, color: Colors.black, size: 30),
      backgroundColor: Colors.red.shade800,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              TextSpan(text: " Há 13min", style: TextStyle(fontSize: 10))
            ]))),
      ],
    ),
    Container(
      margin: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Text(
            "Título",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    ),
    Card(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "A lazy rain am I The skies refuse to cry Cremation takes its piece of your supply The night is dressed like noon A sailor spoke too soon And China's on the dark side of the Moon Hear me now Platypus are a few The secret life of roo A personality I never knew (Get it on) My crater weighs a ton The archer's on the run And no one stands alone behind the Sun It's been a long time since I made a new friend Waiting on another black summer to end It's been a long time and you never know when Waiting on another black summer to end Back the flaming whip Are sailing on our censorship Riding on a headless horse to make the trip.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  onPressed: () {},
                ),
                Text(
                  "16",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ]),
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
              "Post",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              icon: Icon(Icons.close, size: 30, color: Colors.black,)),
          ],
        ));
  }
}


