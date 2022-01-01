import 'package:consumeapi/getmahasiswa.dart';
import 'package:consumeapi/register.dart';
import 'package:flutter/material.dart';

class DataMahasiswa extends StatefulWidget {
  const DataMahasiswa({Key? key}) : super(key: key);

  @override
  _DataMahasiswaState createState() => _DataMahasiswaState();
}

class _DataMahasiswaState extends State<DataMahasiswa> {
  final minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Data Mahasiswa'),
      ),
      body: Center(child: Text('Halaman Pertama')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Data Mahasiswa'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Register Mahasiswa'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            ),
            ListTile(
              title: Text('Get Mahasiswa'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getmahasiswa()));
              },
            )
          ],
        ),
      ),
    );
  }
}
