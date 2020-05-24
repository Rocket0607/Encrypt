import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EncryptTitle());
  }
}

class EncryptTitle extends StatefulWidget {
  @override
  EncryptTitleState createState() => EncryptTitleState();
}

class EncryptTitleState extends State<EncryptTitle> {
  Widget build(BuildContext contect) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          title: Text("Encrypt"),
        ),
        body: EncryptBody());
  }
}

class EncryptBody extends StatefulWidget {
  @override
  EncryptBodyState createState() => EncryptBodyState();
}

class EncryptBodyState extends State<EncryptBody> {
  final textController = TextEditingController();

  encryptText(inputText) {
    final String hi = inputText;

    final encryptedText = hi.codeUnits;
    final finalText = encryptedText.join(" ");

    return finalText;
  }

  decryptText(inputText) {
    final String hi = inputText;
    final boi = hi.split(" ");
    String decryptedText = "";
    for (int i = 0; i < boi.length; i++) {
      final int charInt = int.parse(boi[i]);
      final String char = String.fromCharCode(charInt);
      decryptedText += char;
    }
    return decryptedText;
  }

  String text = "";

  void encryptPressed() {
    setState(() {
      text = encryptText(textController.text);
    });
  }

  void decryptPressed() {
    setState(() {
      text = decryptText(textController.text);
    });
  }

  void clear() {
    setState(() {
      text = "";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Container(
        child: TextField(
          controller: textController,
          maxLines: null,
        ),
      ),
      Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 400.0),
              child: RaisedButton(
                child: Text("Encrypt"),
                onPressed: encryptPressed,
              )),
          RaisedButton(
            child: Text("Decrypt"),
            onPressed: decryptPressed,
          ),
        ])
      ]),
      Container(
        child: Center(child: SelectableText(text)),
      ),
      Padding(
          padding: EdgeInsets.only(left: 00.0),
          child: ButtonTheme(
              minWidth: 100.0,
              buttonColor: Colors.grey[300],
              child: RaisedButton(onPressed: clear, child: Text("Clear"))))
    ]));
  }
}
