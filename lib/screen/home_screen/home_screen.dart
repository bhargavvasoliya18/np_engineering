import 'package:flutter/material.dart';
import 'package:np_engineering/common_widget/common_widget.dart';
import 'package:np_engineering/screen/add_expenses_screen/add_expenses_screen.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_screen.dart';
import 'package:np_engineering/screen/profile_screen/profile_screen.dart';
import 'package:np_engineering/utils/responsive.dart';

/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const MyExpensesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF007AFF),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Expenses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
        onPressed: () {
          // Add expense action
        },
        backgroundColor: const Color(0xFF007AFF),
        child: const Icon(Icons.add, color: Colors.white),
      )
          : null,
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

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
                  'Dashboard',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: ResponsiveUtil.getResponsiveFontSize(context, 28),
                ),
              ],
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 30)),

            // Stats Cards
            CustomCard(
              padding: const EdgeInsets.all(20),
              child: CustomColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Expenses',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$5,256',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 32),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),

            // Quick Actions
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: ResponsiveUtil.getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),

            CustomRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomCard(
                    padding: const EdgeInsets.all(16),
                    child: CustomColumn(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 32),
                          color: const Color(0xFF007AFF),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add Expense',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    padding: const EdgeInsets.all(16),
                    child: CustomColumn(
                      children: [
                        Icon(
                          Icons.history,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 32),
                          color: const Color(0xFF007AFF),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const MyExpensesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: CustomContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF007AFF),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Expenses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
           onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=> AddExpenseScreen()));},
           backgroundColor: const Color(0xFF007AFF),
           child: const Icon(Icons.add, color: Colors.white),
      ) : null,
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomContainer(
        padding: ResponsiveUtil.getResponsivePadding(
          context,
          const EdgeInsets.all(20),
        ),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            CustomRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: ResponsiveUtil.getResponsiveFontSize(context, 28),
                ),
              ],
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 30)),

            // Stats Cards
            CustomCard(
              padding: const EdgeInsets.all(20),
              child: CustomColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total Expenses',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$5,256',
                    style: TextStyle(
                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 32),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),

            // Quick Actions
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: ResponsiveUtil.getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),

            CustomRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomCard(
                    padding: const EdgeInsets.all(16),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> AddExpenseScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Expense')),
                      );
                    },
                    child: CustomColumn(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 32),
                          color: const Color(0xFF007AFF),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add Expense',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    padding: const EdgeInsets.all(16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View History')),
                      );
                    },
                    child: CustomColumn(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.history,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 32),
                          color: const Color(0xFF007AFF),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),
          ],
        ),
      ),
    );
  }
}