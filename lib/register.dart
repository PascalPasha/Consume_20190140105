import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle? textstyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Mahasiswa"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textstyle,
                  controller: firstController,
                  validator: (String? value) {
                    if (value != null) {
                      return 'masukkan id anda';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'ID',
                      hintText: 'Masukkan id anda',
                      labelStyle: textstyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textstyle,
                  controller: secondController,
                  validator: (String? value) {
                    if (value != null) {
                      return 'Masukkan nama anda';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan nama anda',
                      labelStyle: textstyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textstyle,
                  controller: thirdController,
                  validator: (String? value) {
                    if (value != null) {
                      return 'masukkan nim anda';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'NIM',
                      hintText: 'Masukkan nim anda',
                      labelStyle: textstyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textstyle,
                  controller: fourthController,
                  validator: (String? value) {
                    if (value != null) {
                      return 'masukkan programstudi anda';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Program Studi',
                      hintText: 'Masukkan program studi anda',
                      labelStyle: textstyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textstyle,
                  controller: fifthController,
                  validator: (String? value) {
                    if (value != null) {
                      return 'masukkan universitas anda';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Universitas',
                      hintText: 'Masukkan universitas anda',
                      labelStyle: textstyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              RaisedButton(child: Text('Submit'), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
