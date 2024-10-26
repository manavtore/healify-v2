import 'package:flutter/material.dart';

class ManageRecordScreen extends StatefulWidget {
  const ManageRecordScreen({super.key});

  @override
  State<ManageRecordScreen> createState() => _ManageRecordScreenState();
}

class _ManageRecordScreenState extends State<ManageRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
          ),
        ),
        title: const Text(
          'Hello, Jacob!',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage Record',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                  ),
                  child: const Icon(Icons.add, size: 32, color: Colors.black),
                ),
                const SizedBox(width: 16),
                const Text('Add', style: TextStyle(fontSize: 24)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Records (25)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, 
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Text(
                      '12/12/2004',
                      style: TextStyle(color: Colors.green),
                    ),
                    title: const Text('Blood Sugar'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle record tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
    );
  }
}
