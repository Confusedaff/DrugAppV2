import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactPage extends StatelessWidget {
  // List of hotline numbers and their labels, including anti-drug services
  final List<Map<String, String>> hotlineNumbers = [
    {'label': 'Police', 'number': '100'},
    {'label': 'Ambulance', 'number': '102'},
    {'label': 'Kerala State Anti-Narcotics Cell', 'number': '0471-2300666'},
    {'label': 'De-addiction Helpline (Kerala)', 'number': '1800-425-1800'},
    {'label': 'Kerala State Nasha Mukt Helpline', 'number': '1056'},
    {'label': 'Kerala Police Anti-Narcotics Bureau', 'number': '0471-2720000'},
    {
      'label': 'Vimukthi (Statewide Drug-Free Kerala Campaign)',
      'number': '1800-425-4545'
    },
  ];

  // Function to launch the dialer with the given number
  void _callNumber(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView.builder(
        itemCount: hotlineNumbers.length,
        itemBuilder: (context, index) {
          final contact = hotlineNumbers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.deepPurple),
              title: Text(contact['label']!),
              subtitle: Text(contact['number']!),
              trailing: const Icon(Icons.call, color: Colors.green),
              onTap: () => _callNumber(contact['number']!),
            ),
          );
        },
      ),
    );
  }
}
