import 'notas.dart';

class Acordes extends NotasMusicais {
  int valorTerca;
  int valorQuinta;

  Acordes() {
    valorTerca = 4;
    valorQuinta = 7;
  }

  void constroiAcordeMaior(int _valorNota) {
    valorTerca = _valorNota + 4;
    valorQuinta = _valorNota + 7;
  }

  void constroiAcordeMenor(int _valorNota) {
    valorTerca = _valorNota + 3;
    valorQuinta = _valorNota + 7;
  }

  void constroiAcordeAumentado(int _valorNota) {
    valorTerca = _valorNota + 4;
    valorQuinta = _valorNota + 8;
  }

  void constroiAcordeDiminuto(int _valorNota) {
    valorTerca = _valorNota + 3;
    valorQuinta = _valorNota + 6;
  }
}
