import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    print("url:$url response:$response");
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return jsonDecode(
          "{\n  \"coord\": {\n    \"lon\": 10.99,\n    \"lat\": 44.34\n  },\n  \"weather\": [\n    {\n      \"id\": 501,\n      \"main\": \"Rain\",\n      \"description\": \"moderate rain\",\n      \"icon\": \"10d\"\n    }\n  ],\n  \"base\": \"stations\",\n  \"main\": {\n    \"temp\": 298.48,\n    \"feels_like\": 298.74,\n    \"temp_min\": 297.56,\n    \"temp_max\": 300.05,\n    \"pressure\": 1015,\n    \"humidity\": 64,\n    \"sea_level\": 1015,\n    \"grnd_level\": 933\n  },\n  \"visibility\": 10000,\n  \"wind\": {\n    \"speed\": 0.62,\n    \"deg\": 349,\n    \"gust\": 1.18\n  },\n  \"rain\": {\n    \"1h\": 3.16\n  },\n  \"clouds\": {\n    \"all\": 100\n  },\n  \"dt\": 1661870592,\n  \"sys\": {\n    \"type\": 2,\n    \"id\": 2075663,\n    \"country\": \"IT\",\n    \"sunrise\": 1661834187,\n    \"sunset\": 1661882248\n  },\n  \"timezone\": 7200,\n  \"id\": 3163858,\n  \"name\": \"Zocca\",\n  \"cod\": 200\n}");
    }
  }
}
