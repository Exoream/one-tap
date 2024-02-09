import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isEditing = false;
  final TextEditingController _usernameController =
      TextEditingController(text: 'Al Hilaluddin');
  final TextEditingController _emailController =
      TextEditingController(text: 'shiigetsu1@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Account' : 'Account',
            style: const TextStyle(color: Colors.blue)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/3.webp'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                isEditing ? _usernameController.text : 'Al Hilaluddin',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Name'),
              subtitle: isEditing
                  ? TextField(
                      controller: _usernameController,
                    )
                  : Text(_usernameController.text),
              onTap: () {
                if (isEditing) {}
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: isEditing
                  ? TextField(
                      controller: _emailController,
                    )
                  : Text(_emailController.text),
              onTap: () {
                if (isEditing) {}
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_balance),
              title: const Text('Bank Account'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Account Security'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Get.offNamed(RoutesNamed.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
