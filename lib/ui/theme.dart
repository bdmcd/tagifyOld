import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:async';

Color defaultAccent = Color(0xFFF76B00);
Color defaultPrimary = Color(0xFFEEEEEE);

class TagifyTheme extends Model {
  Brightness _brightness = Brightness.light;
  Color _accentColor = defaultAccent;
  Color _primaryColor = defaultPrimary;

  ThemeData _themeData;
  ThemeData get themeData => _themeData;

  String _albumArt;
  String get albumArt => _albumArt;

  Image _testImage;
  Image get testImage => _testImage;

  TagifyTheme() {
    setTheme();
  }

  Future<void> setImage(ImageProvider image) async {
    PaletteGenerator  generator = await PaletteGenerator.fromImageProvider(image);  
    PaletteColor accent = generator.vibrantColor ?? PaletteColor(defaultAccent, 1);
    PaletteColor primary = generator.mutedColor ?? PaletteColor(defaultPrimary, 1);
    setTheme(accentColor: accent.color, primaryColor: primary.color);
  }

  void setTheme({Color accentColor, Color primaryColor, Brightness brightness}) {
    print(primaryColor.toString() + ", " + accentColor.toString());
    _accentColor = accentColor ?? _accentColor;
    _primaryColor = primaryColor ?? _primaryColor;
    _brightness = brightness ?? _brightness;
    updateThemeData();
  }

  void updateThemeData() {
    ThemeData base = ThemeData(fontFamily: "Segoe UI", brightness: _brightness);
    _themeData = base.copyWith(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      backgroundColor: _brightness == Brightness.light ? Color(0xfffcfcfc) : Color(0xff333333),
      textTheme: base.textTheme.copyWith(
        caption: base.textTheme.caption.copyWith(fontWeight: FontWeight.w100),
        subhead: base.textTheme.subhead.copyWith(fontWeight: FontWeight.w300),
      ),
    );
    notifyListeners();
  }

  static Color darken(Color c) {
    int r = c.red - 10;
    int g = c.green - 10;
    int b = c.blue - 10;
    return Color.fromARGB(c.alpha, r, g, b);
  }

  static Color average(Color c1, Color c2, double weight) {
    double c2Weight = 1.0 - weight;
    int a = (c1.alpha.toDouble()*weight + c2.alpha*c2Weight).toInt();
    int r = (c1.red.toDouble()*weight + c2.red*c2Weight).toInt();
    int g = (c1.green.toDouble()*weight + c2.green*c2Weight).toInt();
    int b = (c1.blue.toDouble()*weight + c2.blue*c2Weight).toInt();
    return Color.fromARGB(a, r, g, b);
  }
}

class TagifyThemeDescendant extends ScopedModelDescendant<TagifyTheme> {
  TagifyThemeDescendant({ScopedModelDescendantBuilder<Model> builder, Widget child, bool rebuildOnChange = true}) : 
      super(builder: builder, child: child, rebuildOnChange: rebuildOnChange);
}