import 'package:flutter/material.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/shearch_text_field.dart';

class FreelancePage extends StatelessWidget {
  const FreelancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> freelancerCategories = {
      'Designers': [
        {
          'name': 'James Bell',
          'role': 'Graphic Designer',
          'image': 'assets/images/topone.png'
        },
        {
          'name': 'Chinedu Eze',
          'role': 'Apple Vendor',
          'image': 'assets/images/toptwo.png'
        },
        {
          'name': 'Lydia Chen',
          'role': 'Visual Designer',
          'image': 'assets/images/topthree.png'
        },
      ],
      'Developers': [
        {
          'name': 'Brandon Chen',
          'role': 'Software Dev',
          'image': 'assets/images/D_one.png'
        },
        {
          'name': 'Ryan Patel',
          'role': 'Frontend Dev',
          'image': 'assets/images/dtwo.png'
        },
        {
          'name': 'Maya Gupta',
          'role': 'Cyber Security',
          'image': 'assets/images/athree.png'
        },
      ],
      'Artisans': [
        {
          'name': 'Gabriel Gupta',
          'role': 'Technician',
          'image': 'assets/images/aone.png'
        },
        {
          'name': 'Dan Lee',
          'role': 'Carpenter',
          'image': 'assets/images/atow.png'
        },
        {
          'name': 'Avan Patel',
          'role': 'Handyman',
          'image': 'assets/images/dthree.png'
        },
      ],
    };

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
              const Text(
                'Top Rated',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Top Rated Categories
              ...freelancerCategories.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: entry.value.length,
                        itemBuilder: (context, index) {
                          final freelancer = entry.value[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 16),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      freelancer[
                                          'image']!, // Unique image for each freelancer
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    freelancer['name']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    freelancer['role']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 14),
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 14),
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 14),
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 14),
                                      Icon(Icons.star,
                                          color: Colors.grey, size: 14),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
