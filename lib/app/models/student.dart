class Student {
  final String nama;
  final String major;

  Student({required this.nama, required this.major});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      nama: json['nama'] as String,
      major: json['jurusan'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'nama': nama, 'jurusan': major};
  }
}
