import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/model/movie.dart';
import 'package:flutter_gsg_01/assignment/screen/favorite_screen.dart';
import 'package:flutter_gsg_01/assignment/screen/home_screen.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _toggleMovies(Movie movie) {
    var index = movies.indexOf(movie);
    movies[index].isFavorite = !movies[index].isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Movie App',
              style: TextStyle(
                fontFamily: 'Aref Ruqaa',
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Favorite',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomeScreen(
              toggleMovies: _toggleMovies,
            ),
            FavoriteScreen(
              toggleMovies: _toggleMovies,
            ),
          ]),
        ));
  }
}
