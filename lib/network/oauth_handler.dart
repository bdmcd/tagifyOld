import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

final port = 8163;
final scopes = ["user-library-read"];
final redirectUri = Uri.parse("http://localhost:8163/");
final authorizationEndpoint = Uri.parse("https://accounts.spotify.com/authorize");
final tokenEndpoint = Uri.parse("https://accounts.spotify.com/api/token");
final clientId = "21f03237654e4d71b7da15958af648e8";
final clientSecret = "a2a78d1c68494f16b79240ffe2423eb1";

Future<String> documentsPath() async {
  Directory dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

Future<File> credentialsFile() async {
  Directory dir = await getApplicationDocumentsDirectory();
  return File("${dir.path}/credentials.json");
}

Future<bool> hasCredentials() async => (await credentialsFile()).exists();

Future<oauth2.Client> getClient(Function openBrowser) async {
  File credFile = await credentialsFile();

  if (await credFile.exists()) {
    var fromFile = await credFile.readAsString();
    var credentials = oauth2.Credentials.fromJson(fromFile);
    return new oauth2.Client(credentials, identifier: clientId, secret: clientSecret);
  }

  await credFile.create();
  bool nowExists = await credFile.exists();
  print("FILE NOW EXISTS! $nowExists");
  var grant = new oauth2.AuthorizationCodeGrant(
      clientId, authorizationEndpoint, tokenEndpoint,
      secret: clientSecret);
  await openBrowser(grant.getAuthorizationUrl(redirectUri, scopes: scopes));

  var request = await (listen(redirectUri));
  var client = await grant.handleAuthorizationResponse(request.uri.queryParameters);

  await saveCredentials(credFile, client.credentials);
  return client;
}

Future<void> saveCredentials(File credFile, oauth2.Credentials credentials) async {
  print("SAVING!!!");
  print(credentials.toJson());
  var ioLink = credFile.openWrite();
  await credFile.writeAsString(credentials.toJson());
  ioLink.close();
  print("FINISHED SAVING!!!");
}

Future<HttpRequest> listen(Uri redirectUri) async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

  HttpRequest request;
  await for (HttpRequest req in server) {
    request = req;
    break;
  }

  server.close();
  return request;
}
