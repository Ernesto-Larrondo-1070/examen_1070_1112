import 'package:flutter/material.dart';
import 'pantalla_video2.dart';

void main() => runApp(SpeechApp());

class SpeechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Art of Speech',
      debugShowCheckedModeBanner: false,
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5EE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset('assets/aves-y-sus-plumas.jpg'),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: _circleIcon(Icons.arrow_back),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: _circleIcon(Icons.bookmark_border),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFC266),
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaVideo2()),
                      );
                    },
                    child: Text(
                      'Start class',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rona Dida • 1h 35 min',
                      style: TextStyle(color: Colors.black54, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('The art of speech',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    'How we developed speech and how it became such a powerful tool, let\'s see.',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  SizedBox(height: 24),
                  Text('The progress',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dottedLine(),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            ModuleCard(
                              title: 'How it all started.\nExplanation',
                              duration: '22 min',
                              lessons: '2 lessons',
                              locked: false,
                            ),
                            SizedBox(height: 16),
                            ModuleCard(
                              title: 'What we didn’t know\nabout catastrophe',
                              duration: '12 min',
                              lessons: '2 lessons',
                              locked: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _dottedLine() {
    return Column(
      children: List.generate(
        20,
        (index) => Container(
          width: 2,
          height: 6,
          margin: EdgeInsets.symmetric(vertical: 2),
          color: index.isEven ? Colors.orange : Colors.transparent,
        ),
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String title;
  final String duration;
  final String lessons;
  final bool locked;

  const ModuleCard({
    required this.title,
    required this.duration,
    required this.lessons,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: locked ? Colors.white70 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              locked ? Icons.lock_outline : Icons.play_circle_outline,
              color: locked ? Colors.grey : Colors.orange,
              size: 30,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '$duration • $lessons',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
