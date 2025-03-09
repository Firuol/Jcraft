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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the selected index for the bottom navigation bar

  // List of pages/screens for the bottom navigation bar
  final List<Widget> _pages = [
    HomeContent(), // Your existing home content
    Center(child: Text('Favorites')), // Placeholder for Favorites
    Center(child: Text('Cart')), // Placeholder for Cart
    Center(child: Text('Profile')), // Placeholder for Profile
  ];

  // Handle bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        selectedItemColor: Color.fromRGBO(158, 63, 22, 1.0), // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController(); // Controller for the PageView
  int _currentPage = 0; // Track the current page for the horizontal page indicator

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        fontWeight: FontWeight.bold,
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
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search here',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding to center the text
      ),
    ),
  ),
),

          // Horizontal Page Indicator (Includes Discount Section as Page 1)
          SizedBox(
            height: 150, // Fixed height for all pages
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page; // Update the current page
                });
              },
              children: [
                // Page 1: Discount Section
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(158, 63, 22, 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Get Winter Discount\n20% Off\nFor New Buyers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ],
                  ),
                ),
                // Page 2: Additional Content
                _buildPageIndicatorItem('Page 2'),
                // Page 3: Additional Content
                _buildPageIndicatorItem('Page 3'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              3, // Number of pages
              (int index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Color.fromRGBO(158, 63, 22, 1.0) // Selected page color
                        : Colors.grey[300], // Unselected page color
                  ),
                );
              },
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
    );
  }

  // Helper method to build featured items
  Widget _buildFeaturedItem(String name, String price) {
    return FeaturedItem(name: name, price: price);
  }

  // Helper method to build popular items
  Widget _buildPopularItem(String name, String price) {
    return PopularItem(name: name, price: price);
  }

  // Helper method to build page indicator items
  Widget _buildPageIndicatorItem(String text) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FeaturedItem extends StatefulWidget {
  final String name;
  final String price;

  FeaturedItem({required this.name, required this.price});

  @override
  _FeaturedItemState createState() => _FeaturedItemState();
}

class _FeaturedItemState extends State<FeaturedItem> {
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
            alignment: Alignment.center, // Center the image
            children: [
              // Item Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  'assets/images/${widget.name}.png', // Replace with your image path
                  height: 80.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
            alignment: Alignment.center, // Center the image
            children: [
              // Item Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  'assets/images/${widget.name}.png', // Replace with your image path
                  height: 80.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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