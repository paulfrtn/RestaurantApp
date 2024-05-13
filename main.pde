import processing.video.*;
import java.io.File;
import ddf.minim.*;
Minim minim;
AudioSample clickSound;

void setup() {
  size(480, 720);
  background(C3);
  users = loadJSONArray("Json/users.json");
  load_users(users);
  File file = new File(sketchPath("Json/restaurants.json"));
  if (file.exists()) {
    restaurants = loadJSONArray("Json/restaurants.json");
    println("Fichier JSON existant chargé : restaurants.json");
  } else {
    restaurants = new JSONArray();
    saveJSONArray(restaurants, "Json/restaurants.json");
    println("Nouveau fichier JSON créé : restaurants.json");
  }
  API_rest = loadJSONArray("Json/API.json");
  minim = new Minim(this);
  clickSound = minim.loadSample("click.wav"); 
  
  HomeIn = loadImage("images/HomeIn.png");
  HomeOut = loadImage("images/HomeOut.png");
  SunImg = loadImage("images/sun.png");
  MoonImg = loadImage("images/moon.png");
  CloudImg = loadImage("images/cloud.png");
  RainImg = loadImage("images/rain.png");
  WeatherIn = loadImage("images/WeatherIn.png");
  WeatherOut = loadImage("images/WeatherOut.png");
  pp_icon=loadImage("images/pp_icon.png");
  save_icon=loadImage("images/save_icon.png");
  discard_icon=loadImage("images/discard_icon.png");
  pp_icon.resize(30,30);
  save_icon.resize(30,30);
  discard_icon.resize(30,30);
}

void draw() {
  if(!logged_in){
    if(page==0){
      background(C3);
      Toggle();
      session();
    }
    if(page==1){
      background(C3);
      Toggle();
      create_user_form(first_name,last_name, new_pseudo,new_password,email,age,adress,phone_num,profile_pic);
    }
    if(page==2){
      picture_s1=true;
      if (photoTaken) {
        background(C3);
        image(capturedImage, 0, 0);
        textSize(32);
        fill(0);
        text("Press 'Y' to save or 'N' to discard", 50, 50);
        if(take_picture){
          fill(255);
          drawButtons();
        }
      } 
      else if (cameraActive && video.available()) {
        video.read();
        image(video, 0, 0);
        fill(255);
        noStroke();
        if(!take_picture){
          drawCameraButton();
        }
      }
    }
  }
  if(logged_in)
  {
    load_restaurants(restaurants);
    if (weatherapp) {
      weather();
      
    }else {
      menu();
    }
  } 
}

void keyPressed() {
  if (!logged_in) {
    session_pseudo = input_edit(session_pseudo, enter_session_pseudo);
    session_password = input_edit(session_password,enter_session_password);
    first_name = input_edit(first_name, enter_first_name);
    last_name = input_edit(last_name, enter_last_name);
    new_pseudo = input_edit(new_pseudo, enter_pseudo);
    new_password = input_edit(new_password, enter_password);
    email=input_edit(email,enter_email);
    age = input_edit_4int(age,enter_age);
    adress = input_edit(adress,enter_adress);
    phone_num = input_edit(phone_num,enter_phone_num);
  }
}

void drawButtons() {
  rect(120,175,50,50,20);
  rect(600,675,50,50,20);
}

void drawCameraButton() {
  
  rect(575,675,50,50,20);
  image(pp_icon,585,685);
}


void Toggle(){
  
   
  if(!toggle){
    circ_tog_posX = lerp(circ_tog_posX,410,0.1);
    C1 = lerpColor(C1,#000022,0.1);
    C3 = lerpColor(C3,#f5e7cc,0.1);
    fill(C1);
    rect(rect_tog_posX,rect_tog_posY,50,20,200);
    fill(C3);
    ellipse(circ_tog_posX,circ_tog_posY,15,15);
  }
  if(toggle){
    circ_tog_posX = lerp(circ_tog_posX,440,0.1);
    C1 = lerpColor(C1,#f5e7cc,0.1);
    C3 = lerpColor(C3,#000022,0.1);
    fill(C1);
    rect(rect_tog_posX,rect_tog_posY,50,20,200);
    fill(C3);
    ellipse(circ_tog_posX,circ_tog_posY,15,15);
  }
}
