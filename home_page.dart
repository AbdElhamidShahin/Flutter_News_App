import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  Homepage({
    super.key,
    required String username,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    print('init state code');
    getData();
    super.initState();
  }

  List News = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: News.isEmpty
            ? CircularProgressIndicator()
            : ListView.separated(
                itemCount: News.length,
                itemBuilder: (context, index) {
                  return Text(
                    News[index],
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    color: Color.fromARGB(255, 185, 185, 185),
                    height: 20,
                    width: double.infinity,
                  );
                }),
      ),
    );
  }

  getData() async {
    var response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=1b992c88283b4836884928b8818a706f',
      ),
    );
    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    var dataList = data["articles"];
    setState(() {
      for (var item in dataList) {
        String title = item['title'];

        News.add(title);
      }
    });
  }
}
