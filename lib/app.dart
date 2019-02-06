import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ui/theme.dart';

import 'package:tagify/routes/library/_library_route.dart' as LibraryRoute;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TagifyTheme>(
      model: TagifyTheme(),
      child: ScopedModelDescendant<TagifyTheme>(
        builder: (context, child, model) => MaterialApp(
          title: 'Tagify',
          theme: model.themeData,
          debugShowCheckedModeBanner: false,
          home: LibraryRoute.LibraryView(),
        ),
      )
    );
  }
}
