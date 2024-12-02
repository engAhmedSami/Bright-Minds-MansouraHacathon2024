import 'package:flutter/material.dart';

class ExpertiseAndReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expertise Box
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expertise',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ExpertiseTag(label: 'Leadership', color: Colors.orange[100]!),
                const SizedBox(height: 8),
                ExpertiseTag(
                    label: 'Creative Direction', color: Colors.green[100]!),
                const SizedBox(height: 8),
                ExpertiseTag(
                    label: 'Design Strategy', color: Colors.blue[100]!),
                const SizedBox(height: 34),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Reviews Box
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Reviews (10)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  '“Sarah is an amazing mentor who really took the time to understand my goals and help me achieve them…”',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(
                        'assets/images/jane.png', // Replace with actual image path
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Jane',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ExpertiseTag extends StatelessWidget {
  final String label;
  final Color color;

  const ExpertiseTag({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
