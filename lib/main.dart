import 'package:flutter/material.dart';
import 'package:gerador_de_cifras/instrumento.dart';
import 'acordes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Acordes nm = new Acordes();
  InstrumentoDeCorda violao = new InstrumentoDeCorda([7, 12, 17, 22, 26, 31]);
  InstrumentoDeCorda viola = new InstrumentoDeCorda([2, 7, 11, 2, 7]);

  void _aumentaTom() {
    setState(() {
      violao.casa.last.toString();
      nm.aumentaNota();
      //   nm.controiAcordeMenor();
    });
  }

  void _diminuiTom() {
    setState(() {
      nm.diminuiNota();
      nm.calculaOitava(250);
      // nm.controiAcordeMenor();
      violao.construcaoAcordeInstrumento(0, "Maior"); //A
      violao.construcaoAcordeInstrumento(1, "Maior"); //A#
      violao.construcaoAcordeInstrumento(2, "Maior"); //B
      violao.construcaoAcordeInstrumento(3, "Maior"); //C
      violao.construcaoAcordeInstrumento(4, "Maior"); //C#
      violao.construcaoAcordeInstrumento(5, "Maior"); //D
      violao.construcaoAcordeInstrumento(6, "Maior"); //D#
      violao.construcaoAcordeInstrumento(7, "Maior"); //E
      violao.construcaoAcordeInstrumento(8, "Maior"); //F
      violao.construcaoAcordeInstrumento(9, "Maior"); //F#
      violao.construcaoAcordeInstrumento(10, "Maior"); //G
      violao.construcaoAcordeInstrumento(11, "Maior"); //G#
      print("--------");
      // viola.construcaoAcordeInstrumento(0, "Maior"); //A
      //viola.construcaoAcordeInstrumento(2, "Maior"); //B
      // viola.construcaoAcordeInstrumento(3, "Maior"); //C
      // viola.construcaoAcordeInstrumento(5, "Maior"); //D
      // viola.construcaoAcordeInstrumento(7, "Maior"); //E
      // viola.construcaoAcordeInstrumento(8, "Maior"); //F
      // viola.construcaoAcordeInstrumento(10, "Maior"); //G
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nm.notaMusical(nm.valorNota) +
                  " -- " +
                  // violao.notaMusical(violao.casa[4][3]) +
                  nm.calculaOitava(250).toString() +
                  " -- " +
                  nm.notaMusical(nm.valorQuinta),
            ),
            Text(
              nm.notaMusical(nm.valorNota),
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
              onPressed: _diminuiTom,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _aumentaTom,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
