import 'package:flutter/material.dart';
import 'package:healthy_app_ui/models/doctor_model.dart';
import 'package:healthy_app_ui/widgets/health_needs.dart';
import 'package:healthy_app_ui/widgets/nearby_doctors.dart';
import 'package:healthy_app_ui/widgets/upcoming_card.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, User"),
            Text(
              "How are you feeling today?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.search_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            const UpcomingCard(),
            const SizedBox(height: 20),
            Text(
              "Health Needs",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            const HealthNeeds(),
            const SizedBox(height: 25),
            Text(
              "Nearby Doctors",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            const NearbyDoctors()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Icon(Ionicons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            activeIcon: Icon(Ionicons.calendar),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            activeIcon: Icon(Ionicons.chatbox_ellipses),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
