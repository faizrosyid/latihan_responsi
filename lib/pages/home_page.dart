import 'package:flutter/material.dart';
import 'package:latihan_responsi/pages/blog_page.dart';
import 'package:latihan_responsi/pages/news_page.dart';
import 'package:latihan_responsi/pages/report_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPACE FLIGHT NEWS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset("gambar/news.png", height: 200,),
                      Text("News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BlogPage()));
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset("gambar/blog.png", height: 200,),
                      Text("Blog", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage()));
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset("gambar/report.png", height: 200,),
                      Text("Report", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
