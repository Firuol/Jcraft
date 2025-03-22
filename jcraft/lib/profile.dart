import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
            'Mark Adam',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Sunny_Koelpin45@hotmail.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          _buildMenuItem(Icons.person, 'Profile'),
          _buildMenuItem(Icons.settings, 'Setting'),
          _buildMenuItem(Icons.mail, 'Contact'),
          _buildMenuItem(Icons.share, 'Share App'),
          _buildMenuItem(Icons.help, 'Help'),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign Out',
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
            Icon(Icons.arrow_forward_ios, size: 16, color:Colors.black87),
          ],
        ),
      ),
    );
  }
}
