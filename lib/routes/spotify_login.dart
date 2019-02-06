import 'dart:async';

import 'package:flutter/material.dart';

import '../spotify/spotify_wrapper.dart' as Spotify;
import '../network/oauth_handler.dart' as OAuthHandler;
import '../network/webview.dart';

class SpotifyLogin extends StatefulWidget {
  @override
  SpotifyLoginState createState() => SpotifyLoginState();
}

class SpotifyLoginState extends State<SpotifyLogin> {
    BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Center(
        child: RaisedButton(
          onPressed: signIn,
          child: Text("Log in to Spotify"),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    Spotify.client = await OAuthHandler.getClient(_launchUrl);      
    Navigator.pushReplacementNamed(_context, "/home");
  }
  
  _launchUrl(Uri url) async {
    Navigator.push(_context, 
      MaterialPageRoute(
        builder: (context) => WebView(url.toString()),
      )
    );
  }
}

