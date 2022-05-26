import 'dart:io';

import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/perfil.dart';
import 'package:flutter_application_1/publi.dart';
import 'package:flutter_application_1/comentário.dart';
import 'package:flutter_application_1/salvos.dart';

import 'dados.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<Dados> teste = [];

  get image => null;
  
  
  bool salvo = false;
  bool selecionado = false;
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
        bottomNavigationBar: buildBottomNavigationbar(),
      ),
    );
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
          Text("PM-PB",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: teste.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        });
  }

  buildItem(index) {
    return Container(
      child: Expanded(
        child: Card(
          child: Column(
            children: [
              Text("${teste[index].titulo}",style: TextStyle(fontWeight: FontWeight.bold)),
              Text("${teste[index].descricao}",),
              Row(
                children: [
                  Expanded(child:image != null ? Image.file(image!) : Image.file(teste[index].image)), 
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.thumb_up_alt_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        Dados dados =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return novaPubli();
        }));

        setState(() {
          teste.add(dados);
        });
      },
      child: Icon(Icons.add, color: Colors.black,),
      backgroundColor: Colors.red.shade700,
    );
  }

  buildBottomNavigationbar() {
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
}
