import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth for registration
import 'package:ginkhaoyang/services/Account.dart'; // Account model
import 'package:ginkhaoyang/services/AppUser.dart'; // Renamed User model to AppUser
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  Role selectedRole = Role.customer; // Default role

  // Method to register the user
  Future<void> registerUser() async {
    try {
      // Step 1: Create the user in Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // Step 2: Create an Account object
      Account newAccount = Account(
        password: passwordController.text,  // Storing passwords securely is important, but Firebase already does this.
        role: selectedRole,
      );

      // Step 3: Create an AppUser object
      AppUser newUser = AppUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        telephone: telephoneController.text,
        account: newAccount,
      );

      // Step 4: Store user data in Firestore
      CollectionReference users = FirebaseFirestore.instance.collection('User');
      await users.doc(userCredential.user!.uid).set(newUser.toJson());

      // Notify the user of successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Registered Successfully')),
      );

      // Step 5: Navigate back to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to register user')),
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
            DropdownButtonFormField<Role>(
              value: selectedRole,
              items: const [
                DropdownMenuItem(value: Role.customer, child: Text('Customer')),
                DropdownMenuItem(value: Role.shopkeeper, child: Text('Shopkeeper')),
              ],
              onChanged: (Role? value) {
                setState(() {
                  selectedRole = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Role'),
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
