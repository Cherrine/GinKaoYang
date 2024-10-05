import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL Proxy Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter MySQL Proxy Demo'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView(
                  children: (snapshot.data as List).map((item) {
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('Value: ${item['value']}'),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/mysql-data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
