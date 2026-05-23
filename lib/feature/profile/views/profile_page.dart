import 'package:flutter/material.dart';
import 'package:tudo_avr/core/cache/cache.dart';
import 'package:tudo_avr/feature/auth/views/login_page.dart';
import 'package:tudo_avr/feature/profile/manager/data/profile_database.dart';
import 'package:tudo_avr/feature/profile/manager/models/profile_m.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileM profileData;
  bool isLoading = true;

  void fetchProfile() async {
    // await Future.delayed(const Duration(seconds: 4));
    final result = await ProfileDatabase.getProfileById();
    profileData = ProfileM.fromJson(result);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              print(profileData);
            },
            child: Text('test'),
          ),
          SizedBox(height: 20),
          Text(
            'name: ${profileData.name}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('email: ${profileData.email}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('age: ${profileData.age}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 30),
          ElevatedButton(onPressed: null, child: Text('Edit Profile')),

          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Cache.pref.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
