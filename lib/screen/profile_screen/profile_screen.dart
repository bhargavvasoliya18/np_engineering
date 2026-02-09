import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np_engineering/common_widget/common_widget.dart';
import 'package:np_engineering/common_widget/custom_button.dart';
import 'package:np_engineering/screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:np_engineering/screen/login_screen/login_bloc.dart';
import 'package:np_engineering/screen/login_screen/login_event.dart';
import 'package:np_engineering/screen/login_screen/login_screen.dart';
import 'package:np_engineering/utils/responsive.dart';

/*
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainer(
        padding: ResponsiveUtil.getResponsivePadding(
          context,
          const EdgeInsets.all(20),
        ),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            CustomRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                  ),
                ),
              ],
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 30)),
            Center(
              child: CustomColumn(
                children: [
                  CustomContainer(
                    width: ResponsiveUtil.getResponsiveWidth(context, 100),
                    height: ResponsiveUtil.getResponsiveHeight(context, 100),
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
                      size: ResponsiveUtil.getResponsiveFontSize(context, 50),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),
                  Text(
                    'Julia Martins',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'julia@company.com',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 40)),

            // Profile Options
            _buildProfileOption(
              context,
              icon: Icons.location_on_outlined,
              title: 'Location',
              subtitle: 'New York, USA',
            ),
            _buildProfileOption(
              context,
              icon: Icons.work_outline,
              title: 'Your Organization',
              subtitle: 'Nuvious Point Inc.',
            ),
            _buildProfileOption(
              context,
              icon: Icons.delete_outline,
              title: 'Delete',
              subtitle: null,
              isDestructive: true,
            ),

            const Spacer(),

            // Logout Button
            CustomButton(
              text: 'Logout',
              onPressed: () {
                context.read<LoginBloc>().add(LogoutEvent());
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                );
              },
              width: double.infinity,
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        String? subtitle,
        bool isDestructive = false,
      }) {
    return CustomContainer(
      margin: EdgeInsets.only(
        bottom: ResponsiveUtil.getResponsiveHeight(context, 12),
      ),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        child: CustomRow(
          children: [
            Icon(
              icon,
              size: ResponsiveUtil.getResponsiveFontSize(context, 24),
              color: isDestructive ? Colors.red : const Color(0xFF007AFF),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : Colors.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: ResponsiveUtil.getResponsiveFontSize(context, 13),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: ResponsiveUtil.getResponsiveFontSize(context, 24),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}*/

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header - Fixed
        CustomContainer(
          padding: ResponsiveUtil.getResponsivePadding(
            context,
            const EdgeInsets.all(20),
          ),
          child: CustomRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                ),
              ),
            ],
          ),
        ),

        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            padding: ResponsiveUtil.getResponsivePadding(
              context,
              const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: CustomColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile Picture and Info
                Center(
                  child: CustomColumn(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomContainer(
                        width: ResponsiveUtil.getResponsiveWidth(context, 100),
                        height: ResponsiveUtil.getResponsiveHeight(context, 100),
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
                          size: ResponsiveUtil.getResponsiveFontSize(context, 50),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),
                      Text(
                        'Julia Martins',
                        style: TextStyle(
                          fontSize: ResponsiveUtil.getResponsiveFontSize(context, 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'julia@company.com',
                        style: TextStyle(
                          fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 40)),

                // Profile Options
                _buildProfileOption(
                  context,
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                  subtitle: 'New York, USA',
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.work_outline,
                  title: 'Your Organization',
                  subtitle: 'Nuvious Point Inc.',
                ),
                _buildProfileOption(
                  context,
                  icon: Icons.delete_outline,
                  title: 'Delete',
                  subtitle: null,
                  isDestructive: true,
                ),

                SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 40)),

                // Logout Button
                CustomButton(
                  text: 'Logout',
                  onPressed: () {
                    // context.read<LoginBloc>().add(LogoutEvent());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false,
                    );
                  },
                  width: double.infinity,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption(BuildContext context, {required IconData icon, required String title, String? subtitle, bool isDestructive = false}) {
    return CustomContainer(
      margin: EdgeInsets.only(bottom: ResponsiveUtil.getResponsiveHeight(context, 12)),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title clicked')));
        },
        child: CustomRow(
          children: [
            Icon(icon, size: ResponsiveUtil.getResponsiveFontSize(context, 24), color: isDestructive ? Colors.red : const Color(0xFF007AFF)),
            const SizedBox(width: 16),
            Expanded(
              child: CustomColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : Colors.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: ResponsiveUtil.getResponsiveFontSize(context, 13), color: Colors.grey)),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: ResponsiveUtil.getResponsiveFontSize(context, 24),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}