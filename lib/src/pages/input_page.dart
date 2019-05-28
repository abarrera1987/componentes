import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  List<String> _poderes = ['Volar', 'Rayos x', 'Super Aliento', 'Super Fuerza'];
  //Controlador para psar la fecha del datepicker al textfiel
  TextEditingController _inputFielController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras: ${_nombre.length}"),
          hintText: "Nombre de la persona",
          labelText: 'Nombre',
          helperText: 'Solo el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {},
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      //pasamos el controlador al controller del textfield
      controller: _inputFielController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    // fecha actual del celutar
    final date = DateTime.now();
    //fecha que usaremos para saber cual fue la ultima fecha seleccionada
    DateTime initialDate = DateTime.now();
    //validamos que la fecha no este vacia
    if (_fecha != "") {
      //le hacemos un substring a la fehca
      String year = _fecha.substring(0, 4);
      String month = _fecha.substring(5, 7);
      String day = _fecha.substring(8, 10);
      // creamos la nueva fecha inicial parseando los strings a ints
      initialDate = DateTime(int.parse(year), int.parse(month), int.parse(day));
    }
    //Mostramos el date picker
    DateTime picker = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: new DateTime(date.year, date.month, date.day),
      lastDate: new DateTime(2025),
      //idioma del datepicker
      locale: Locale('es', 'CO'),
    );
    //Validamos que seleccionara una fecha
    if (picker != null) {
      setState(() {
        // actualizamos la fecha y lo pasamos a string el substring es opcional
        _fecha = picker.toString().substring(0, 11);
        //al controlasor le pasamos la fecha
        _inputFielController.text = _fecha;
      });
    }
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            items: getOpcionesDropdown(),
            value: _opcionSeleccionada,
            iconDisabledColor: Colors.green,
            iconEnabledColor: Colors.green,
            isExpanded: true,
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
    );
  }
}
