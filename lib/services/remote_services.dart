import "package:http/http.dart" as http;
import 'package:shopx/models/products_model.dart';

class RemoteServices {
  // static since we dont want each execution leads to new connection to server
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=colourpop'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
