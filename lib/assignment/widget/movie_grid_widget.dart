import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/model/movie.dart';

class MovieGridWidget extends StatelessWidget {
  final Movie movie;
  final Function toggleMovies;
  MovieGridWidget(this.movie, {@required this.toggleMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Image.asset(
              movie.imgAsset,
              fit: BoxFit.cover,
              height: 300.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      movie.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 150.0,
                      top: 20.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        toggleMovies(movie);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: movie.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
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
