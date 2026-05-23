import 'package:flutter/material.dart';
import 'package:tudo_avr/feature/profile/manager/data/profile_database.dart';
import 'package:tudo_avr/feature/profile/manager/models/profile_m.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileM profileData;
  const EditProfilePage({super.key, required this.profileData});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameController.text = widget.profileData.name ?? '';
    emailController.text = widget.profileData.email ?? '';
    ageController.text = widget.profileData.age?.toString() ?? '';
    super.initState();
  }

  void updateProfile() async {
    ProfileDatabase.updateProfile(
      ProfileM(
        name: nameController.text,
        email: emailController.text,
        age: int.tryParse(ageController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              ProfileM(
                name: nameController.text,
                email: emailController.text,
                age: int.tryParse(ageController.text),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProfile();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
