import 'package:flutter/material.dart';

class updatemahasiswa extends StatefulWidget {
  const updatemahasiswa({Key? key}) : super(key: key);

  @override
  _updatemahasiswaState createState() => _updatemahasiswaState();
}

class _updatemahasiswaState extends State<updatemahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data Mahasiswa"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
    );
  }
}
