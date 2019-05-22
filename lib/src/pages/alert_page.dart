import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {

    showDialog(

      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          // title: Text("Titulo"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.5)),
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlutterLogo(size: 100.0,),
              SizedBox(height: 15.0,),
              Text('Gracias por su visita, vuelva pronto', style: TextStyle(color: Colors.white),),
              
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Aceptar"),
              onPressed: (){

                Navigator.of(context).pop();
                _otherAlert(context);
              },
            )
          ],
        );
      }

    );
  }

  void _otherAlert(BuildContext context){

    showDialog(
      
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.5)),
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlutterLogo(size: 100.0),
              SizedBox(height: 15.5),
              Text("Gracias", style: TextStyle(color: Colors.white),),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cerrar"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );

  }
}
