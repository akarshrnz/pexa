import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/AppRoutes.dart';
import 'package:pexa_carcare_test/core/navigation.service.dart';
import 'package:pexa_carcare_test/features/movie/presentation/movie_screen.dart';
import 'package:provider/provider.dart';
import 'package:pexa_carcare_test/core/theme/theme_notifier.dart';
import 'package:pexa_carcare_test/features/counter/presentation/counter_screen.dart';
import 'package:pexa_carcare_test/features/country_search.dart/presentation/country_search_screen.dart';
import 'package:pexa_carcare_test/features/profile/presentation/profile_screen.dart';
// import 'package:pexa_carcare_test/features/posts/presentation/posts_screen.dart'; // Uncomment when implemented

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final textTheme = Theme.of(context).textTheme;
    final isDark = themeNotifier.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: textTheme.headline1),
        actions: [
          Row(
            children: [
              Icon(Icons.light_mode, color: isDark ? Colors.grey : Colors.orange),
              Switch(
                value: themeNotifier.isDarkMode,
                onChanged: (_) => themeNotifier.toggleTheme(),
              ),
              Icon(Icons.dark_mode, color: isDark ? Colors.yellow : Colors.grey),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome 👋', style: textTheme.headline2),
            const SizedBox(height: 4),
            Text('Choose an option below:', style: textTheme.subtitle1),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    icon: Icons.add_circle_outline,
                    label: 'Counter',
                    color: Colors.blueAccent,
                    onTap: () {
                      NavigationService().navigateTo(pathToCounter);
                    },
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.search,
                    label: 'Country Search',
                    color: Colors.green,
                    onTap: () {
                      NavigationService().navigateTo(pathToCountrySearch);
                    },
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.article_outlined,
                    label: 'Posts',
                    color: Colors.deepOrange,
                    onTap: () {
                      NavigationService().navigateTo(pathToPost);
                    },
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.person_outline,
                    label: 'Profile',
                    color: Colors.purple,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(label,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
