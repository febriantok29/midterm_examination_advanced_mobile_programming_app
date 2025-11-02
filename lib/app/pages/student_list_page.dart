import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/models/student.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final _random = Random();

  List<Student> _students = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadStudentsFromJson();
  }

  Future<void> _loadStudentsFromJson() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      await Future.delayed(const Duration(milliseconds: 500));

      final String jsonString = await rootBundle.loadString(
        'assets/students.json',
      );

      final List<dynamic> jsonData = json.decode(jsonString);

      final List<Student> students = jsonData
          .map((json) => Student.fromJson(json))
          .toList();

      setState(() {
        _students = students;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat data: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _loadStudentsFromJson,
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showInfoDialog(context),
            tooltip: 'Info',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryContainer, AppColors.background],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.school_rounded,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Data Mahasiswa',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _isLoading
                                  ? 'Memuat data...'
                                  : '${_students.length} mahasiswa terdaftar',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.infoContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.info,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Data diambil dari JSON parsing (assets/students.json)',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.info,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return _buildLoadingState();
    }

    if (_errorMessage != null) {
      return _buildErrorState();
    }

    if (_students.isEmpty) {
      return _buildEmptyState();
    }

    return _buildStudentList();
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Memuat data mahasiswa...',
            style: TextStyle(fontSize: 16, color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.errorContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _errorMessage ?? 'Terjadi kesalahan',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppColors.error),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _loadStudentsFromJson,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inbox_outlined,
                size: 64,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tidak ada data mahasiswa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Daftar mahasiswa masih kosong',
              style: TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _students.length,
      itemBuilder: (_, index) {
        final student = _students[index];
        return _buildStudentItem(student, index);
      },
    );
  }

  Widget _buildStudentItem(Student student, int index) {
    final majorIcon = _buildMajorIcon(student.major, iconSize: 16.0);
    final majorColor = majorIcon.color ?? AppColors.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showStudentDetail(student),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Hero(
                  tag: 'student_${index}_avatar',
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [majorColor, majorColor.withValues(alpha: 0.7)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: majorColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: [
                          majorIcon,
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              student.major,
                              style: TextStyle(
                                fontSize: 14,
                                color: majorColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider _getRandomAvatarImage() {
    final isMale = _random.nextBool();

    final assetPath = isMale ? 'assets/male.png' : 'assets/female.png';

    return AssetImage(assetPath);
  }

  void _showStudentDetail(Student student) {
    final avatarImage = _getRandomAvatarImage();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final majorIcon = _buildMajorIcon(student.major, iconSize: 18.0);
        final majorColor = majorIcon.color ?? AppColors.primary;

        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(color: majorColor, width: 4),
                ),
                child: Image(
                  image: avatarImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                student.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: majorColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    majorIcon,
                    const SizedBox(width: 8),
                    Text(
                      student.major,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: majorColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: majorColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.info_rounded, color: AppColors.primary),
              SizedBox(width: 12),
              Expanded(child: Text('Soal 5 - JSON & RecyclerView')),
            ],
          ),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Implementasi JSON Parsing & ListView:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                _InfoItem(
                  icon: Icons.code,
                  title: 'JSON Parsing',
                  description: 'Menggunakan dart:convert untuk parse JSON',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.view_list,
                  title: 'RecyclerView → ListView.builder',
                  description: 'Efficient list rendering dengan builder',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.folder,
                  title: 'Assets Loading',
                  description: 'Membaca file JSON dari assets',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.architecture,
                  title: 'Model Class',
                  description: 'Student model dengan fromJson factory',
                ),
                Divider(height: 24),
                Text(
                  'Android Equivalent:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('• RecyclerView → ListView.builder'),
                Text('• Adapter → itemBuilder function'),
                Text('• ViewHolder → Implicit'),
                Text('• JSONArray → List<dynamic>'),
                Text('• Model → Student class'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  Icon _buildMajorIcon(String major, {double? iconSize}) {
    switch (major.toLowerCase()) {
      case 'informatika':
        return Icon(
          Icons.computer_rounded,
          color: AppColors.info,
          size: iconSize,
        );
      case 'sistem informasi':
        return Icon(
          Icons.storage_rounded,
          color: AppColors.success,
          size: iconSize,
        );
      case 'teknik komputer':
        return Icon(
          Icons.memory_rounded,
          color: AppColors.warning,
          size: iconSize,
        );
      default:
        return Icon(
          Icons.school_rounded,
          color: AppColors.primary,
          size: iconSize,
        );
    }
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
