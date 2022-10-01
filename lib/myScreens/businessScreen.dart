import 'package:egyptnews/network/network_request.dart';
import 'package:flutter/material.dart';
import '../model/articles.dart';
import '../model/web_view/web_view.dart';
import '../string/string.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  bool isLoading = true;

  List<Articles> articles = [];

  @override
  void initState() {
    x();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: articles.length,
            // itemCount: articles.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                  url: '${articles[index].url}',
                                )));
                  },
                  child: Column(
                    children: [
                      articles[index].urlToImage == null
                          ? Image.asset(
                              "assets/images/loading-animation-blue.gif")
                          : Image.network(
                              articles[index].urlToImage!,
                            ),
                      Text(articles[index].title),
                    ],
                  ),
                ),
              );
            }),
          );
  }

  void x() async {
    String? r = await InternetsRequest.getRequest();
    if (r != null) {
      articles = articlesFromJson(r);
      setState(() {
        isLoading = false;
      });
    }
  }
}
