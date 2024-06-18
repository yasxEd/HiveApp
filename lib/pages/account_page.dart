// account_page.dart

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement the logic to add new devices here
              },
              child: Text("Add New Device"),
            ),
            SizedBox(height: 20),
            Text("Connected Devices:"),
            // Display information about connected devices here
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logout logic here
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
