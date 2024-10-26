import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController authIdController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'name': nameController.text,
        'username': usernameController.text,
        'height': double.tryParse(heightController.text) ?? 0.0,
        'weight': double.tryParse(weightController.text) ?? 0.0,
        'age': int.tryParse(ageController.text) ?? 0,
        'bloodgroup': bloodGroupController.text,
        'gender': genderController.text,
        'address': addressController.text,
        'image': imageController.text,
        'authId': authIdController.text,
      };

      print("User Data: $userData");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User created successfully!')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                label: 'Name',
                controller: nameController,
                keyboardType: TextInputType.text,
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              _buildTextField(
                label: 'Username',
                controller: usernameController,
                keyboardType: TextInputType.text,
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
              ),
              _buildTextField(
                label: 'Height',
                controller: heightController,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter height' : null,
              ),
              _buildTextField(
                label: 'Weight',
                controller: weightController,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter weight' : null,
              ),
              _buildTextField(
                label: 'Age',
                controller: ageController,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter age' : null,
              ),
              _buildTextField(
                label: 'Blood Group',
                controller: bloodGroupController,
                keyboardType: TextInputType.text,
                validator: (value) =>
                    value!.isEmpty ? 'Enter blood group' : null,
              ),
              _buildTextField(
                label: 'Gender',
                controller: genderController,
                keyboardType: TextInputType.text,
                validator: (value) => value!.isEmpty ? 'Enter gender' : null,
              ),
              _buildTextField(
                label: 'Address',
                controller: addressController,
                keyboardType: TextInputType.text,
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
              ),
              _buildTextField(
                label: 'Image URL',
                controller: imageController,
                keyboardType: TextInputType.url,
                validator: (value) => value!.isEmpty ? 'Enter image URL' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
