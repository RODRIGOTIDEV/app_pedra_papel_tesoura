import 'dart:math' show Random;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List optios = ["pedra", "papel", "tesoura"];
  String _message = "Escolha uma opção!";
  String _imagePath = "assets/images/padrao.png";

  void _play(String choice) {
    int i = Random().nextInt(optios.length);
    String randomChaice = optios[i];
    _imagePath = "assets/images/$randomChaice.png";
    if ((choice == "pedra" && randomChaice == "tesoura") ||
        (choice == "papel" && randomChaice == "pedra") ||
        (choice == "tesoura" && randomChaice == "papel")) {
      setState(() {
        _message = " Você venceu =D";
      });
    } else if ((choice == "pedra" && randomChaice == "papel") ||
        (choice == "papel" && randomChaice == "tesoura") ||
        (choice == "tesoura" && randomChaice == "pedra")) {
      setState(() {
        _message = " Você perdeu =C";
      });
    } else {
      setState(() {
        _message = " Empate =|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'JokenPo',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        )),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 150),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Escolha do App ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              _imagePath,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _message,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("pedra"),
                  child: Image.asset(
                    'assets/images/pedra.png',
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("papel"),
                  child: Image.asset(
                    'assets/images/papel.png',
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("tesoura"),
                  child: Image.asset(
                    'assets/images/tesoura.png',
                    height: 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
