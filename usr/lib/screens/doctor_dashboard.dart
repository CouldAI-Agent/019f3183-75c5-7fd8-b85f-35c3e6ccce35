import 'package:flutter/material.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дашборд Врача'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 500 ? 2 : 1);
          return GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: [
              _buildCard(
                context,
                title: 'Запись приема',
                icon: Icons.mic,
                color: Colors.red,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Анализ жалоб',
                icon: Icons.analytics,
                color: Colors.blue,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Ответы пациентам',
                icon: Icons.forum,
                color: Colors.green,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Верификация',
                icon: Icons.verified_user,
                color: Colors.teal,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Подписка (\$25/мес)',
                icon: Icons.subscriptions,
                color: Colors.orange,
                onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
