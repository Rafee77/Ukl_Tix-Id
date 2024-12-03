import 'package:ex_ukl/views/BioskopView.dart';
import 'package:ex_ukl/views/MovieView.dart';
import 'package:ex_ukl/views/TicketView.dart';
import 'package:flutter/material.dart';

class BoardView extends StatefulWidget {
  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  int _selectedIndex = 0;

  // Dropdown related variables
  String _selectedCity = 'Jakarta';
  final List<String> _cities = [
    'Jakarta',
    'Surabaya',
    'Bandung',
    'Yogyakarta',
    'Medan'
  ];

  List<Widget> _pages = [
    DashboardPage(),
    Movieview(),
    Bioskopview(),
    Ticketview(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bioskop App'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Notifikasi terkini!")),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdown bar under AppBar
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Pilih Kota:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCity = newValue!;
                      });
                    },
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    items:
                        _cities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.amber,
        selectedItemColor: Color.fromARGB(255, 0, 30, 105),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Scrollable Banner Section
          Container(
            height: 225, // Height for the scrollable banners
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHorizontalBanner('assets/banner1.jpeg'),
                SizedBox(width: 10),
                _buildHorizontalBanner('assets/banner3.jpeg'),
                SizedBox(width: 10),
                _buildHorizontalBanner('assets/banner2.jpeg'),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Movie Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sedang Tayang',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  height: 208,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildMovieCard('assets/redone1.webp', 'Red One'),
                      SizedBox(width: 18),
                      _buildMovieCard('assets/absol.webp', 'Absoluts'),
                      SizedBox(width: 18),
                      _buildMovieCard('assets/Hutang.jpg', 'Hutang Nyawa'),
                      SizedBox(width: 18),
                      _buildMovieCard('assets/thequin.jpg', 'The Quintuples'),
                      SizedBox(width: 18),
                      _buildMovieCard('assets/rm.webp', 'RM: Orang Ramah'),
                      SizedBox(width: 18),
                      _buildMovieCard('assets/mega.webp', 'Megalopish'),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                _buildFoodBanner('assets/ss1.png'),
                SizedBox(
                  height: 5,
                  width: 1000,
                ),

                Text(
                  'Spotlight',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildSpotlightBanner('assets/spot1.webp'),
                      SizedBox(width: 10),
                      _buildSpotlightBanner('assets/spot2.webp'),
                      SizedBox(width: 10),
                      _buildSpotlightBanner('assets/spot3.webp'),
                      SizedBox(width: 10),
                      _buildSpotlightBanner('assets/spot4.webp'),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Berita Terbaru Section
                _buildNewsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildHorizontalBanner(String imagePath) {
    return Container(
      width: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget _buildMovieCard(String imagePath, String title) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  static Widget _buildFoodBanner(String imagePath) {
    return Container(
      width: 550,
      height: 200, // Set the height for the food banner
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget _buildSpotlightBanner(String imagePath) {
    return Container(
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35),
        Text(
          'Berita Terbaru',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildNewsCard(
                  'assets/new1.webp',
                  'Teror Death Whisperer Kembali Lagi',
                  'Sukses dengan film pertamanya, film Death Whisperer yang diperankan Nadech Kugimiya kembali lagi. Setelah kematian Yam, adiknya tiga tahun yang lalu.'),
              SizedBox(height: 10),
              _buildNewsCard(
                  'assets/new2.webp',
                  'Saksikan Kembalinya Teror Guna-Guna Istri Muda',
                  'Guna-Guna Istri Muda menceritakan kisah Burhan (Anjasmara), seorang pria yang hidupnya berubah drastis setelah menikahi istri muda bernama Angel.'),
              SizedBox(height: 10),
              _buildNewsCard(
                  'assets/new3.webp',
                  'Seorang Ayah Nekat Menyimpan Jasad Anaknya Yang Sudah Meninggal Dunia',
                  'Korea Selatan semakin kreatif dalam menghadirkan hiburan untuk para penikmat film. Sebentar lagi akan hadir film Devils Stay yang diperankan oleh Lee Min-ki.'),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildNewsCard(
      String imagePath, String title, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
