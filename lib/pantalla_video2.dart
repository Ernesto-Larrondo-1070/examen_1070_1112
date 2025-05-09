import 'package:flutter/material.dart';

class PantallaVideo2 extends StatelessWidget {
  const PantallaVideo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9F6),
      bottomNavigationBar: _BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderSection(),
              SizedBox(height: 20),
              _SearchBar(),
              SizedBox(height: 30),
              _SectionTitle(title: 'Top of the week'),
              SizedBox(height: 16),
              _TopOfWeekCards(),
              SizedBox(height: 30),
              _SectionTitle(title: 'Currently active'),
              SizedBox(height: 16),
              _CurrentlyActiveCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Mark!",
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              SizedBox(height: 4),
              Text("Let's boost your\nbrain power ✨",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, height: 1.3)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for history , classes,...',
                hintStyle: TextStyle(color: Colors.black38),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xFFFFC266),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Spacer(),
        Text("view all", style: TextStyle(color: Colors.black45)),
      ],
    );
  }
}

class _TopOfWeekCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _CourseCard(
            image: 'assets/aves-y-sus-plumas.jpg',
            name: 'Luma Lanori',
            title: 'Paint techniques',
            duration: '2h 22 min',
            showStart: true,
          ),
          SizedBox(width: 16),
          _CourseCard(
            image: 'assets/aves-y-sus-plumas.jpg',
            name: 'Daniel C.',
            title: 'Mushrooms study',
            duration: '1h 50 min',
            showStart: false,
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String duration;
  final bool showStart;

  const _CourseCard({
    required this.image,
    required this.name,
    required this.title,
    required this.duration,
    required this.showStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                color: Colors.white.withOpacity(0.9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showStart)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC266),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("Start",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                    ),
                  Text(name,
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Text(title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(duration,
                      style: TextStyle(fontSize: 12, color: Colors.black45)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentlyActiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/aves-y-sus-plumas.jpg', width: 60),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Symetry theory',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text('2 lesson left',
                    style: TextStyle(color: Colors.black45, fontSize: 12)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: CircularProgressIndicator(
                  value: 0.61,
                  strokeWidth: 4,
                  backgroundColor: Color(0xFFF1E9D4),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFC266)),
                ),
              ),
              Text('61%', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home, color: Colors.orange),
            Icon(Icons.grid_view_outlined),
            Icon(Icons.bookmark_border),
            Icon(Icons.person_outline),
          ],
        ),
      ),
    );
  }
}
