import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter_application_1/pageini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/salvos.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  int currentIndex = 0;
  File? image;

  get source => null;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporaria = File(image.path);
      setState(() => this.image = imageTemporaria);
    } on PlatformException catch (e) {
      print('Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.red.shade800,
      )),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: buildBody(),
        floatingActionButton: buildFloatingActionButton(),
        bottomNavigationBar: buldBottomNavigationBar(),
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
              "Perfil",
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

  buildBody() {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        color: Color.fromARGB(255, 239, 143, 136),
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                child: image != null
                    ? ClipOval(child: Image.file(image!))
                    : CircleAvatar(
                        backgroundImage:
                            AssetImage('images/IMG_20220513_172209.jpg'),
                        radius: 110,
                        onBackgroundImageError: (e, s) {
                          debugPrint('problema de imagem, $e,$s');
                        }),
              ),
            ),
            Positioned(
              right: 100,
              top: 15,
              child: InkWell(
                onTap: () => pickImage(
                  ImageSource.gallery,
                ),
                child: Ink(
                  child: Icon(
                    Icons.photo_camera,
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Row(children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Icon(
            Icons.account_circle,
            size: 40,
          ),
        ),
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  left: .1,
                  top: 10,
                ),
                child: Text(
                  "Nome",
                  style: TextStyle(fontSize: 15.0),
                )),
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Thor, Filho de Odin",
                  style: TextStyle(fontSize: 20.0),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 37),
          child: Row(
            
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
          ),
        )
      ]),
      Container(
        margin: EdgeInsets.all(5),
        child: Divider(
          color: Colors.grey,
        ),
      ),
      Row(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Icon(
              Icons.info_outline,
              size: 40,
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  "Cachorrinho mt louco e comilão",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                )),
          ),
          Row(
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
          )
        ],
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: Divider(color: Colors.grey),
      ),
      Row(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Icon(
              Icons.group_add,
              size: 40,
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Criar Grupo",
                style: TextStyle(fontSize: 20.0),
              )),
        ],
      ),
      Container(
        margin: EdgeInsets.all(40),
        child: Divider(
          color: Colors.grey,
        ),
      )
    ]));
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

  buldBottomNavigationBar() {
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