import 'package:flutter/material.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';

class ProfileLayoutPage extends StatelessWidget {
  const ProfileLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Layout'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.success,
                              AppColors.successContainer,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),

                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                backgroundImage: const AssetImage(
                                  'assets/male.png',
                                ),
                                onBackgroundImageError:
                                    (exception, stackTrace) {},
                                child: null,
                              ),
                            ),
                            const SizedBox(height: 20),

                            const Text(
                              'Febrianto Kabisatullah',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                '411221029 | Teknik Informatika - UNDIRA',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            _buildInfoCard(
                              icon: Icons.email,
                              title: 'Email',
                              value: '411221029@mahasiswa.undira.ac.id',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              icon: Icons.phone,
                              title: 'Telepon',
                              value: '+62 851 5929 0229',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              icon: Icons.location_on,
                              title: 'Lokasi',
                              value:
                                  'UNDIRA Kampus Tanjung Duren, Jakarta, Indonesia',
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Fitur Edit Profil'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text(
                                'Edit Profil',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.success,
                                foregroundColor: AppColors.onPrimary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                _showLogoutDialog(context);
                              },
                              icon: const Icon(Icons.logout),
                              label: const Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.error,
                                side: const BorderSide(
                                  color: AppColors.error,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
        },
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.successContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.success, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logout berhasil!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.onError,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
