import 'dart:convert';

List<Mahasiswa> mahasiswaFromJson(String str) =>
    List<Mahasiswa>.from(json.decode(str).map((x) => Mahasiswa.fromJson(x)));

String mahasiswaToJson(List<Mahasiswa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mahasiswa {
  Mahasiswa({
    this.id,
    this.nama,
    this.nim,
    this.programstudi,
    this.universitas,
  });

  int? id;
  String? nama;
  String? nim;
  String? programstudi;
  String? universitas;

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        nama: json["nama"],
        nim: json["nim"],
        programstudi: json["programstudi"],
        universitas: json["universitas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nim": nim,
        "programstudi": programstudi,
        "universitas": universitas,
      };
}
