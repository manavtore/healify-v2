import 'package:flutter/material.dart';
import 'package:healify/presentation/ui/utils/images/image_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: const ImageIcon(
            AssetImage(
              ImageLibrary.luffy
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Home Page')
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}