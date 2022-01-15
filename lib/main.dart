import 'dart:ui';
import 'package:flutter/material.dart';
import './verificarMaxSeqNum.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(maxSeqNumerica());
}

class maxSeqNumerica extends StatefulWidget {
  maxSeqNumerica({Key? key}) : super(key: key);

  @override
  _maxSeqNumericaState createState() => _maxSeqNumericaState();
}

class _maxSeqNumericaState extends State<maxSeqNumerica> {
  String numeroInformado = "";
  String result = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
              child: Center(
                child: Text(
                  "Obter maior sequência numérica".toUpperCase(),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 1),
              child: Center(
                child: Text(
                  "Resultado: ",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 1, 80, 20),
              child: Container(
                height: 80,
                width: 280,
                color: Colors.black12,
                child: Center(
                  child: Text(
                    result,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: Container(
                width: 350,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return "O campo está vazio!";
                        if (value.length < 2)
                          return "Digite pelo menos 2 números";
                        return null;
                      },
                      onChanged: (value) => numeroInformado = value,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            "Digite o número desejado (máx 30 caracteres)",
                        hintStyle: TextStyle(fontSize: 13),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(30),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        return result = obterMaxSequencia(numeroInformado);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Text(
                      "Verificar".toUpperCase(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
