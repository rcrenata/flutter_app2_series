import 'dart:convert';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:http/http.dart' as http;

class TvShowService { //me comunicar com a api
  Future<List<TvShow>> fetchTvShow(String query) async {
    final response = await http.get(
      Uri.parse('https://www.tvmaze.com/search/shows?q=$query'),
    );

    if (response.statusCode == 200) {
      final List<TvShow> tvShows = [];
      json.decode(response.body).forEach((item) {
        tvShows.add(TvShow.fromJson(item['show']));
      });
      return tvShows;
    } else {
      throw Exception('Falha ao carregar séries!');
    }
  }
}
