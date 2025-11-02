import 'package:flutter/material.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/viewmodels/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter App - MVVM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          actions: [
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                        const Icon(
                          Icons.timer_rounded,
                          size: 48,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Counter dengan MVVM',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'LiveData + ViewModel Pattern',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  Consumer<CounterViewModel>(
                    builder: (_, viewModel, child) {
                      return Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Nilai Counter',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurfaceVariant,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TweenAnimationBuilder<int>(
                              tween: IntTween(
                                begin: viewModel.counter - 1 < 0
                                    ? 0
                                    : viewModel.counter - 1,
                                end: viewModel.counter,
                              ),
                              duration: const Duration(milliseconds: 300),
                              builder: (_, value, child) {
                                return Text(
                                  '$value',
                                  style: TextStyle(
                                    fontSize: 96,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                    height: 1,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                viewModel.counter == 0
                                    ? 'Mulai hitung!'
                                    : viewModel.counter == 1
                                    ? '1 kali klik'
                                    : '${viewModel.counter} kali klik',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 48),

                  Consumer<CounterViewModel>(
                    builder: (_, viewModel, child) {
                      return Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: viewModel.counter > 0
                                        ? viewModel.decrement
                                        : null,
                                    icon: const Icon(
                                      Icons.remove_rounded,
                                      size: 24,
                                    ),
                                    label: const Text(
                                      'Kurang',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: AppColors.warning,
                                      disabledForegroundColor: AppColors
                                          .onSurfaceVariant
                                          .withValues(alpha: 0.3),
                                      side: BorderSide(
                                        color: viewModel.counter > 0
                                            ? AppColors.warning
                                            : AppColors.onSurfaceVariant
                                                  .withValues(alpha: 0.3),
                                        width: 2,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 24,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: viewModel.increment,
                                    icon: const Icon(
                                      Icons.add_rounded,
                                      size: 28,
                                    ),
                                    label: const Text(
                                      'Tambah',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.success,
                                      foregroundColor: AppColors.onPrimary,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 24,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      elevation: 4,
                                      shadowColor: AppColors.success.withValues(
                                        alpha: 0.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: viewModel.counter > 0
                                      ? () =>
                                            _showResetDialog(context, viewModel)
                                      : null,
                                  icon: const Icon(
                                    Icons.refresh_rounded,
                                    size: 24,
                                  ),
                                  label: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.error,
                                    disabledForegroundColor: AppColors
                                        .onSurfaceVariant
                                        .withValues(alpha: 0.3),
                                    side: BorderSide(
                                      color: viewModel.counter > 0
                                          ? AppColors.error
                                          : AppColors.onSurfaceVariant
                                                .withValues(alpha: 0.3),
                                      width: 2,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 24,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.infoContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.info.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppColors.info,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'UI otomatis update tanpa findViewById()\nMenggunakan MVVM pattern',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.info,
                              height: 1.5,
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
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context, CounterViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.refresh_rounded, color: AppColors.error),
              SizedBox(width: 12),
              Text('Reset Counter?'),
            ],
          ),
          content: const Text(
            'Apakah Anda yakin ingin mereset counter ke 0?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.reset();
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 12),
                        Text('Counter berhasil direset!'),
                      ],
                    ),
                    backgroundColor: AppColors.success,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.onError,
              ),
              child: const Text('Reset'),
            ),
          ],
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
              Expanded(child: Text('Soal 4 - MVVM Pattern')),
            ],
          ),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Implementasi Counter App dengan:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                _InfoItem(
                  icon: Icons.architecture,
                  title: 'MVVM Architecture',
                  description: 'Separation of concerns dengan ViewModel',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.cached,
                  title: 'Live Data (ChangeNotifier)',
                  description: 'Auto update UI dengan notifyListeners()',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.visibility,
                  title: 'Observer Pattern (Consumer)',
                  description: 'Widget rebuild otomatis saat data berubah',
                ),
                SizedBox(height: 8),
                _InfoItem(
                  icon: Icons.link_off,
                  title: 'No findViewById()',
                  description: 'Data binding otomatis dengan Provider',
                ),
                Divider(height: 24),
                Text(
                  'Android Equivalent:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('• ViewModel → CounterViewModel'),
                Text('• LiveData → ChangeNotifier'),
                Text('• Observer → Consumer<T>'),
                Text('• Data Binding → Provider'),
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
