// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



//ProductoModel productoFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    String key;
    String idProducto;
    String nombre;
    bool   oferta = false;
    double precio;
    double stock;

    ProductoModel(
        this.idProducto,
        this.nombre,
        this.oferta,
        this.precio,
        this.stock,
    );

    // factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
    //     idProducto: json["id_producto"],
    //     nombre    : json["nombre"],
    //     oferta    : json["oferta"],
    //     precio    : json["precio"].toDouble(),
    //     stock     : json["stock"].toDouble(),
    // );

    Map<String, dynamic> toJson() => {
        "id_producto": idProducto,
        "nombre"     : nombre,
        "oferta"     : oferta,
        "precio"     : precio,
        "stock"      : stock,
    };

    ProductoModel.fromSnapshot(DataSnapshot snapshot):key = snapshot.key,
        idProducto = snapshot.value["id_producto"],
        nombre     = snapshot.value["nombre"],
        oferta     = snapshot.value["oferta"],
        precio     = snapshot.value["precio"].toDouble(),
        stock      = snapshot.value["stock"].toDouble();    
}

// class ProductosList{
//   List<ProductoModel> productoslist;

//   ProductosList({this.productoslist});

//   factory ProductosList.fromJson(Map<dynamic, dynamic>json){
//     return ProductosList(
//       productoslist: parseproductos(json) 
//     );
//   }

  // static List<ProductoModel> parseproductos(productoJSON){
  //     var pList = productoJSON['productos'] as List;

  //     List<ProductoModel> productolist = pList.map((data) => 
  //     ProductoModel.fromJson(data)).toList();

  //     return productolist;
  // }
//}

