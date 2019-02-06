import 'dart:async';
import 'package:flutter/material.dart';

import '../spotify/spotify_wrapper.dart' as Spotify;

class HomePage extends StatelessWidget {

  Future<void> getSongs() async {
    var songs = await Spotify.client.get('https://api.spotify.com/v1/me/tracks');
    print("GETTING SONGS!!!");
    print(songs.body);
  }

  @override
  Widget build(BuildContext context) {    
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Text("LOGGED IN!"),
            RaisedButton(              
              onPressed: getSongs,
              child: Text("Get Songs"),
            )
          ],
        )
      ),
    );
  }
}


