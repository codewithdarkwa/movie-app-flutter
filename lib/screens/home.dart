import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';

import '../model/movie_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("Show Spot"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming',
                style: TextStyle(color: Colors.white),
              ),
              //Carousel
              FutureBuilder(
                future: upcomingMovies,
                builder: (context, snaphot) {
                  if (!snaphot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snaphot.data!;

                  return CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index, movieIndex) {
                      final movie = movies[index];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.4,
                        autoPlayInterval: const Duration(seconds: 3)),
                  );
                },
              ),

              //Popular Movies
              const Text(
                'Popular',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const Text(
                'Top Rated',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return Container(
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
