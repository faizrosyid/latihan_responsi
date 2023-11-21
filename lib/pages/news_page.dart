import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latihan_responsi/catch_data.dart';
import 'package:latihan_responsi/models/news_model.dart';
import 'package:latihan_responsi/pages/news_detail.dart';
import '../services/news_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Results> newss = [];
  bool _loading = true;

  @override
  void initState() {
    getNewsData();
    super.initState();
  }

  getNewsData() async {
    ApiSource newsclass = ApiSource();
    await newsclass.getNews();
    newss = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS LIST"),
        centerTitle: true,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newss.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            url: newss[index].url!,
                            image_url: newss[index].image_url!,
                            title: newss[index].title!,
                            summary: newss[index].summary!,
                            id: newss[index].id!,
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String image_url, title, summary, url, id;

  BlogTile(
      {required this.summary,
      required this.title,
      required this.image_url,
      required this.url,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetail(idTangkap: id)));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: image_url,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Text(
                        summary,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
