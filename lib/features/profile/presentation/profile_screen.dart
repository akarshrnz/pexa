import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pexa_carcare_test/core/Api_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
       
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.moviePlaceHolder,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name
            Text(
              'Akarsh kk',
              style: theme.textTheme.headline1?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 12),

            // Bio
            Text(
              'Flutter Developer with a passion for beautiful UIs and clean architecture.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
