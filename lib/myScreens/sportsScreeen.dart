import 'package:flutter/material.dart';

import '../model/model_Sport.dart';
import '../model/web_view/web_view.dart';
import '../network/network_request.dart';
import '../network/sport_network_request.dart';

class SpostsScreen extends StatefulWidget {
  const SpostsScreen({Key? key}) : super(key: key);

  @override
  State<SpostsScreen> createState() => _SpostsScreenState();
}

class _SpostsScreenState extends State<SpostsScreen> {
  List<ArticleSport> articlesport = [];

  bool isLoading = true;

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
            itemCount: articlesport.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                  url: '${articlesport[index].url}',
                                )));
                  },
                  child: Column(
                    children: [
                      articlesport[index].urlToImage == null
                          ? Image.asset(
                              "assets/images/loading-animation-blue.gif")
                          : Image.network(articlesport[index].urlToImage!),
                      Text(articlesport[index].title!),
                    ],
                  ),
                ),
              );
            }),
          );
  }

  void x() async {
    String? r = await SportRequest.getRequest();
    if (r != null) {
      articlesport = articlesFromJson(r);
      setState(() {
        isLoading = false;
      });
    }
  }
}
