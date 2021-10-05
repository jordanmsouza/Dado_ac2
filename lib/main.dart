import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String reason = '';
  var _frases = ["Um", "Dois", "Três", "Quatro", "Cinco", "Seis"];

  var _fraseGerada = "Qual será?";

  void _gerarFrase() {
    // 0, 1
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
      switch (_fraseGerada) {
        case "Um":
          {
            reason = 'assets/die_dribbble.riv';
          }
          break;

        case "Dois":
          {
            reason = 'assets/dado_2.riv';
          }
          break;

        case "Três":
          {
            reason = 'assets/dado_3.riv';
          }
          break;

        case "Quatro":
          {
            reason = 'assets/dado_4.riv';
          }
          break;
        case "Cinco":
          {
            reason = 'assets/dado_5.riv';
          }
          break;
        case "Seis":
          {
            reason = 'assets/dado_6.riv';
          }
          break;

        default:
          {
            reason = 'assets/die_dribbble.riv';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bora brincar de dadinho???'),
        backgroundColor: const Color(0xFF222222),
      ),
      body: Center(
        child: Container(
          color: const Color(0xFF222222),
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250,
                child: RiveAnimation.asset('${reason}'),
              ),
              Text(
                "Escolha sua sorte!!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              ElevatedButton(
                child: Text(
                  "PRESSIONE",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
