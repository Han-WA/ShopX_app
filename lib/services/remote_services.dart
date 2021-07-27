import 'package:http/http.dart' as http;
import 'package:shopx_api/models/product.dart';

String url =
    "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    } else {
      //show  error messages
      return null;
    }
  }
}
