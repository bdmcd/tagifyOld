import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tagify/ui/theme.dart';
import 'package:tagify/app.dart';

class AlbumArt extends StatefulWidget {
  @override
  AlbumArtState createState() => AlbumArtState();
}

class AlbumArtState extends State<AlbumArt> { 

  static int _currentIndex = 0;
  static var _albumArtList = [
    "img/jon-bellion.jpg",
    "img/implala.jpg",
    "img/naked.jpg",
    "img/coldplay.jpg",
    "img/ajr.jpg",
    "img/angela.jpg",
    "img/soitgoes.jpg",
  ];
  
  ImageProvider _currentImage = Image.asset(_albumArtList[_currentIndex]).image;
  ImageProvider _previousImage = Image.asset("img/white.jpg").image;

  Image createImage(String asset) => Image.asset(asset, fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: _currentImage ?? Image.asset("img/white.jpg").image,
      placeholder: _previousImage,
      fit: BoxFit.cover,
    );
  }
}