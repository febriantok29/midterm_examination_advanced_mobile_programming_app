import 'package:flutter/material.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';



class NavigationComponentPage extends StatefulWidget {
  const NavigationComponentPage({super.key});

  @override
  State<NavigationComponentPage> createState() =>
      _NavigationComponentPageState();
}

class _NavigationComponentPageState extends State<NavigationComponentPage> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    const HomeFragment(),
    const DetailFragment(),
  ];

  void _navigateToFragment(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fragment Navigation'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _navigateToFragment,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Detail'),
        ],
      ),
    );
  }
}


class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primaryContainer, AppColors.background],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.home_rounded,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Selamat Datang di Aplikasi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Ini adalah HomeFragment',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 48,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Gunakan tombol navigasi di bawah untuk berpindah ke DetailFragment',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              ElevatedButton.icon(
                onPressed: () {
                  
                  final parentState = context
                      .findAncestorStateOfType<_NavigationComponentPageState>();
                  parentState?._navigateToFragment(1);
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'Ke Halaman Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warning,
                  foregroundColor: AppColors.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DetailFragment extends StatelessWidget {
  const DetailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.warningContainer, AppColors.background],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.warningContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.article_rounded,
                  size: 80,
                  color: AppColors.warning,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Halaman Detail',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.warning,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Ini adalah DetailFragment',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.success,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Navigasi Berhasil!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Anda telah berhasil berpindah dari HomeFragment ke DetailFragment menggunakan navigation component.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.warningContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.warning, width: 2),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: AppColors.warning),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Gunakan bottom navigation bar untuk kembali ke Home',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.warning,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
