import 'dart:convert';

import 'package:gerador_de_cifras/acordes.dart';
import 'package:gerador_de_cifras/notas.dart';

class InstrumentoDeCorda extends Acordes {
  List valorCorda = new List();
  List notaCorda = new List();
  List<List> casa = new List(12);
  List posNotaPrincipalCorda = new List();
  List posNotaPrincipalCasa = new List();
  List posNotaTercaCorda = new List();
  List posNotaTercaCasa = new List();
  List posNotaQuintaCorda = new List();
  List posNotaQuintaCasa = new List();

  InstrumentoDeCorda(List _valorCorda) {
    valorCorda = _valorCorda;
    notasCasa();
  }

  void afinacaoInstrumento() {
    for (int i = 0; i < valorCorda.length; i++) {
      notaCorda.add(notaMusical(valorCorda[i]));
    }
  }

  void notasCasa() {
    for (int i = 0; i < 12; i++) {
      casa[i] = new List(valorCorda.length);
    }

    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < valorCorda.length; j++) {
        casa[i][j] = valorCorda[j] + i;
      }
    }
  }

  List construcaoAcordeInstrumento(int _notaPadrao, String _tipoAcorde) {
    valorNota = _notaPadrao;
    String nota = notaMusical(_notaPadrao);

    List acordeInstrumento = new List();

    switch (_tipoAcorde) {
      case "Maior":
        {
          constroiAcordeMaior(_notaPadrao);
        }
        break;

      case "Menor":
        {
          constroiAcordeMenor(_notaPadrao);
        }
        break;

      case "Aumentado":
        {
          constroiAcordeAumentado(_notaPadrao);
        }
        break;

      case "Diminuto":
        {
          constroiAcordeDiminuto(_notaPadrao);
        }
        break;
    }

    for (int i = 0; i < valorCorda.length; i++) {
      for (int j = 0; j < 12; j++) {
        if (nota == notaMusical(casa[j][i])) {
          posNotaPrincipalCorda.add(i);
          posNotaPrincipalCasa.add(j);
        } else if (notaMusical(valorTerca) == notaMusical(casa[j][i])) {
          posNotaTercaCorda.add(i);
          posNotaTercaCasa.add(j);
        } else if (notaMusical(valorQuinta) == notaMusical(casa[j][i])) {
          posNotaQuintaCorda.add(i);
          posNotaQuintaCasa.add(j);
        } else {
          // print("next");
        }
      }
    }

    print("valor nota: " + nota);

    for (int i = 0; i < valorCorda.length; i++) {
      if (posNotaPrincipalCasa[i] < posNotaTercaCasa[i]) {
        if (posNotaPrincipalCasa[i] < posNotaQuintaCasa[i]) {
          acordeInstrumento.add(posNotaPrincipalCasa[i]);
        } else {
          acordeInstrumento.add(posNotaQuintaCasa[i]);
        }
      } else if (posNotaTercaCasa[i] < posNotaQuintaCasa[i]) {
        if (posNotaTercaCasa[i] < posNotaPrincipalCasa[i]) {
          acordeInstrumento.add(posNotaTercaCasa[i]);
        } else {
          acordeInstrumento.add(posNotaPrincipalCasa[i]);
        }
      } else if (posNotaQuintaCasa[i] < posNotaPrincipalCasa[i]) {
        if (posNotaQuintaCasa[i] < posNotaTercaCasa[i]) {
          acordeInstrumento.add(posNotaQuintaCasa[i]);
        } else {
          acordeInstrumento.add(posNotaTercaCasa[i]);
        }
      }
    }

    //  marcaCasaNotaDiferente();

    for (int i = 0; i < valorCorda.length; i++) {
      for (int j = 0; j < 12; j++) {
        if (casa[j][i] > 0) {
          // acordeInstrumento.add(j.toString() + " ; " + i.toString());
        }
      }
    }

    print(acordeInstrumento);

    posNotaPrincipalCasa = [];
    posNotaTercaCasa = [];
    posNotaQuintaCasa = [];
    return [];
  }

  void marcaCasaNotaDiferente() {
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < valorCorda.length; j++) {
        if ((notaMusical(valorNota) != notaMusical(casa[i][j])) &&
            (notaMusical(valorTerca) != notaMusical(casa[i][j])) &&
            (notaMusical(valorQuinta) != notaMusical(casa[i][j]))) {
          casa[i][j] = -1;
        }
      }
    }
  }
}

/*

  acordeInstrumento.add("Nota: " +
              notaMusical(casa[i][j]) +
              " | Casa: " +
              i.toString() +
              " | Corda: " +
              j.toString() +
              "\n");

if ((notaMusical(casa[posNotaPrincipalCasa[i]][i])) ==
          notaMusical(valorCorda[i])) {
        acordeInstrumento.add(posNotaPrincipalCasa[i]);
      } else if ((notaMusical(casa[posNotaTercaCasa[i]][i])) ==
          notaMusical(valorCorda[i])) {
        acordeInstrumento.add(posNotaTercaCasa[i]);
      } else if ((notaMusical(casa[posNotaQuintaCasa[i]][i])) ==
          notaMusical(valorCorda[i])) {
        acordeInstrumento.add(posNotaQuintaCasa[i]);
      } else if ((posNotaPrincipalCasa[i] - 3) > 0) {
        calculaCasa(casa[posNotaQuintaCasa[i]][i]);
      }


print("Nota Principal: " + notaMusical(casa[posNotaPrincipalCasa[i]][i]));
      print("Corda: " + notaMusical(valorCorda[i]));
      print("\n");
      print(posNotaPrincipalCasa[i]);
      print(" - ");
      print(posNotaTercaCasa[i]);
      print(" - ");
      print(posNotaQuintaCasa[i]);
      print("\n");
      print("------------------");
      print("\n");


*/
