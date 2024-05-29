

import 'package:flutter/material.dart';

class MenuItems {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon});
  
}

const appMenuItems = <MenuItems> [


  MenuItems(
    title: 'Riverpod Counter',
    subTitle:'Introducción a riverpod',
    link: '/counter-river',
    icon: Icons.add_reaction_outlined
  ),

  MenuItems(
    title: 'Botones',
    subTitle:'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),

  MenuItems(
    title: 'Tarjetas',
    subTitle:'Contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),

  MenuItems(
    title: 'Progress Indicators',
    subTitle:'Generales y Controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),

  MenuItems(
    title: 'SnackBar y Diálogos',
    subTitle:'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline
  ),

  MenuItems(
    title: 'Animated Container',
    subTitle:'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItems(
    title: 'UI Controls + Tiles',
    subTitle:'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),

  MenuItems(
    title: 'Introducción a la aplicación',
    subTitle:'Pequeño tutorial de la app',
    link: '/tutorial',
    icon: Icons.accessible_rounded
  ),

  MenuItems(
    title: 'InfiniteScroll y Pull',
    subTitle:'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded
  ),

  MenuItems(
    title: 'Cambiar tema',
    subTitle:'Cambiar tema de la aplicación',
    link: '/themechanger',
    icon: Icons.color_lens_outlined
  ),


];