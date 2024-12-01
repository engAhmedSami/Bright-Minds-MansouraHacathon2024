import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/core/widget/custom_name.dart';
import 'package:new_bright_minds/core/widget/custom_text_field.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  File? profileImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController behanceController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController educationLevelController =
      TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController teamsController = TextEditingController();
  File? cvFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadToFirebase() async {
    try {
      String? profileImageUrl;
      String? cvFileUrl;

      if (profileImage != null) {
        final storageRef = FirebaseStorage.instance
            .ref('profileImages/${DateTime.now().toString()}');
        await storageRef.putFile(profileImage!);
        profileImageUrl = await storageRef.getDownloadURL();
      }

      if (cvFile != null) {
        final cvRef = FirebaseStorage.instance
            .ref('cvFiles/${DateTime.now().toString()}');
        await cvRef.putFile(cvFile!);
        cvFileUrl = await cvRef.getDownloadURL();
      }

      final userData = {
        'full_name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'whatsapp': whatsappController.text,
        'college': collegeController.text,
        'dob': dobController.text,
        'linkedin': linkedinController.text,
        'behance': behanceController.text,
        'github': githubController.text,
        'specialization': specializationController.text,
        'education_level': educationLevelController.text,
        'interests': interestsController.text,
        'teams': teamsController.text,
        'profile_image': profileImageUrl,
        'cv_file': cvFileUrl,
        'created_at': Timestamp.now(),
      };

      await FirebaseFirestore.instance.collection('users').add(userData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User information uploaded successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _pickCVFile() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        cvFile = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        profileImage != null ? FileImage(profileImage!) : null,
                    backgroundColor: Colors.grey.shade300,
                    child: profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  IconButton(
                    onPressed: _pickImage,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomName(text: 'Full name'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Email'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'example@gmail.com',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Phone Number'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.phone,
                controller: phoneController,
                hintText: '0100000000',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'WhatsApp'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.phone,
                controller: whatsappController,
                hintText: '0100000000',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'College'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.text,
                controller: collegeController,
                hintText: 'faculty of',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Date of Birth'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.datetime,
                controller: dobController,
                hintText: '05/05/2023',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'LinkedIn'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.url,
                controller: linkedinController,
                hintText: 'LinkedIn profile',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Behance'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.url,
                controller: behanceController,
                hintText: 'Behance profile',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'GitHub'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.url,
                controller: githubController,
                hintText: 'GitHub profile',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Specialization'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.text,
                controller: specializationController,
                hintText: 'Specialization',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Educational Level'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.text,
                controller: educationLevelController,
                hintText: 'Educational Level',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'Interests'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.text,
                controller: interestsController,
                hintText: 'Interests',
              ),
              const SizedBox(height: 10),
              const CustomName(text: 'My Teams'),
              const SizedBox(height: 10),
              CustomTextFormField(
                textInputType: TextInputType.text,
                controller: teamsController,
                hintText: 'My teams',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'CV',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _pickCVFile,
                    icon: const Icon(Icons.upload_file),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: _uploadToFirebase,
                text: 'Conform',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
