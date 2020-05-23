import 'package:app_asistent/src/pages/productos_page.dart';
import 'package:flutter/material.dart';

void main(){
   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData.light(),
    home: ProductoPage(),
   ));
}

class MyApp extends StatefulWidget {
   @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Aplicacion'),
      ),
      body: Center(
        child: Text('Hola Mundo!!!'),
      ),
    );
  }
}