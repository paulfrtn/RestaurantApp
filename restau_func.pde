
void load_restaurants(JSONArray restaurants){
  if (restaurants != null) {
    // Initialiser le tableau des restaurants avec la taille du JSON
    restaurants_array = new Restaurant[restaurants.size()];

    for (int i = 0; i < restaurants.size(); i++) {
      JSONObject restaurant = restaurants.getJSONObject(i);
      float id = restaurant.getFloat("id");
      String name = restaurant.getString("name");
      String address = restaurant.getString("address");
      float latitude = restaurant.getFloat("latitude");
      float longitude = restaurant.getFloat("longitude");
      int usersCount = restaurant.getInt("usersCount");
      int priceTier = restaurant.getInt("priceTier");
      float rating = restaurant.getFloat("rating");
      int indoor = restaurant.getInt("indoor");
      restaurants_array[i] = new Restaurant(id, name, address, latitude, longitude, usersCount, priceTier, rating, indoor);
    }
    //for (Restaurant restaurant : restaurants_array) {
    //  restaurant.display(50, 50);
    //}
  } else {
    println("Aucun restaurant trouvé.");
  }
}

void add_restaurant(JSONArray restaurants, JSONArray API_rest) {
  JSONObject newRestaurant = null;
  
  if (restaurants == null) {
    restaurants = new JSONArray();
  }
  
  if (API_rest != null && API_rest.size() > 0) {
    JSONObject firstRestaurant = API_rest.getJSONObject(0);
    float id = firstRestaurant.getFloat("id");
    String name = firstRestaurant.getString("name");
    String address = firstRestaurant.getString("address");
    float latitude = firstRestaurant.getFloat("latitude");
    float longitude = firstRestaurant.getFloat("longitude");
    int usersCount = firstRestaurant.getInt("usersCount");
    int priceTier = firstRestaurant.getInt("priceTier");
    float rating = firstRestaurant.getFloat("rating");
    int indoor = firstRestaurant.getInt("indoor");

    newRestaurant = new JSONObject();
    newRestaurant.setFloat("id", id);
    newRestaurant.setString("name", name);
    newRestaurant.setString("address", address);
    newRestaurant.setFloat("latitude", latitude);
    newRestaurant.setFloat("longitude", longitude);
    newRestaurant.setInt("usersCount", usersCount);
    newRestaurant.setInt("priceTier", priceTier);
    newRestaurant.setFloat("rating", rating);
    newRestaurant.setInt("indoor", indoor);
    
  } else {
    println("Aucun restaurant trouvé dans API_rest.");
  }
  
  if (newRestaurant != null) {
    restaurants.append(newRestaurant);

    saveJSONArray(restaurants, "Json/restaurants.json");

    println("Restaurant ajouté et enregistré : " + newRestaurant.getString("name"));
  }
}
