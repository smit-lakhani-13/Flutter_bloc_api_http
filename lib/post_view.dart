import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_api/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  List<dynamic> samples = [];
  bool isLoading = true;

  Future<void> fetchSamples() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        samples = jsonData;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load samples');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSamples();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api http fetch data'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: samples.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 190,
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        title: Text(samples[index]['title']),
                        leading: Text(samples[index]['albumId'].toString()),
                        subtitle: Image.network(
                          samples[index]['url'],
                          width: 80,
                          height: 80,
                        ),
                        trailing: Image.network(
                          samples[index]['thumbnailUrl'],
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
