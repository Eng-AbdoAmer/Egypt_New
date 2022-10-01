import 'package:flutter/material.dart';

import '../model/Science_model.dart';
import '../model/web_view/web_view.dart';
import '../network/science_network_request.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  List<ScienceModel> sciencelist = [];
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
            itemCount: sciencelist.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                  url: '${sciencelist[index].url}',
                                )));
                  },
                  child: Column(
                    children: [
                      sciencelist[index].urlToImage == null
                          ? Image.asset(
                              "assets/images/loading-animation-blue.gif")
                          : Image.network(
                              sciencelist[index].urlToImage ?? "fake uri",
                            ),
                      Text(sciencelist[index].title),
                    ],
                  ),
                ),
              );
            }),
          );
  }

  void x() async {
    String? r = await ScienceRequest.getRequest();
    if (r != null) {
      sciencelist = scienceModelFromJson(r);
      setState(() {
        isLoading = false;
      });
    }
  }
}
