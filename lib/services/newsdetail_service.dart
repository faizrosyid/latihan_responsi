import 'dart:convert';
import 'package:latihan_responsi/models/news_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<NewsModel> news=[];


  Future<void> getNews()async{
    String url="https://api.spaceflightnewsapi.net/v4/articles/?format=json";
    var response= await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);

      jsonData["results"].forEach((element){
        if(element["title"]!=null && element['summary']!=null){
          NewsModel newsModel = NewsModel(
            title: element["title"],
            url: element["url"],
            image_url: element["image_url"],
            summary: element["summary"],
            id: element["id"]
          );
          news.add(newsModel);
        }
      });

  }
}