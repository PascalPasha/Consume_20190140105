import 'package:flutter/material.dart';

class getmahasiswa extends StatefulWidget {
  const getmahasiswa({Key? key}) : super(key: key);

  @override
  _getmahasiswaState createState() => _getmahasiswaState();
}

class _getmahasiswaState extends State<getmahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Detail Data Mahasiswa"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
    );
  }
}
