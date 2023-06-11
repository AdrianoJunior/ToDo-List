import 'package:flutter/material.dart';

alert(BuildContext context, String msg, {Function? callback}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Carros"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                if(callback != null) {
                  callback();
                }
              },
            )
          ],
        ),
      );
    },
  );
}

alertConfirm(BuildContext context, String msg, {Function? confirmCallback}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Carros"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.pop(context);
                if(confirmCallback != null) {
                  confirmCallback();
                }
              },
            )
          ],
        ),
      );
    },
  );
}