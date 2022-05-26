import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pageini.dart';
import 'package:image_picker/image_picker.dart';

import 'dados.dart';

class novaPubli extends StatefulWidget {
  const novaPubli({Key? key}) : super(key: key);

  @override
  State<novaPubli> createState() => _novaPubliState();
}

class _novaPubliState extends State<novaPubli> {
  
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

  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();
  
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
        appBar: buildAppBar(),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Expanded(
          child: Card(
              child: (Container(
                child: Column(
                  children: [
                    TextField(
                      controller: edtTitulo,
                    ),
                    Container(
                      child: image != null ? Image.file(image!) : Icon(Icons.add_box_outlined,size: 120)
                    ),
                    TextButton(onPressed: () => pickImage(ImageSource.gallery), child: Text("Coloque sua foto")),
                    TextField(
                      controller: edtDescricao,
                    ),
                    Container(
                      child: Text("Teste!"),
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context, Dados(edtTitulo.text, edtDescricao.text, image!));
                    }, child: Text("APERTA"))
                  ],
                ),
              )),
            ),
        ),
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
}
