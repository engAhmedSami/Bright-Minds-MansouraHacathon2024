import 'package:flutter/material.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/feature/home/presentation/views/widget/exper.dart';

class MentorDetailsPage extends StatelessWidget {
  final String name;
  final String role;
  final String company;
  final String mentees;
  final String image;

  const MentorDetailsPage({
    super.key,
    required this.name,
    required this.role,
    required this.company,
    required this.mentees,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: Image.asset(
                  image.isEmpty ? 'https://via.placeholder.com/300' : image,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                child: Text(
                  role,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizintalPadding),
                  child: ExpertiseAndReviews()),
              const SizedBox(height: 24),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizintalPadding),
                  child: CustomButton(onPressed: () {}, text: 'Book Session')),
            ],
          ),
        ),
      ),
    );
  }
}
