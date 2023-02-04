class NotasMusicais {
  int valorNota;
  String nota;

  NotasMusicais() {
    valorNota = 0;
  }

  int calculaOitava(int _valorNota) {
    return (_valorNota ~/ 12).toInt();
  }

  String notaMusical(int _valorNota) {
    if (_valorNota > 11) {
      _valorNota -= 12;
      notaMusical(_valorNota);
    } else if (_valorNota < 0) {
      _valorNota += 12;
      notaMusical(_valorNota);
    } else {
      switch (_valorNota) {
        case 0:
          {
            nota = "A";
          }

          break;

        case 1:
          {
            nota = "A#";
          }

          break;

        case 2:
          {
            nota = "B";
          }

          break;

        case 3:
          {
            nota = "C";
          }

          break;

        case 4:
          {
            nota = "C#";
          }

          break;

        case 5:
          {
            nota = "D";
          }

          break;

        case 6:
          {
            nota = "D#";
          }

          break;

        case 7:
          {
            nota = "E";
          }

          break;

        case 8:
          {
            nota = "F";
          }

          break;

        case 9:
          {
            nota = "F#";
          }

          break;

        case 10:
          {
            nota = "G";
          }

          break;

        case 11:
          {
            nota = "G#";
          }

          break;
      }
    }
    return nota;
  }

  void aumentaNota() {
    valorNota += 1;
  }

  void diminuiNota() {
    valorNota -= 1;
  }

  void aumentaTom(int _valorNota) {
    valorNota = valorNota + _valorNota;
  }

  void diminuiTom(int _valorNota) {
    valorNota = valorNota - _valorNota;
  }
}
