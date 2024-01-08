import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:indomart/screens/add_product.dart';
import 'package:indomart/screens/product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
 // final String url = 'http://10.0.2.2:8000/api/product';
  final String url = 'http://127.0.0.1:8000/api/product';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {  
        Navigator.push(context, MaterialPageRoute(builder:(context) =>AddProduct()));
      },
      child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text('Indomerce'),
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product:snapshot.data['data'][index],
                                )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                padding: EdgeInsets.all(5),
                                height: 120    ,
                                width: 120,
                                child: Image.network(
                                  snapshot.data['data'][index]['foto']
                                  //fit: BoxFit.cover,
                                   ), 
                              ),
                            ),
                           Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(snapshot.data["data"][index]['name'],
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  Text(snapshot.data["data"][index]
                                      ['deskripsi']),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.edit),
                                      Text(snapshot.data["data"][index]
                                          ['price']),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      ),
                    );
                  });
              } else {
                return Text('Mohon maaf mas error  ❤');  
              }
          }));
  }
}
