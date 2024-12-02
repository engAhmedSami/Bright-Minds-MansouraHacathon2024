import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/shearch_text_field.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> jobs = [
      {
        'title': 'Mid-level UX Designer',
        'company': 'Total',
        'type': 'Contractual',
        'salary': '\$100k - \$120k/yearly',
        'logo': 'assets/images/one.png',
        'status': null,
        'location': null,
      },
      {
        'title': 'Design Lead',
        'company': 'GitLab',
        'type': 'Full time',
        'salary': '\$64k - \$80k/yearly',
        'logo': 'assets/images/two.png',
        'status': 'Applied',
        'location': 'Remote',
      },
      {
        'title': 'UX Researcher',
        'company': 'Paypal',
        'type': 'Full time',
        'salary': '\$64k - \$80k/yearly',
        'logo': 'assets/images/four.png',
        'status': null,
        'location': 'WFO',
      },
      {
        'title': 'Senior Product Designer',
        'company': 'Google INC',
        'type': 'Full time',
        'salary': '\$64k - \$80k/yearly',
        'logo': 'assets/images/five.png',
        'status': 'Expires Soon',
        'location': 'Remote',
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Welcome Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Welcome Text and Name
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
                // User Profile Image
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
            // Search TextField
            const ShearchTextField(),
            // Jobs List
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetailPage(job: job),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Company Logo
                              Image.asset(
                                job['logo']!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 16),
                              // Job Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job['title']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      job['company']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        _buildChip(job['type']!, Colors.blue),
                                        const SizedBox(width: 8),
                                        if (job['location'] != null)
                                          _buildChip(
                                            job['location']!,
                                            job['location'] == 'Remote'
                                                ? Colors.green
                                                : Colors.orange,
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Job Status & Salary
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (job['status'] != null)
                                    _buildStatusChip(job['status']!),
                                  const SizedBox(height: 8),
                                  Text(
                                    job['salary']!,
                                    style: const TextStyle(
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

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
    );
  }

  Widget _buildStatusChip(String status) {
    Color statusColor;
    if (status == 'Applied') {
      statusColor = Colors.green;
    } else if (status == 'Expires Soon') {
      statusColor = Colors.orange;
    } else {
      statusColor = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class JobDetailPage extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobDetailPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job['title']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              job['company']!,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildChip(job['type']!, Colors.blue),
                const SizedBox(width: 8),
                if (job['location'] != null)
                  _buildChip(
                    job['location']!,
                    job['location'] == 'Remote' ? Colors.green : Colors.orange,
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Salary: ${job['salary']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
    );
  }
}
