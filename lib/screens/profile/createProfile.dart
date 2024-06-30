import 'package:flutter/material.dart';

class CreatProfile extends StatefulWidget {
  const CreatProfile({Key? key}) : super(key: key);

  @override
  State<CreatProfile> createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController authIdController = TextEditingController();
  List<TextEditingController> recordsControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bloodgroupController,
              decoration: const InputDecoration(
                hintText: 'Blood Group',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                hintText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                hintText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                hintText: 'Weight',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                hintText: 'Image URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: authIdController,
              decoration: const InputDecoration(
                hintText: 'Auth ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ButtonBar(
              
            )
          ],
        ),
      ),
    );
  }
}
