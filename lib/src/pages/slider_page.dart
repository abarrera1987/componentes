import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _valueCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Slider Page"),
              SizedBox(
                height: 30.0,
              ),
              _crearSlider(),
              _crearCheckbox(),
              Expanded(
                child: _crearImagen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      // divisions: 400,
      value: _valorSlider,
      min: 100.0,
      max: 400.0,
      onChanged: (value) {
        print(value);
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }

  Widget _crearCheckbox() {

    return Checkbox(
      value: _valueCheck,
      onChanged: (bool value){
        setState(() {
         _valueCheck = value; 
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://cdn.wallpapersafari.com/22/53/FtYELv.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  
}
