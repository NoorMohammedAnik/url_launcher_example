import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Function to open a web address
  Future launchWebsite(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to make a phone call
  Future<void> makePhoneCall(String phoneNumber) async {
    Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Function to send an SMS
  Future<void> sendSMS(String phoneNumber) async {
    Uri uri = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch SMS to $phoneNumber';
    }
  }

  // Function to send an email
  Future<void> sendEmail(String email) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Hello&body=Hi there!',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch email to $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Launcher Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => launchWebsite('https://flutter.dev/'),
              child: Text('Open Website'),
            ),

            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => makePhoneCall('1234567890'),
              child: Text('Call Phone Number'),
            ),

            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () => sendSMS('1234567890'),
              child: Text('Send SMS'),
            ),


            SizedBox(height: 10,),


            ElevatedButton(
              onPressed: () => sendEmail('iiuc@gmail.com'),
              child: Text('Send Email'),

            ),
          ],
        ),
      ),
    );
  }
}