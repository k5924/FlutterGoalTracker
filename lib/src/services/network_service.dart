import "dart:convert";

import "package:http/http.dart";

class NetworkService {
  final String url;

  final String endpoint;

  final Map<String, String>? headers;

  final Map<String, String>? parameters;

  NetworkService({
      required this.url,
      required this.endpoint,
      required this.parameters,
      required this.headers,
    });

  Future getData() async {
      final http.Response response = await http.get(Uri.https(url, endpoint, parameters), headers: headers);
      if (response.statusCode == 200){
          final String data = response.body;
          final decodedData = jsonDecode(data);
          return decodedData;
        } else {
            return response.statusCode;
          }
    }
}
