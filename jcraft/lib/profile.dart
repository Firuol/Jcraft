import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedLanguage = 'English';
  
  final Map<String, Map<String, String>> _translations = {
    'English': {
      'profile': 'Profile',
      'settings': 'Settings',
      'contact': 'Contact',
      'share_app': 'Share App',
      'help': 'Help',
      'sign_out': 'Sign Out',
      'name': 'Mark Adam',
      'email': 'Sunny_Koelpin45@hotmail.com',
      'language': 'Language'
    },
    'Amharic': {
      'profile': 'አፍሪል',
      'settings': 'ሰንት',
      'contact': 'ጋንድአር',
      'share_app': 'አፍ ከአራ',
      'help': 'ከምንዕከት',
      'sign_out': 'አፍሪከት',
      'name': 'ማርክ አዳም',
      'email': 'Sunny_Koelpin45@hotmail.com',
      'language': 'አማርይ'
    },
    'Oromiffa': {
      'profile': 'Profayilii',
      'settings': 'Gulaalaa',
      'contact': 'Quunnamtii',
      'share_app': 'App Qooduu',
      'help': 'Gargaarsa',
      'sign_out': 'Bahi',
      'name': 'Mark Adam',
      'email': 'Sunny_Koelpin45@hotmail.com',
      'language': 'Afaan'
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            _translations[_selectedLanguage]!['name']!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            _translations[_selectedLanguage]!['email']!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: ['English', 'Amharic', 'Oromiffa']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          _buildMenuItem(Icons.person, _translations[_selectedLanguage]!['profile']!),
          _buildMenuItem(Icons.settings, _translations[_selectedLanguage]!['settings']!),
          _buildMenuItem(Icons.mail, _translations[_selectedLanguage]!['contact']!),
          _buildMenuItem(Icons.share, _translations[_selectedLanguage]!['share_app']!),
          _buildMenuItem(Icons.help, _translations[_selectedLanguage]!['help']!),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              _translations[_selectedLanguage]!['sign_out']!,
              style: TextStyle(
                color: Color.fromRGBO(158, 63, 22, 1.0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black87),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black87),
          ],
        ),
      ),
    );
  }
}
