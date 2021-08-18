import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/assignment/widget/movie_grid_widget.dart';

class FavoriteScreen extends StatelessWidget {
  final Function toggleMovies;
  FavoriteScreen({this.toggleMovies});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          mainAxisExtent: 400,
        ),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   childAspectRatio: 1, // show the percentage of height to width
        //   crossAxisCount: 2,
        //   mainAxisSpacing: 4.0,
        //   crossAxisSpacing: 4.0,
        //   mainAxisExtent: 300,
        // ),
        itemBuilder: (context, index) {
          return Container(
              child: MovieGridWidget(
                  movies.where((element) => element.isFavorite).toList()[index],
                  toggleMovies: toggleMovies));
        },
        itemCount: movies.where((element) => element.isFavorite).length,
        // reverse: true,
        // scrollDirection: Axis.horizontal,
        physics:
            BouncingScrollPhysics(), // How the scrolling behavior look like
      ),
    );
  }
}

/*
ListView.builder(
        itemBuilder: (context, index) {
          return MovieWidget(
            movies.where((element) => element.isFavorite).toList()[index],
            toggleMovies: toggleMovies,
          );
        },
        itemCount: movies.where((element) => element.isFavorite).length,
      ),
    );
 */