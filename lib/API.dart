import 'package:http/http.dart' as http;
import 'model/Video.dart';
import 'secrets.dart';
import 'dart:convert';

class API {
  pesquisar(String pesquisa) async {
    var url = Uri.parse(URL_BASE +
        "/search?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=${CHAVE_API_YOUTUBE}"
            "&channelId=${ID_CANAL}"
            "&q=${pesquisa}");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      for (var video in videos) {
        print("resultado: " + video.titulo!);
      }
    } else {
      print("resultado: ");
    }
  }
}
