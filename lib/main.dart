import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

const Color primaryBlue = Color(0xFF087BFA);
const Color darkBlue = Color(0xFF10295B);
const Color pageBackground = Color(0xFFF2F7FF);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: pageBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfileCard(context),
              const SizedBox(height: 28),
              _buildSectionHeading(),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final bool wide = constraints.maxWidth >= 520;
                  if (wide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: InterestCard(
                            title: 'Travel',
                            description: 'Exploring new places around the world',
                            imageUrl:
                                'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=900',
                            icon: Icons.flight_takeoff_rounded,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: InterestCard(
                            title: 'Photography',
                            description: 'Capturing moments through the lens',
                            imageUrl:
                                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=900',
                            icon: Icons.camera_alt_rounded,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: const [
                      InterestCard(
                        title: 'Travel',
                        description: 'Exploring new places around the world',
                        imageUrl:
                            'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=900',
                        icon: Icons.flight_takeoff_rounded,
                      ),
                      SizedBox(height: 16),
                      InterestCard(
                        title: 'Photography',
                        description: 'Capturing moments through the lens',
                        imageUrl:
                            'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=900',
                        icon: Icons.camera_alt_rounded,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.09),
            blurRadius: 26,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 116,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF66B8FF), Color(0xFF087BFA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  left: -42,
                  top: -90,
                  child: _decorativeCircle(190, Colors.white.withOpacity(0.12)),
                ),
                Positioned(
                  right: -55,
                  top: 18,
                  child: _decorativeCircle(150, Colors.white.withOpacity(0.10)),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -70),
            child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primaryBlue.withOpacity(0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 67,
                      backgroundColor: Color(0xFFE4EAF0),
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w800,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Flutter Developer',
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      'Passionate about creating user-friendly and engaging digital experiences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5F6F89),
                        fontSize: 15,
                        height: 1.55,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Divider(color: Color(0xFFDCEBFF), height: 1),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 370) {
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContactItem(
                                icon: Icons.email_rounded,
                                text: 'john.doe@example.com',
                              ),
                              SizedBox(height: 12),
                              ContactItem(
                                icon: Icons.phone_rounded,
                                text: '+123 456 7890',
                              ),
                            ],
                          );
                        }
                        return const Column(
                          children: [
                            ContactItem(
                              icon: Icons.email_rounded,
                              text: 'john.doe@example.com',
                            ),
                            SizedBox(height: 12),
                            ContactItem(
                              icon: Icons.phone_rounded,
                              text: '+123 456 7890',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final bool stackButtons = constraints.maxWidth < 320;
                        final followButton = ElevatedButton.icon(
                          onPressed: () {
                            setState(() => isFollowing = !isFollowing);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFollowing
                                      ? 'You are now following John Doe'
                                      : 'You unfollowed John Doe',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Icon(
                            isFollowing
                                ? Icons.check_rounded
                                : Icons.person_add_alt_1_rounded,
                            size: 20,
                          ),
                          label: Text(isFollowing ? 'Following' : 'Follow'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            minimumSize: const Size(0, 54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                        final messageButton = OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Message button tapped'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_rounded, size: 20),
                          label: const Text('Message'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryBlue,
                            side: const BorderSide(color: primaryBlue),
                            minimumSize: const Size(0, 54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                        if (stackButtons) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              followButton,
                              const SizedBox(height: 10),
                              messageButton,
                            ],
                          );
                        }
                        return Row(
                          children: [
                            Expanded(child: followButton),
                            const SizedBox(width: 12),
                            Expanded(child: messageButton),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _decorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildSectionHeading() {
    return Row(
      children: [
        Container(
          width: 6,
          height: 32,
          decoration: BoxDecoration(
            color: primaryBlue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Interests',
          style: TextStyle(
            color: darkBlue,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        Container(
          width: 48,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xFFACD2FF),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: primaryBlue,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 19),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF344867),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class InterestCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final IconData icon;

  const InterestCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
              aspectRatio: 1.55,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    color: const Color(0xFFE4F0FF),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: primaryBlue,
                      strokeWidth: 2,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE4F0FF),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: primaryBlue,
                      size: 38,
                    ),
                  );
                },
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(4, -24),
            child: Container(
              width: 54,
              height: 54,
    margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE4F2FF), Color(0xFFB9DCFF)],
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Icon(icon, color: primaryBlue, size: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style: const TextStyle(
                color: darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              description,
              style: const TextStyle(
                color: Color(0xFF71819B),
                fontSize: 14,
                height: 1.45,
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title selected'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFEAF4FF),
                foregroundColor: primaryBlue,
                side: const BorderSide(color: Color(0xFFD4E8FF)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
