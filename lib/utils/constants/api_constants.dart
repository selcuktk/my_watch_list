const String baseUrl = 'https://api.themoviedb.org/3';
const String baseUrlImages =
    'https://image.tmdb.org/t/p/w400'; // w400 actually refers to size of the image
const String apiKey = 'efe0aa3ede39d4395464542f92fef606';
const Map<String, String> movieEndpointMap = {
  'Now Playing': '/movie/now_playing',
  'Popular': '/movie/popular',
  'Top Rated': '/movie/top_rated',
  'Upcoming': '/movie/upcoming'
};
const Map<String, String> seriesEndpointMap = {
  'Airing Today': '/tv/airing_today',
  'On The Air': '/tv/on_the_air',
  'Popular': '/tv/popular',
  'Top Rated': '/tv/top_rated'
};