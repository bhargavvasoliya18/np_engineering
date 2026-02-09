import 'package:flutter/material.dart';
import 'package:np_engineering/common_widget/common_widget.dart';
import 'package:np_engineering/common_widget/custom_button.dart';
import 'package:np_engineering/common_widget/custom_text_form_field.dart';
import 'package:np_engineering/utils/responsive.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'Julia Martins');
  final _emailController = TextEditingController(text: 'julia@company.com');
  final _phoneController = TextEditingController(text: '+1 234 567 8900');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomContainer(
            padding: ResponsiveUtil.getResponsivePadding(
              context,
              const EdgeInsets.all(20),
            ),
            child: CustomColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      CustomContainer(
                        width: ResponsiveUtil.getResponsiveWidth(context, 120),
                        height: ResponsiveUtil.getResponsiveHeight(context, 120),
                        decoration: BoxDecoration(
                          color: const Color(0xFF007AFF),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 60),
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CustomContainer(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF007AFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 40)),

                // Name Field
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),

                // Email Field
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),

                // Phone Field
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_outlined),
                ),
                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 40)),

                // Save Button
                CustomButton(
                  text: 'Save Changes',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  width: double.infinity,
                  height: ResponsiveUtil.getResponsiveHeight(context, 50),
                ),
                const SizedBox(height: 12),

                // Cancel Button
                CustomButton(
                  text: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                  width: double.infinity,
                  height: ResponsiveUtil.getResponsiveHeight(context, 50),
                  backgroundColor: Colors.grey[300],
                  textColor: Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}