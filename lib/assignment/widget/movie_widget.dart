import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/model/movie.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  final Function toggleMovies;
  MovieWidget(this.movie, {@required this.toggleMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        elevation: 4.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.imgAsset,
              fit: BoxFit.cover,
              width: 150.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      left: 12.0,
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6.0,
                      left: 12.0,
                    ),
                    child: Text(
                      movie.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 48.0,
                      left: 170.0,
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
