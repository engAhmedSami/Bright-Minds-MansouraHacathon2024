import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/company_page.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/freelance.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/montors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTechnicalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    // Technical Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTechnicalSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: _isTechnicalSelected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF6390cf),
                                      Color(0xFF2c2c68),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Technical",
                            style: TextStyle(
                              color: _isTechnicalSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Non-Technical Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTechnicalSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: !_isTechnicalSelected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF6390cf),
                                      Color(0xFF2c2c68),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Non-Technical",
                            style: TextStyle(
                              color: !_isTechnicalSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Content
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _isTechnicalSelected
                    ? technicalCategories.length
                    : nonTechnicalCategories.length,
                itemBuilder: (context, index) {
                  final items = _isTechnicalSelected
                      ? technicalCategories
                      : nonTechnicalCategories;
                  return InkWell(
                    onTap: () {
                      if (items[index].title == 'Job Opportunities') {
                        // Show dialog if Job Opportunities is tapped
                        _showJobOpportunitiesDialog(context);
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => items[index].page,
                          ),
                        );
                        log('Tapped on ${items[index].title}');
                      }
                    },
                    splashColor:
                        Colors.blue.withOpacity(0.5), // Simple splash color
                    highlightColor: Colors.transparent, // No highlight
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF6390cf),
                            Color(0xFF2c2c68),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        items[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showJobOpportunitiesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Freelance'),
                onTap: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const FreelancePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Company'),
                onTap: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const CompanyPage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Data Models
class Category {
  final String title;
  final Widget page;

  Category({required this.title, required this.page});
}

// Define Technical Pages
final List<Category> technicalCategories = [
  Category(title: "Mentors", page: MentorHomePage()),
  Category(title: "Courses", page: CoursesPage()),
  Category(title: "Community", page: CommunityPage()),
  Category(title: "Job Opportunities", page: JobOpportunitiesPage()),
  Category(title: "Hackathons and Competitions", page: HackathonsPage()),
];

// Define Non-Technical Pages
final List<Category> nonTechnicalCategories = [
  Category(title: "Public Speaking", page: PublicSpeakingPage()),
  Category(title: "Soft Skills", page: SoftSkillsPage()),
  Category(title: "Networking", page: NetworkingPage()),
  Category(title: "Leadership", page: LeadershipPage()),
  Category(
      title: "Personal Development", page: const PersonalDevelopmentPage()),
];

// Sample Pages for Freelance and Company

// Sample Pages (To be replaced with actual pages)

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses Page')),
      body: const Center(child: Text('Courses Page Content')),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Page')),
      body: const Center(child: Text('Community Page Content')),
    );
  }
}

class JobOpportunitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Opportunities Page')),
      body: const Center(child: Text('Job Opportunities Page Content')),
    );
  }
}

class HackathonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hackathons Page')),
      body: const Center(child: Text('Hackathons Page Content')),
    );
  }
}

class PublicSpeakingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Public Speaking Page')),
      body: const Center(child: Text('Public Speaking Page Content')),
    );
  }
}

class SoftSkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Soft Skills Page')),
      body: const Center(child: Text('Soft Skills Page Content')),
    );
  }
}

class NetworkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Networking Page')),
      body: const Center(child: Text('Networking Page Content')),
    );
  }
}

class LeadershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leadership Page')),
      body: const Center(child: Text('Leadership Page Content')),
    );
  }
}

class PersonalDevelopmentPage extends StatelessWidget {
  const PersonalDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Development Page')),
      body: const Center(child: Text('Personal Development Page Content')),
    );
  }
}
