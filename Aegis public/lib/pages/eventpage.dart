import 'package:flutter/material.dart';

// Define an Event class to hold the event data
class Event {
  final String name;
  final String imagePath;
  final String location;
  final String date;

  Event({
    required this.name,
    required this.imagePath,
    required this.location,
    required this.date,
  });
}

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final TextEditingController _searchController = TextEditingController();

  // List of events with different data for each event
  List<Event> allEvents = [
    Event(
      name: 'Mar Athanasius College of Engineering',
      imagePath: 'assets/event1.png',
      location: 'Kothamangalam, Kerala',
      date: 'Jan 18',
    ),
    Event(
      name: 'National Institute of Technology',
      imagePath: 'assets/event2.png',
      location: 'Calicut, Kerala',
      date: 'Mar 5',
    ),
    Event(
      name: 'Mahatma Gandhi University',
      imagePath: 'assets/event3.png',
      location: 'Kottayam, Kerala',
      date: 'Apr 15',
    ),
    Event(
      name: 'Kerala University',
      imagePath: 'assets/event4.png',
      location: 'Thiruvananthapuram, Kerala',
      date: 'May 10',
    ),
    Event(
      name: 'Cochin University of Science and Technology',
      imagePath: 'assets/event5.png',
      location: 'Cochin, Kerala',
      date: 'Jun 7',
    ),
  ];

  // Displayed events will be filtered based on the search query
  List<Event> displayedEvents = [];

  @override
  void initState() {
    super.initState();
    displayedEvents = List.from(allEvents); // Initialize with all events
  }

  // Search functionality to filter events by name or location
  void _searchEvents(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedEvents =
            List.from(allEvents); // Show all events if query is empty
      } else {
        // Filter events by name or location, case-insensitive
        displayedEvents = allEvents
            .where((event) =>
                event.name.toLowerCase().contains(query.toLowerCase()) ||
                event.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3), Color(0xfff1f3ff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Greeting
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      color: Colors.deepPurpleAccent),
                  SizedBox(width: 8),
                  Text('Kothamangalam, Kerala', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 15),
              Text('Hello, User',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                'There are ${displayedEvents.length} events around your location',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 15),

              // Search Bar - Align icon and text field
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15), // Horizontal padding for alignment
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                        blurRadius: 5),
                  ],
                ),
                child: Row(
                  // Using Row to align the icon and text field
                  children: [
                    Icon(Icons.search, color: Colors.deepPurpleAccent),
                    SizedBox(width: 10), // Space between icon and text field
                    Expanded(
                      // Ensure text field takes up available space
                      child: TextField(
                        controller: _searchController,
                        onChanged:
                            _searchEvents, // Call _searchEvents whenever text changes
                        decoration: InputDecoration(
                          hintText: 'Search for events',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Upcoming Events Section
              Text('Upcoming Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),

              // Event Cards (Based on Search Filter)
              for (var event in displayedEvents)
                Column(
                  children: [
                    buildEventCard(event),
                    SizedBox(height: 15), // Space between cards
                  ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Modified Event Card to accept Event object and display name + location
  Widget buildEventCard(Event event) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha((0.2 * 255).toInt()),
              blurRadius: 10),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(event.imagePath,
                width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 40, // Name and Location text
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      event.location,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15, // Date text
            right: 15,
            child: Text(event.date,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
