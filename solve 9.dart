import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomCardList(),
  ));
}

class CustomCardList extends StatelessWidget {
  const CustomCardList({super.key});

  final List<Map<String, String>> items = const [
    {
      'image': 'https://media.istockphoto.com/id/1133073540/photo/tropical-beach-and-beautiful-sunrise-view-in-punta-cana-bay-dominican-republic.jpg?s=612x612&w=0&k=20&c=YsLPlxvmgdx4DOjxB3VFYju6pMqTARvYwy4KkfnM09c=',
      'title': 'Sunset View',
      'subtitle': 'Nature',
      'description': 'A beautiful sunset view captured from the hills.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToKQVkgW2adRbeyUmygeJ4Puus7dNjQXitaQ&s',
      'title': 'City Lights',
      'subtitle': 'Urban',
      'description': 'The city comes alive with lights at night.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsxqdD6crP50boJK6Diy_zh6O2_6KpdlH9BA&s',
      'title': 'Forest Trail',
      'subtitle': 'Adventure',
      'description': 'Walking through the peaceful forest trail.',
    },
    {
      'image': 'https://www.shutterstock.com/image-photo/ocean-water-background-foam-splash-260nw-2460168659.jpg',
      'title': 'Ocean Breeze',
      'subtitle': 'Beach',
      'description': 'Feel the breeze at the edge of the ocean.',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTvo1XSuICvP8VGJ3GYsi9LOQmmkM_lZHYGQ&s',
      'title': 'Mountain Peak',
      'subtitle': 'Hiking',
      'description': 'Reaching the peak after a long hike.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Cards',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomAnimatedCard(
            imageUrl: item['image']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}


class CustomAnimatedCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const CustomAnimatedCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<CustomAnimatedCard> createState() => _CustomAnimatedCardState();
}

class _CustomAnimatedCardState extends State<CustomAnimatedCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isTapped = true),
      onTapUp: (_) => setState(() => isTapped = false),
      onTapCancel: () => setState(() => isTapped = false),
      child: AnimatedScale(
        scale: isTapped ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: isTapped ? Colors.black26 : Colors.black45,
                blurRadius: isTapped ? 4 : 8,
                offset: const Offset(3, 3),
              )
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(15)),
                child: Image.network(
                  widget.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(widget.subtitle,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text(widget.description,
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
