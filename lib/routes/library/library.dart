import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tagify/ui/components/_ui_components.dart' as UIComponents;
import 'package:tagify/ui/theme.dart';
import 'package:tagify/app.dart';
import 'dart:ui' as DartUI;

class LibraryView extends StatelessWidget {
  final UIComponents.AlbumArt _albumArt = UIComponents.AlbumArt();

  getListItems() {
    List<Widget> items = List<Widget>();
    for (int i = 0; i < 100; i++) {
      items.add(UIComponents.ListItem());
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: _albumArt,
        ),
        new Column(children: [
          Expanded(
            child: ClipRect(
              child: BackdropFilter(
                filter: DartUI.ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: TagifyThemeDescendant(
                  builder: (context, child, model) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 60.0, height: 60.0,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.menu),
                                  iconSize: 30.0,
                                  onPressed: (){},
                                )
                              ),
                              Container(
                                height: 60.0,
                                child: Center(
                                  child: Text(
                                    "SONGS",
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: getListItems(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: DartUI.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: TagifyThemeDescendant(
              builder: (context, child, model) => Container(
                color: TagifyTheme.average(Theme.of(context).accentColor, Color(0xFFEAEAEA), 0.1).withOpacity(0.75),
                child: Row(
                  children: [
                    TagifyThemeDescendant(
                      builder: (context, child, model) => Container(
                        width: 60.0,
                        height: 60.0,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ScopedModelDescendant<TagifyTheme>(
                            builder: (context, child, model) =>
                                IconButton(
                                  icon: Icon(Icons.music_note),
                                  color: Theme.of(context).accentColor,
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                          ),
                          TagifyThemeDescendant(
                            builder: (context, child, model) => IconButton(
                                  icon: Icon(Icons.person),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                          ),
                          TagifyThemeDescendant(
                            builder: (context, child, model) => IconButton(
                                  icon: Icon(Icons.album),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                          ),
                          TagifyThemeDescendant(
                            builder: (context, child, model) => IconButton(
                                  icon: Icon(Icons.playlist_play),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
