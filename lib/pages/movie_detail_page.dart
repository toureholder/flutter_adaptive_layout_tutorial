import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout_tutorial/shared/github_icon_button.dart';
import '../model/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [GitHubIconButton()],
      ),
      body: MovieDetailView(movie),
    );
  }
}

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  const MovieDetailView(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(LARGE_POSTER_BASE_URL + movie.posterPath),
          ),
          SizedBox(height: 24.0),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          Text(
            movie.overview,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
