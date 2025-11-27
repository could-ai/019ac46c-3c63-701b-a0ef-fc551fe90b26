import 'package:flutter/material.dart';

class LiveClassesScreen extends StatelessWidget {
  const LiveClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Classes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLiveNowSection(context),
          const SizedBox(height: 24),
          const Text(
            'Upcoming Classes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildUpcomingClassCard(
            context,
            'Advanced Grammar Workshop',
            'Today, 4:00 PM',
            'Sarah Jenkins',
            'https://i.pravatar.cc/150?img=5',
          ),
          _buildUpcomingClassCard(
            context,
            'Business English Etiquette',
            'Tomorrow, 10:00 AM',
            'Michael Ross',
            'https://i.pravatar.cc/150?img=11',
          ),
          _buildUpcomingClassCard(
            context,
            'Casual Conversation Club',
            'Tomorrow, 2:00 PM',
            'Emma Watson',
            'https://i.pravatar.cc/150?img=9',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.calendar_today),
        label: const Text('Schedule'),
      ),
    );
  }

  Widget _buildLiveNowSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'LIVE NOW',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Placeholder for stream thumbnail
                    Image.network(
                      'https://picsum.photos/seed/english/600/300',
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Center(child: Icon(Icons.image, size: 50)),
                    ),
                    Container(
                      color: Colors.black26,
                      child: const Center(
                        child: Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mastering Pronunciation: The "TH" Sound',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=32'),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'with Dr. Alan Grant',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            '125 watching',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text('Join Class'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingClassCard(
    BuildContext context,
    String title,
    String time,
    String instructor,
    String imageUrl,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(width: 60, height: 60, color: Colors.grey),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(time),
              ],
            ),
            const SizedBox(height: 2),
            Text('by $instructor'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
      ),
    );
  }
}
