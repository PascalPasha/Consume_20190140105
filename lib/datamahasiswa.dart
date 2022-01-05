import 'dart:convert';

import 'package:consumeapi/model/mahasiswamodel.dart';
import 'package:consumeapi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataMahasiswa extends StatefulWidget {
  const DataMahasiswa({Key? key}) : super(key: key);

  @override
  _DataMahasiswaState createState() => _DataMahasiswaState();
}

Future<List<Mahasiswa>> getPosts() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8085/datamhs/getallmhs'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Mahasiswa>((json) => Mahasiswa.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class _DataMahasiswaState extends State<DataMahasiswa> {
  ApiService apiService = ApiService();
  late Future<List<Mahasiswa>> futurePost;

  get id => null;

  Map<String, dynamic>? get data => data;

  // String? get id => null;

  @override
  void initState() {
    futurePost = getPosts();
    super.initState();
  }

  final minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Data Mahasiswa'),
        // actions: [
        //   RefreshIndicator(
        //     onRefresh: refreshUsers,
        //     child: ListView.builder(
        //         itemCount: items.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(title: Text('${items[index]}'));
        //         }),
        //   )
        //   // IconButton(
        //   //   icon: Icon(Icons.refresh),
        //   //   onPressed: () {},
        //   // ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String? id;
          String? nama;
          String? nim;
          String? programstudi;
          String? universitas;
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              content: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "id",
                      ),
                      onChanged: (_val) {
                        id = _val;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "nama",
                      ),
                      onChanged: (_val) {
                        nama = _val;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "nim",
                      ),
                      onChanged: (_val) {
                        nim = _val;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "programstudi",
                      ),
                      onChanged: (_val) {
                        programstudi = _val;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "universitas",
                      ),
                      onChanged: (_val) {
                        universitas = _val;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> data = {
                          "id": id,
                          "nama": nama,
                          "nim": nim,
                          "programstudi": programstudi,
                          "universitas": universitas,
                        };
                        String res = await ApiService.createPost(data);
                        // res == "success" ? Fluttertoast
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: Text(
                        "Add",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> data = {
                          "id": id,
                          "nama": nama,
                          "nim": nim,
                          "programstudi": programstudi,
                          "universitas": universitas,
                        };
                        String res = await ApiService.updatePost(data);
                        // res == "success" ? Fluttertoast
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: Text(
                        "Update",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFCFD8DC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () async {
                            bool response =
                                await ApiService.deletePost(data!) as bool;
                            if (response) {
                              print("Delete succes");
                            } else {
                              print("Delete failed");
                            }
                            setState(() {});
                          },
                          icon: Icon(Icons.delete)),
                      Text(
                        "${snapshot.data![index].id}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("${snapshot.data![index].nama}"),
                      Text("${snapshot.data![index].nim}"),
                      Text("${snapshot.data![index].programstudi}"),
                      Text("${snapshot.data![index].universitas}"),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // extendBody: Action[
      //   IconButton(
      //     icon : Icon(Icons.delete))],
    );
  }
}
