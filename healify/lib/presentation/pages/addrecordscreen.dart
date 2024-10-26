import 'package:flutter/material.dart';
import 'package:healify/presentation/widgets/components.dart';

class addRecordScreen extends StatefulWidget {
  const addRecordScreen({super.key});

  @override
  State<addRecordScreen> createState() => _addRecordScreenState();
}

class _addRecordScreenState extends State<addRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar(title: 'Add Record'),

      body: const Column(
        
      ),
    );
    
  }
}