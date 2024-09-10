import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';

class Message {
  void mensaje(color, icono, texto, BuildContext context) {
    return AchievementView(
      title: texto,
      icon: Icon(
        icono,
        color: Colors.white,
      ),
      color: color,
      textStyleTitle: const TextStyle(color: Colors.white),
      textStyleSubTitle: const TextStyle(color: Colors.white),
      alignment: Alignment.centerRight,
      duration: const Duration(seconds: 5),
      isCircle: true,
    ).show(context);
  }
}
