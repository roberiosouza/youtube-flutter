import 'package:http/http.dart' as http;
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
      print("resultado: " + dadosJson["items"][0].toString());
    } else {
      print("resultado: ");
    }
  }
}
