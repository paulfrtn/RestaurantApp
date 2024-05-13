String API_KEY = "335d9a876c4ea4aa36a9f76c987fae73";
String city = "Suwon";
String Wurl = "http://api.openweathermap.org/data/2.5/weather?q=" + city + ",kr&units=metric&cnt=7&lang=kr_kr&appid=" + API_KEY;
boolean one_call=false;
JSONObject json;

void weather() {
  if(!one_call){
    json = loadJSONObject(Wurl);
    one_call=true;
  }
  rectMode(CORNER);
  background(C3);
  Toggle();
  int temperature = (int)json.getJSONObject("main").getFloat("temp");
  String weatherDescription = json.getJSONArray("weather").getJSONObject(0).getString("main");
  int currentHour = hour();
  int numRestaurantsToDisplay = 0;
  //weatherDescription = "Rain";
  //weatherDescription = "Clouds";
  //weatherDescription = "Clear";
  //currentHour = 20;
  //currentHour = 10;

  if (currentHour >= 6 && currentHour < 18) {
    isDay = true;
  } else {
    isDay = false;
  }
  
  indoor_array = new Restaurant[countIndoorRestaurants()];
  outdoor_array = new Restaurant[countOutdoorRestaurants()];
  
  int indoorIndex = 0;
  int outdoorIndex = 0;

  for (int i = 0; i < restaurants_array.length; i++) {
    if (restaurants_array[i].indoor == 0) {
      outdoor_array[outdoorIndex] = restaurants_array[i];
      outdoorIndex++;
    } else {
      indoor_array[indoorIndex] = restaurants_array[i];
      indoorIndex++;
    }
  }

  if (isDay) {
    if (weatherDescription.equals("Clear")){
      fill(135, 206, 235);
      noStroke();
      rect(20, 50, 440, 220, 20);
    }
    else {
      fill(200);
      noStroke();
      rect(20, 50, 440, 220, 20);
    }
  } else {
    if (weatherDescription.equals("Clear")){
      fill(0, 0, 30);
      noStroke();
      rect(20, 50, 440, 220, 20);
    }
    else {
      fill(50);
      noStroke();
      rect(20, 50, 440, 220, 20);
    }
  }
  
  if (isDay) {
    if (weatherDescription.equals("Clear")) {
      image(SunImg, width / 2 - 30, height / 4 - 140, 250, 250);
    } else if (weatherDescription.equals("Clouds")){
      image(CloudImg, width / 2 - 40, height / 4 - 80, 250, 125);
    } else if (weatherDescription.equals("Rain")){
      image(RainImg, 20, 50, 440, 220);
      image(CloudImg, width / 2 - 40, height / 4 - 80, 250, 125);
    }
  } else {
    if (weatherDescription.equals("Clear")) {
      image(MoonImg, width / 2, height / 4 - 100, 150, 150);
    } else if (weatherDescription.equals("Clouds")){
      image(CloudImg, width / 2 - 40, height / 4 - 80, 250, 125);
    } else if (weatherDescription.equals("Rain")){
      image(RainImg, 20, 50, 440, 220);
      image(CloudImg, width / 2 - 40, height / 4 - 80, 250, 125);
    }
  }
  noStroke();
  if(isDay){
    if(weatherDescription.equals("Clear")){
      fill(105, 156, 235);
    }else{
      fill(170);
    }
  }else{
    if(weatherDescription.equals("Clear")){
      fill(0, 0, 80);
    }else{
      fill(100);
    }
  }
  fill(C1);
  stroke(C1);
  strokeWeight(2);
  rect(20, 300, 440, 80, 20);
  rect(20, 390, 440, 310, 20);
  noStroke();
  textSize(48);
  textAlign(CENTER);
  if(!isDay){
    fill(C3);
  }
  if(toggle){
    fill(C1);
  }
  if(!toggle){
    fill(C3);
  }
  text(city, width/4, 100);
  textSize(100);
  text(temperature, width / 4, height / 4 + 20);
  textSize(20);
  text(weatherDescription, width/4, height / 2 - 120);
  image(HomeOut, 20, 10, 30, 30);
  image(WeatherIn, 70, 10, 30, 30);
  if(weatherDescription.equals("Clear")){
    fill(C3);
    textSize(24);
    text("WOOOW, the weather looks great\ntoday! How about eating outside?", width/2, 330);
    text("Here is the list of your favourite\nrestaurants that offer outside service : ", width/2, 420);
    numRestaurantsToDisplay = countOutdoorRestaurants();
    clip(20, 465, 440, 235);
    translate(0, -scrollPosition);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    for (int i = 0; i < outdoor_array.length; i++) {
        fill(C3);
        rect(30, 465+ i*90, 420, 80, 20);
        fill(C1);
        text(outdoor_array[i].name+"\n"+outdoor_array[i].rating+"\n"+outdoor_array[i].address, 230, 495+i*90);
    }
    scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.5));
    noClip();
  }else{
    fill(C3);
    textSize(24);
    text("OUCH, the weather doesn't look great\ntoday! How about eating inside?", width/2, 330);
    text("Here is the list of your favourite\nrestaurants that offer inside service : ", width/2, 420);
    numRestaurantsToDisplay = countIndoorRestaurants();
    clip(20, 465, 440, 235);
    translate(0, -scrollPosition);
    textSize(16);
    textAlign(CENTER);
    for (int i = 0; i < indoor_array.length; i++) {
        fill(C3);
        rect(30, 465+ i*90, 420, 80, 20);
        fill(C1);
        text(indoor_array[i].name+"\n"+indoor_array[i].rating+"\n"+indoor_array[i].address, 230, 495+i*90);
    }
    scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.5));
    noClip();
  }
  contentHeight = numRestaurantsToDisplay * 90;
  
  rectMode(CENTER);
}

void mouseWheel(MouseEvent event) {
  targetScrollPosition += event.getCount() * 10;
  targetScrollPosition = constrain(targetScrollPosition, 0, contentHeight - 235);
}

int countOutdoorRestaurants() {
  int count = 0;
  for (int i = 0; i < restaurants_array.length; i++) {
    if (restaurants_array[i].indoor == 0) {
      count++;
    }
  }
  return count;
}

int countIndoorRestaurants() {
  int count = 0;
  for (int i = 0; i < restaurants_array.length; i++) {
    if (restaurants_array[i].indoor == 1) {
      count++;
    }
  }
  return count;
}
