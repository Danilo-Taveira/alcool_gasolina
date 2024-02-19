import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textResultado = 'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textResultado = 'Melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          _textResultado = 'Melhor abastecer com álcool';
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset('images/logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Saiba qual a melhor opção para abastecimento do seu carro',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço Álcool, ex: 1.59'
              ),
              style: const TextStyle(
                fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço Gasolina, ex: 3.59'
              ),
              style: const TextStyle(
                fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: _calcular,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textResultado,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}