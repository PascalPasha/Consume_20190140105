import 'package:consumeapi/getmahasiswa.dart';
import 'package:flutter/material.dart';

class deletemahasiswa extends StatefulWidget {
  const deletemahasiswa({Key? key}) : super(key: key);

  @override
  _deletemahasiswaState createState() => _deletemahasiswaState();
}

class _deletemahasiswaState extends State<deletemahasiswa> {
  @override
  Widget build(BuildContext context) {
    return getmahasiswa();
  }
}
