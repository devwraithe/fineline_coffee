class Api {
  static const baseUrl =
      "https://raw.githubusercontent.com/devwraithe/json_host/main";
  static String get fetchDrinks => "$baseUrl/coffees.json";
}
