import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/shearch_text_field.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/mentor_details_page.dart';

class MentorHomePage extends StatelessWidget {
  MentorHomePage({super.key});

  final List<Map<String, String>> mentors = [
    {
      'name': 'Sarah Rodriguez',
      'role': 'UI/UX Designer',
      'company': 'Google',
      'mentees': '15+ mentees',
      'image':
          'assets/images/Profile_Image.png', // Replace with real image URLs
    },
    {
      'name': 'Rahul Sharma',
      'role': 'Lead UX Designer',
      'company': 'Notion',
      'mentees': '10+ mentees',
      'image':
          'assets/images/Profile_Image_two.png', // Replace with real image URLs
    },
    {
      'name': 'Sarah Rodriguez',
      'role': 'Creative Director',
      'company': 'Google',
      'mentees': '15+ mentees',
      'image':
          'assets/images/Profile_Image_three.png', // Replace with real image URLs
    },
    {
      'name': 'Rahul Sharma',
      'role': 'Lead UX Designer',
      'company': 'Notion',
      'mentees': '10+ mentees',
      'image':
          'assets/images/Profile_Image_four.png', // Replace with real image URLs
    },
    {
      'name': 'Sarah Rodriguez',
      'role': 'Creative Director',
      'company': 'Notion',
      'mentees': '10+ mentees',
      'image':
          'assets/images/Profile_Image_six.png', // Replace with real image URLs
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // User Information Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Welcome Text and Name
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.waving_hand,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Minh Nguyen',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Right side: User Profile Image
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: Image.asset(
                      Assets.imagesEllipse,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const ShearchTextField(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.imagesQuickFind,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested Mentors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.7,

                  // Adjust to match the natural height of cards
                ),
                itemCount: mentors.length,
                itemBuilder: (context, index) {
                  final mentor = mentors[index];
                  return MentorCard(
                    name: mentor['name']!,
                    role: mentor['role']!,
                    company: mentor['company']!,
                    mentees: mentor['mentees']!,
                    image: mentor['image']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final String name;
  final String role;
  final String company;
  final String mentees;
  final String image;

  const MentorCard({
    super.key,
    required this.name,
    required this.role,
    required this.company,
    required this.mentees,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MentorDetailsPage(
              name: name,
              role: role,
              company: company,
              mentees: mentees,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                image.isEmpty ? 'https://via.placeholder.com/150' : image,
                width: double.infinity,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.business,
                            size: 16, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(
                          company,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.group,
                            size: 16, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(
                          mentees,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
