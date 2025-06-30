import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Info App',
      home: HomeScreen(),
      routes: {
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')), 
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Welcome to My Info App!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.account_circle,
                      size: 150,
                      color: Colors.blue,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person, size: 50),
                SizedBox(width: 10),
                Text('Name: Shaurya', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text('Email: Shaurya@example.com'),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Settings Screen', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Back to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}