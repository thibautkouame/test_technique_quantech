class ApiConfig {
  static const String baseUrl = 'https://dummyjson.com/';

  // Les suffixes de l'url de base
  static String getUrl(String endpoint) {
    return baseUrl + endpoint;
  }
}
