import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.headerValue,
    required this.expandedValue,
  });

  int id;
  String headerValue;
  List<String> expandedValue;
}

List<Item> generateItems() {
  return [
    Item(
      id: 0,
      headerValue: 'What is drug addiction?',
      expandedValue: [
        "Drug addiction is when someone can’t stop using drugs, even though it’s causing harm to their health, relationships, and life. They feel like they need the drug to feel okay.",
      ],
    ),
    Item(
      id: 1,
      headerValue: 'How to find help for drug addiction?',
      expandedValue: [
        'Talking to a doctor or therapist.',
        'Going to a rehab center.',
        'Joining a support group.',
        'Calling a help hotline for advice.',
      ],
    ),
    Item(
      id: 2,
      headerValue: 'How long does recovery from drug addiction take?',
      expandedValue: [
        'Recovery is different for everyone. Some people may take a few months, while others might take years. It depends on how bad the addiction is and how well the person gets help.',
      ],
    ),
    Item(
      id: 3,
      headerValue:
          'What is the role of family and friends in helping someone with addiction?',
      expandedValue: [
        'Encouraging the person to get treatment.',
        'Offering support and understanding.',
        'Helping them make better choices.',
        'Sometimes setting boundaries if the person is not ready to change.',
      ],
    ),
    Item(
      id: 4,
      headerValue: 'What are the risks of untreated drug addiction?',
      expandedValue: [
        'Serious health problems.',
        'Mental health issues.',
        'Losing relationships, jobs, or money.',
        'Getting in trouble with the law.',
        'Even death from an overdose.',
      ],
    ),
    Item(
      id: 5,
      headerValue: 'Can drug addiction happen to anyone?',
      expandedValue: [
        'Yes, drug addiction can affect anyone, regardless of age, gender, or background. Some people are more at risk because of factors like family history, mental health problems, or stressful life events.',
      ],
    ),
    Item(
      id: 6,
      headerValue: 'Is drug addiction genetic?',
      expandedValue: [
        'Yes, genetics can play a role. If someone in your family has struggled with addiction, you might be at a higher risk of developing an addiction yourself. However, environment and life experiences also affect the risk.',
      ],
    ),
    Item(
      id: 7,
      headerValue: "What’s the first step to getting help for drug addiction?",
      expandedValue: [
        "The first step is admitting there’s a problem. From there, the person can reach out for help, whether through a healthcare provider, addiction counselor, or local rehab program. It's important to get started on a treatment plan.",
      ],
    ),
    Item(
      id: 8,
      headerValue: "Can drug addiction affect my family and friends?",
      expandedValue: [
        "Yes, drug addiction can impact everyone around the person with the addiction. It can cause stress, anger, worry, and even breakdowns in relationships. Family members often need support too, and there are programs to help them cope.",
      ],
    ),
    Item(
      id: 9,
      headerValue: "Is it ever too late to get help for drug addiction?",
      expandedValue: [
        "No, it’s never too late to get help. People can recover at any stage of their addiction, no matter how long they’ve been using drugs or how severe their addiction is.",
      ],
    ),
  ];
}

class ExpansionPanelListRadioExample extends StatefulWidget {
  const ExpansionPanelListRadioExample({super.key});

  @override
  _ExpansionPanelListRadioExampleState createState() =>
      _ExpansionPanelListRadioExampleState();
}

class _ExpansionPanelListRadioExampleState
    extends State<ExpansionPanelListRadioExample> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Drug Addiction FAQs'),
          backgroundColor:
              Theme.of(context).colorScheme.tertiary // AppBar background color
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      elevation: 1, // Add shadow for better separation
      dividerColor:
          Colors.deepPurple.shade100, // Light divider color for a clean look
      expandedHeaderPadding: EdgeInsets.zero, // Remove extra padding
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                color: Colors.deepPurple,
              ),
              title: Text(
                item.headerValue,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700, // Header text color
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: item.expandedValue.map<Widget>((point) {
                if (item.expandedValue.length > 1) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• '), // Bullet point
                      Expanded(
                        child: Text(
                          point,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text(
                    point,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.start,
                  );
                }
              }).toList(),
            ),
          ),
        );
      }).toList(),
    );
  }
}
