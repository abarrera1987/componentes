import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.eldiario.es/fotos/Stan-Lee-lanzando-presentacion-Spiderman_EDIIMA20181112_0851_19.jpg'),
              radius: 23.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: FadeInImage(
            image: NetworkImage("https://www.infobae.com/new-resizer/T4gHub2jEqfFKWCWbYp784k8F8w=/1200x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2018/01/09205640/stan-lee-2.png"),
            placeholder: AssetImage("assets/image/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 250),
          ),
        ),
      ),
    );
  }
}