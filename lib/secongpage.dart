import 'package:flutter/material.dart';
import 'package:inshorts/codes/codes.dart';
import 'package:inshorts/service/api.dart';

class Secondpage extends StatefulWidget {
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  Future<NewsModel> _newsmodel;
  @override
  void initState() {
    // TODO: implement initState
    _newsmodel = Api_widget().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<NewsModel>(
        future: _newsmodel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(article.urlToImage),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(article.title,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(article.description,
                              overflow: TextOverflow.visible,
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0)),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
