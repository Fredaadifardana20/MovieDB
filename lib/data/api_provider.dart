import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_moviedb/model/popular_movie.dart';

class ApiProvider {
  String apiKey = 'b2c8fc324d4e7877a1d74a47576394d5';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    String url = '$baseUrl/movie/popular?api_key=$apiKey';
    // print(url);

    Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
