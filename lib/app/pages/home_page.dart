import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/counter_page.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/intent_passing_page.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/navigation_component_page.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/profile_layout_page.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/pages/student_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _lastPressedAt;

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        _lastPressedAt == null ||
        now.difference(_lastPressedAt!) > const Duration(seconds: 2);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      _lastPressedAt = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Tekan sekali lagi untuk keluar',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.onSurface,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(16),
        ),
      );
      return false;
    }

    return await _showExitConfirmationDialog() ?? false;
  }

  Future<bool?> _showExitConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.exit_to_app,
                  color: AppColors.error,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Keluar Aplikasi?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apakah Anda yakin ingin keluar dari aplikasi?',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 8),
              Text(
                'Semua progress yang tidak disimpan akan hilang.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Batal',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                SystemNavigator.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.onError,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                elevation: 0,
              ),
              child: const Text(
                'Keluar',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'UTS Pemrograman Mobile Lanjut',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                _showAboutDialog();
              },
              tooltip: 'Tentang Aplikasi',
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(24),
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'UTS Pemrograman Mobile Lanjut',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Febrianto Kabisatullah - 411221029',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              _buildMenuCard(
                context: context,
                title: 'Data Passing',
                subtitle: 'Mengirim dan menerima data antar halaman',
                icon: Icons.send_rounded,
                color: AppColors.info,
                points: '20 poin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntentPassingPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _buildMenuCard(
                context: context,
                title: 'Profil Layout',
                subtitle: 'Layout dengan constraint dan hierarki UI',
                icon: Icons.person_rounded,
                color: AppColors.success,
                points: '20 poin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileLayoutPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _buildMenuCard(
                context: context,
                title: 'Fragment Navigation',
                subtitle: 'Navigasi dan transisi antar fragment',
                icon: Icons.navigation_rounded,
                color: AppColors.warning,
                points: '20 poin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationComponentPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _buildMenuCard(
                context: context,
                title: 'Counter MVVM',
                subtitle: 'Data binding dengan ViewModel & LiveData',
                icon: Icons.timer_rounded,
                color: AppColors.tertiary,
                points: '20 poin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              _buildMenuCard(
                context: context,
                title: 'Daftar Mahasiswa',
                subtitle: 'JSON parsing dengan RecyclerView',
                icon: Icons.list_alt_rounded,
                color: AppColors.secondary,
                points: '20 poin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentListPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.info, color: AppColors.primary),
            SizedBox(width: 12),
            Text('Tentang Aplikasi'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UTS Pemrograman Mobile Lanjut',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Aplikasi ini dibuat untuk mengerjakan soal UTS yang mencakup:',
            ),
            SizedBox(height: 8),
            Text('• Intent & Data Passing (20%)'),
            Text('• Layout & Constraint (20%)'),
            Text('• Navigation Component (20%)'),
            Text('• Data Binding + LiveData (20%)'),
            Text('• JSON Parsing + RecyclerView (20%)'),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 8),
            Text(
              'Aspek Penilaian:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('• Fungsi Program (40%)'),
            Text('• Struktur Program (25%)'),
            Text('• Tampilan UI/UX (25%)'),
            Text('• Inovasi & Kreativitas (10%)'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String points,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shadowColor: color.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withValues(alpha: 0.1),
                color.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            points,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: color.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
