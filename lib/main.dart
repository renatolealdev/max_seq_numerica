import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CupertinoApp(
      home: Theme(
        data: ThemeData.dark(),
        child: Container(
          child: Column(
            children: [
              Container(
                child: Text("Insira o número desejado:"),
              ),
              Container(
                child: CupertinoButton(
                  child: Text("Verificar"),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
