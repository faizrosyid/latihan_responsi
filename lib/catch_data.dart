import 'package:latihan_responsi/models/news_model.dart';
import 'package:latihan_responsi/models/blog_model.dart';
import 'package:latihan_responsi/models/report_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiSource {
  static const _News =
      'https://api.spaceflightnewsapi.net/v4/articles/?format=json';

  static const _Blogs =
      'https://api.spaceflightnewsapi.net/v4/blogs/?format=json';

  static const _Reports =
      'https://api.spaceflightnewsapi.net/v4/flightReports/?format=json';

  Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse(_News));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((newsdata) => NewsModel.fromJson(newsdata)).toList();
    } else {
      throw Exception('Failed to load news :(');
    }
  }

  Future<List<BlogModel>> getBlogs() async {
    final response = await http.get(Uri.parse(_Blogs));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((blogdata) => BlogModel.fromJson(blogdata)).toList();
    } else {
      throw Exception('Failed to load blog :(');
    }
  }

  Future<List<ReportModel>> getReports() async {
    final response = await http.get(Uri.parse(_Reports));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((reportdata) => ReportModel.fromJson(reportdata)).toList();
    } else {
      throw Exception('Failed to load report :(');
    }
  }
}