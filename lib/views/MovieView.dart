import 'package:ex_ukl/models/Movie.dart';
import 'package:flutter/material.dart';

class Movieview extends StatefulWidget {
  const Movieview({super.key});

  @override
  State<Movieview> createState() => _MovieviewState();
}

class _MovieviewState extends State<Movieview> {
  final List<MovieModel> currentlyShowingMovies = [
    MovieModel(
        id: 1,
        title: 'Red One',
        sutradara: 'Jake Kasdan',
        posterpath: 'assets/redone1.webp'),
    MovieModel(
        id: 2,
        title: 'Hutang nyawa',
        sutradara: 'Billy Christian',
        posterpath: 'assets/hutang.jpg'),
  ];

  final List<MovieModel> comingSoonMovies = [
    MovieModel(
        id: 3,
        title: 'Megapolish',
        sutradara: 'Francis Ford Coppola',
        posterpath: 'assets/mega.webp'),
    MovieModel(
        id: 4,
        title: 'The quin',
        sutradara: 'Khisimoto',
        posterpath: 'assets/thequin.jpg'),
    MovieModel(
        id: 5, title: 'RM', sutradara: 'Abdul', posterpath: 'assets/rm.webp'),
  ];

  String searchQuery = '';

  List<MovieModel> get filteredCurrentlyShowingMovies {
    if (searchQuery.isEmpty) {
      return currentlyShowingMovies;
    } else {
      return currentlyShowingMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  List<MovieModel> get filteredComingSoonMovies {
    if (searchQuery.isEmpty) {
      return comingSoonMovies;
    } else {
      return comingSoonMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sedang Tayang'),
              Tab(text: 'Akan Tayang'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: updateSearchQuery,
                decoration: const InputDecoration(
                  labelText: 'Cari Film',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Currently Showing Section
                  _buildMovieGrid(filteredCurrentlyShowingMovies),
                  // Coming Soon Section
                  _buildMovieGrid(filteredComingSoonMovies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieGrid(List<MovieModel> movies) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(movie.posterpath, fit: BoxFit.cover),
              ),
              Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Director: ${movie.sutradara}'),
            ],
          ),
        );
      },
    );
  }
}
