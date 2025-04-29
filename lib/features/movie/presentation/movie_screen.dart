import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/app_global_function.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/custom_colors.dart';
import '../data/movie_provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
      late MovieProvider movieProvider ;

@override
  void initState() {
        movieProvider= Provider.of<MovieProvider>(context, listen: false);

    init();
    super.initState();
  }

    init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      movieProvider.fetchPopularMovies();
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: Consumer<MovieProvider>(builder: (context, movieListenableProvider, _) {
          return movieListenableProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : movieListenableProvider.movies.isEmpty
                  ? Center(
                      child: Text(
                        'No movies found.',
                        style: theme.textTheme.headline2,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: movieListenableProvider.movies.length,
                      itemBuilder: (context, index) {
                        final movie = movieListenableProvider.movies[index];
          
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: theme.colorScheme.background.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                // Background Poster with Blur
                                CachedNetworkImage(
                                  imageUrl:AppGlobalFunction.getPosterUrl (movie.posterPath),
                                  width: double.infinity,
                                  height: 220,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(child: CircularProgressIndicator()),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(child: Icon(Icons.broken_image, size: 50)),
                                  ),
                                ),
                                // Blur & Overlay Gradient
                                Positioned.fill(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.6),
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.7),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Movie Info
                                Positioned(
                                  left: 16,
                                  right: 16,
                                  bottom: 16,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title ?? 'Untitled',
                                        style: theme.textTheme.headline2?.copyWith(
                                          color: Colors.white,
                                          shadows: const [
                                            Shadow(color: Colors.black54, blurRadius: 2),
                                          ],
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        movie.overview ?? 'No description available.',
                                        style: theme.textTheme.bodyText1?.copyWith(
                                          color: Colors.white70,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.star, color: Colors.amber, size: 18),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${movie.voteAverage?.toStringAsFixed(1) ?? '--'}/10',
                                                style: theme.textTheme.subtitle1?.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            movie.releaseDate ?? '',
                                            style: theme.textTheme.subtitle1?.copyWith(
                                              fontSize: 12,
                                              color: CustomColors.accentColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
        }
      ),
    );
  }
}
