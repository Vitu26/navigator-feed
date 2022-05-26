import 'dart:io';

import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/perfil.dart';
import 'package:flutter_application_1/publi.dart';
import 'package:flutter_application_1/comentário.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pageini.dart';


class Salvos extends StatefulWidget {
  const Salvos({Key? key}) : super(key: key);

  @override
  State<Salvos> createState() => _SalvosState();

  void isHideBottomNavBar(bool bool) {}
}

class _SalvosState extends State<Salvos> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red.shade800,
        ),
      ),
      debugShowCheckedModeBanner: false,
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
  
  buildBody() {
    return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child:
                                Image.asset("images/police.png", height: 40)),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Policial Santos\n",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Há 13min",
                                  style: TextStyle(fontSize: 10))
                            ]))),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(25, 12, 0, 0),
                                child: Text(
                                  "Adolescentes são abordados com maconha",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Image.asset("images/policial.png"))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.all(7),
                              child: Text(
                                "Suspeitos foram encontrados com maconha nas redondezas do Mangabeira.",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.justify,
                              ),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up_alt_outlined),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "25",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.comment_outlined),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.bookmark_border),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.share), onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 13),
                            child:
                                Image.asset("images/police.png", height: 40)),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Policial Barbosa\n",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Há 2 h",
                                  style: TextStyle(fontSize: 10))
                            ]))),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(15, 20, 0, 10),
                                child: Text(
                                    "Abordagem policial na Praça da Paz",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Image.asset("images/policial.png"))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.all(7),
                              child: Text(
                                "Jovens foram abodados e revistados em ação policial realizada na Praça da Paz, no bairro dos Bancários na noite de sexta-feira.",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.justify,
                              ),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up_alt_outlined),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "12",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.comment_outlined),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.bookmark_border),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.share), onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
              "Salvos",
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
  
  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return novaPubli();
        }));
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
              onPressed: () {},
            ),
            label: "Salvos"),
      ],
    );
  }
}


