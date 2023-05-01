class Api {
  static const baseUrl =
      "https://raw.githubusercontent.com/devwraithe/json_host/main";
  static String get hotCoffees => "$baseUrl/hot_coffees.json";
  static String get coldCoffees => "$baseUrl/cold_coffees.json";
  static String get hotTeas => "$baseUrl/hot_teas.json";
  static String get coldTeas => "$baseUrl/cold_teas.json";
}
