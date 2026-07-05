import 'package:flutter/material.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дашборд Пациента'),
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
                title: 'Самодиагностика ИИ',
                icon: Icons.smart_toy,
                color: Colors.purple,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Задать вопрос врачу',
                icon: Icons.question_answer,
                color: Colors.blue,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Отчеты по здоровью',
                icon: Icons.health_and_safety,
                color: Colors.green,
                onTap: () {},
              ),
              _buildCard(
                context,
                title: 'Подписка (\$10/мес)',
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
