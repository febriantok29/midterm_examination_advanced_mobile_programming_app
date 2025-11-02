import 'package:flutter/material.dart';
import 'package:midterm_examination_advanced_mobile_programming_app/app/constants/app_colors.dart';



class IntentPassingPage extends StatefulWidget {
  const IntentPassingPage({super.key});

  @override
  State<IntentPassingPage> createState() => _IntentPassingPageState();
}

class _IntentPassingPageState extends State<IntentPassingPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _sendData() {
    if (_nameController.text.isNotEmpty) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(name: _nameController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama tidak boleh kosong!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Passing'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_add, size: 80, color: AppColors.info),
            const SizedBox(height: 32),
            const Text(
              'Masukkan Nama Anda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Data akan dikirim ke halaman berikutnya',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                hintText: 'Masukkan nama Anda',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendData(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _sendData,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info,
                foregroundColor: AppColors.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Kirim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Data Passing'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: AppColors.success,
              ),
              const SizedBox(height: 32),
              const Text(
                'Data Berhasil Diterima!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.infoContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.info, width: 2),
                ),
                child: Text(
                  'Halo, $name!',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.info,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
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
