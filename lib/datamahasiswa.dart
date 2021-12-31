import 'package:flutter/material.dart';

class HalamanPertama extends StatefulWidget {
  const HalamanPertama({Key? key}) : super(key: key);

  @override
  _HalamanPertamaState createState() => _HalamanPertamaState();
}

class _HalamanPertamaState extends State<HalamanPertama> {
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
              onTap: () {},
            ),
            ListTile(
              title: Text('Get Mahasiswa'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
