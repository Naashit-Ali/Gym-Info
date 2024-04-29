import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Enable Push Notifications'),
              subtitle: Text('Receive notifications about workout reminders, updates, etc.'),
              onTap: () {
                // Add functionality to enable/disable push notifications
              },
            ),
            Divider(),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                // Add functionality to navigate to profile editing screen
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Add functionality to navigate to change password screen
              },
            ),
            Divider(),
            Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('App Version'),
              subtitle: Text('1.0.0'),
              onTap: () {
                // Add functionality to display app version details
              },
            ),
            ListTile(
              title: Text('Terms of Service'),
              onTap: () {
                // Add functionality to navigate to terms of service screen
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Add functionality to navigate to privacy policy screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
