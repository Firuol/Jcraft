import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Profile Image, Greeting, and Notification Icon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  // Greeting and User Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Tamirat Caalaa',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(), // Spacer to push the notification icon to the right
                  // Notification Icon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Background color of the circle
                      shape: BoxShape.circle, // Make the container circular
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Handle notification icon press
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search here',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // Discount Promotion
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(158, 63, 22, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Get Winter Discount\n20% Off\nFor New Buyers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.local_offer,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ),

            // Featured Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 63, 22, 1.0),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFeaturedItem('Barcuma', '140 Birr'),
                  _buildFeaturedItem('Borati', '300 Birr'),
                  _buildFeaturedItem('Duka', '33 Birr'),
                ],
              ),
            ),

            // Most Popular Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 63, 22, 1.0),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPopularItem('Hule', '30 Birr'),
                  _buildPopularItem('Hirkoo', '500 Birr'),
                  _buildPopularItem('Duka', '50 Birr'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build featured items
  Widget _buildFeaturedItem(String name, String price) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Image.asset(
            'assets/images/$name.png', // Replace with your image path
            height: 80.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align name to the left
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align price to the left
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(158, 63, 22, 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build popular items
  Widget _buildPopularItem(String name, String price) {
    return PopularItem(name: name, price: price);
  }
}

class PopularItem extends StatefulWidget {
  final String name;
  final String price;

  PopularItem({required this.name, required this.price});

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isFavorited = false; // Track favorite state

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/${widget.name}.png', // Replace with your image path
                height: 80.0,
                fit: BoxFit.cover,
              ),
              // Favorite Icon
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited; // Toggle favorite state
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align name to the left
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align price to the left
              child: Text(
                widget.price,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(158, 63, 22, 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}