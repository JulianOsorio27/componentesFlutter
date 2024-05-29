
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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
    
  }): assert( selectedColor >= 0, 'Debe ser mayor que 0'  ),
      assert( selectedColor < colorList.length ,
       'Debe ser menor que ${ colorList.length -1 }' );


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList [ selectedColor ],
    appBarTheme:const AppBarTheme(
      centerTitle: false
    )
  );

}