import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class setupLoadingWithScreen extends StatefulWidget {
  @override
  _setupLoadingWithScreenState createState() => _setupLoadingWithScreenState();
}

class _setupLoadingWithScreenState extends State<setupLoadingWithScreen> {
  bool _isLoading = false;

  Future<void> loadData() async {
    setState(() {
      _isLoading = true; // Show the loading indicator
    });

    // Simulate loading data (replace with your actual data fetching logic)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false; // Hide the loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Widget')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show the indicator
            : ElevatedButton(
                onPressed: loadData,
                child: Text('Load Data'),
              ),
      ),
    );
  }
}
