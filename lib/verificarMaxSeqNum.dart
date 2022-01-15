import './main.dart';

obterMaxSequencia(String numInfo) {
  List convertStringEmListString = numInfo.split("");
  List<int> listInt = [];
  for (var element in convertStringEmListString) {
    listInt.add(int.parse(element));
  }
  List<String> resultadoFinal = [];
  List<dynamic> resultadoTempInt = [];
  List<String> resultadoTempString = [];
  var strTemp = null;
  String? verifFinal = null;

  listInt.forEach((element) {
    if (resultadoTempInt.length == 0) {
      resultadoTempInt.add(element);
    } else {
      if ((element == resultadoTempInt.last + 1) ||
          (element == 0 && resultadoTempInt.last == 9)) {
        resultadoTempInt.add(element);
      } else {
        for (var elemento in resultadoTempInt) {
          resultadoTempString.add(elemento.toString());
        }
        strTemp = resultadoTempString.join();
        resultadoFinal.add(strTemp);
        resultadoTempInt.clear();
        resultadoTempString.clear();
        resultadoTempInt.add(element);
      }
    }
  });
  if (resultadoTempInt.length != 0) {
    for (var elementos in resultadoTempInt) {
      resultadoTempString.add(elementos.toString());
    }
    strTemp = resultadoTempString.join();
    resultadoFinal.add(strTemp);
  }
  for (var item in resultadoFinal) {
    if (verifFinal == null) {
      verifFinal = item;
    } else {
      if (verifFinal.length < item.length) {
        verifFinal = item;
      }
    }
  }
  return verifFinal;
}
