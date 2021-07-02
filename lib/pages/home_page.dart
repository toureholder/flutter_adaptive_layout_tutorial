import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';
import 'movie_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Movie? _selectedMovie;

  @override
  Widget build(BuildContext context) {
    final movies = Movie.getList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: AdaptiveLayout(
        smallLayout: MovieListView(
          movies: movies,
          onTapItem: (Movie movie) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieDetailPage(movie)),
            );
          },
        ),
        largeLayout: Row(
          children: [
            Expanded(
              child: MovieListView(
                movies: movies,
                onTapItem: (Movie movie) {
                  setState(() {
                    _selectedMovie = movie;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                child: _selectedMovie == null
                    ? Center(
                        child: Text(
                          'Select a movie from the list on the left to see the details here.',
                        ),
                      )
                    : MovieDetailView(
                        _selectedMovie!,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieListView extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onTapItem;

  const MovieListView({
    Key? key,
    required this.movies,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          key: Key('list_item_$index'),
          leading: Image.network(SMALL_POSTER_BASE_URL + movie.posterPath),
          title: Text('${movie.title}'),
          contentPadding: EdgeInsets.all(12.0),
          onTap: () {
            onTapItem.call(movie);
          },
        );
      },
    );
  }
}
