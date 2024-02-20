
import 'package:flutter/material.dart';

// Creamos una lista de colores 

const List<Color> colorList = [

  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,

];

/*  
  * Esta clase mantiene el tema principal de la app  
 */

class AppTheme {

  final int selectedColor;

  AppTheme({
    required this.selectedColor
    
  }): assert( selectedColor >= 0, 'Debe ser mayor que 0'  ),
      assert( selectedColor < colorList.length ,
       'Debe ser menor que ${ colorList.length -1 }' );


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList [ selectedColor ],
    appBarTheme:const AppBarTheme(
      centerTitle: false
    )
  );

}