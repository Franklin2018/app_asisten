import 'package:firebase_core/firebase_core.dart';
import 'package:app_asistent/src/models/productos_models.dart';

class ProductoProvider{
  
  final FirebaseOptions firebase = const FirebaseOptions(
      googleAppID :'1:762915908917:android:20ed419d54c3f9ef61f07c',
      apiKey      :'AIzaSyBMV4iE4oHRIfJymx03AFkbutnbBH1Ey5E',
      databaseURL :'https://myproyecto1-50d78.firebaseio.com'
  );
  
  List<ProductoModel> listItems= [];

  int cont = 0;
  // Future<List<ProductoModel>> firebaseCalls (DatabaseReference databaseReference) async{
  //   ProductosList productosList;
  //       DataSnapshot dataSnapshot = await databaseReference.once();
  //       cont++;
  //       Map<dynamic,dynamic> jsonResponse=dataSnapshot.value["productos"];
  //       print(cont.toString());
  //       print(jsonResponse);
        
  //       productosList = new ProductosList.fromJson(jsonResponse);
  //       print('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
  //       print(productosList);
  //       listItems.addAll(productosList.productoslist);
       
  //   return listItems;
  //   }
  }