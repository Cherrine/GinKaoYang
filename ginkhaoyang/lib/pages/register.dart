import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart'; // Import your login page

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controllers for each field
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  String selectedRole = 'customer'; // Default role

  // Method to check if email exists
  Future<bool> isEmailAlreadyRegistered(String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    QuerySnapshot result = await users.where('Email', isEqualTo: email).get();

    if (result.docs.isEmpty) {
      return false; // Email is not registered
    } else {
      return true;  // Email already exists
    }
  }

  // Method to register the user
  Future<void> registerUser() async {
    bool emailExists = await isEmailAlreadyRegistered(emailController.text);

    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email is already registered')),
      );
      return;
    }

    // Create a new user document
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    try {
      await users.add({
        'Email': emailController.text,
        'created_at': DateTime.now(),
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'password_hash': passwordController.text,  // Consider hashing passwords securely
        'role': selectedRole,
        'telephone': telephoneController.text,
        'user_id': 1,  // Handle user ID generation or use Firestore's auto-ID
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Registered Successfully')),
      );
    } catch (error) {
      print("Failed to register user: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to Register User')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: telephoneController,
              decoration: const InputDecoration(labelText: 'Telephone Number'),
            ),
            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: const InputDecoration(labelText: 'Role'),
              items: const [
                DropdownMenuItem(value: 'customer', child: Text('Customer')),
                DropdownMenuItem(value: 'shopkeeper', child: Text('Shopkeeper')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text('Register'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
