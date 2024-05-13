void filtre()
{
  background(C3);
  image(HomeOut, 20, 10, 30, 30);
  image(WeatherOut, 70, 10, 30, 30);
  //DESIGN
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(C1);
  text("FILTER", width/2, 50);
  
  if(mouseX > 75 && mouseX < 75+150 && mouseY > 120-20 && mouseY < 120+20 || location != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(150, 120, 150, 40, 10);
  if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 120-20 && mouseY < 120+20 || price != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(width-150, 120, 150, 40, 10);
  if(mouseX > 75 && mouseX < 75+150 && mouseY > 170-20 && mouseY < 170+20 || rating != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(150, 170, 150, 40, 10);
  if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 170-20 && mouseY < 170+20 || origin != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(width-150, 170, 150, 40, 10);
  
  textSize(textsize1);
  fill(C3);
  //LOCATION
  if(location == 0)
  {
    text("LOCATION", 150, 120);
  }
  else if(location == 1)
  {
    text("INDOOR", 150, 120);
  }
  else
  {
    text("OUTDOOR", 150, 120);
  }
  //PRICE
  if(price == 0)
  {
    text("PRICE TIER", width-150, 120);
  }
  else if(price == 1)
  {
    text("$", width-150, 120);
  }
  else if(price == 2)
  {
    text("$$", width-150, 120);
  }
  else
  {
    text("$$$", width-150, 120);
  }
  //RATING
  if(rating == 0)
  {
    text("RATING", 150, 170);     
  }
  else if(rating == 1)
  {
    text("*", 150, 170);
  }
  else if(rating == 2)
  {
    text("**", 150, 170);
  }
  else if (rating == 3)
  {
    text("***", 150, 170);
  }
  else if (rating == 4)
  {
    text("****", 150, 170);
  }
  else if (rating == 5)
  {
    text("*****", 150, 170);
  }
  //ORIGIN
  if(origin == 0)
  {
    text("ORIGIN", width-150, 170);
  }
  else if(origin == 1)
  {
    text("KOREAN", width-150, 170);
  }
  else if(origin == 2)
  {
    text("ITALIAN", width-150, 170);
  }
  else if (origin == 3)
  {
    text("FRENCH", width-150, 170);
  }
  else if (origin == 4)
  {
    text("CHINESE", width-150, 170);
  }
  else if (origin == 5)
  {
    text("MEXICAN", width-150, 170);
  }
  
  stroke(C1);
  line(30, 225, width-30, 225);
  
  //CONDITIONS AND LIST  
    
  //LOCATION
  if(location != 0)
  {
    rectMode(CORNER);
    int numRestaurantsToDisplay = 0;
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
    if(location == 1)
    {
      numRestaurantsToDisplay = countOutdoorRestaurants();
      clip(20, 260, 440, 445);
      translate(0, -scrollPosition);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      for (int i = 0; i < outdoor_array.length; i++) {
          fill(C3);
          rect(30, 260 + i*90, 420, 80, 20);
          fill(C1);
          text(outdoor_array[i].name+"\n"+outdoor_array[i].rating+"\n"+outdoor_array[i].address, width/2, 260 + i*90+30);
      }
      scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.5));
      noClip();
    }
    else if (location == 2)
    {
      numRestaurantsToDisplay = countIndoorRestaurants();
      clip(20, 260, 440, 445);
      translate(0, -scrollPosition);
      fill(255);
      textSize(16);
      textAlign(CENTER);
      for (int i = 0; i < indoor_array.length; i++) {
          fill(C3);
          rect(30,260 + i*90, 420, 80, 20);
          fill(C1);
          text(indoor_array[i].name+"\n"+indoor_array[i].rating+"\n"+indoor_array[i].address, width/2, 260 + i*90+30);
      }
      scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.5));
      noClip();
    }

    contentHeight = numRestaurantsToDisplay * 90;
    rectMode(CENTER);
  }
}        
