import 'package:app_asistent/src/models/productos_models.dart';
import 'package:app_asistent/src/providers/productos_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';



class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  List<ProductoModel> itemsProductos = List();
  //ProductoModel item_producto;
  DatabaseReference itemRef;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ProductoProvider productoProvider = new ProductoProvider();
  @override
  void initState() {
    
    super.initState();
    final databaseReference = FirebaseDatabase.instance.reference();
    itemRef = databaseReference.reference().child('productos');

    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onentryChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Productos')
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (context, snapshot,
              Animation<double> animation, index){
                return _crearItem(itemsProductos[index]);
              },
            ),
          )
        ],
      )
      );
  }

  
  Widget _crearItem(ProductoModel producto){
    
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        leading: FlutterLogo(size: 56.0,),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('${producto.nombre}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Precio: Bs. ${producto.precio}', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Oferta: ${producto.oferta}', style: TextStyle(fontWeight: FontWeight.bold),)
          ],
          ),
          subtitle: Text('Stock: ${producto.stock}'),
          onTap: (){},
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
      ),
    );
  }

  void _onEntryAdded(Event event) {

      setState(() {
        itemsProductos.add(ProductoModel.fromSnapshot(event.snapshot));
      });
  }

  void _onentryChanged(Event event) {
    var old = itemsProductos.singleWhere((entry){
      return entry.key == event.snapshot.key;
    });

    setState(() {
      itemsProductos[itemsProductos.indexOf(old)] = ProductoModel.fromSnapshot(event.snapshot);
    });
  }
}