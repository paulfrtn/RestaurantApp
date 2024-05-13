boolean LOADING = true;
boolean MENU = true;
boolean menuOpen = false;
boolean VIEW_LIST = false;
boolean CREDITS = false;
boolean PROFILE = false;
boolean ADD_REST = false;
boolean weatherapp = true;
boolean addRestaurantHover = false;
boolean viewListHover = false;
boolean animatingMenu = false;
boolean add_rest = false;
boolean enter_session_pseudo = false;
boolean enter_session_password = false;
boolean logged_in = false;
boolean login =false;
boolean creating=false;
boolean creation=false;
boolean enter_pseudo = false;
boolean enter_password = false;
boolean enter_first_name=false;
boolean enter_last_name=false;
boolean enter_email=false;
boolean enter_age=false;
boolean enter_adress=false;
boolean enter_phone_num=false;
boolean enter_profile_pic=false;
boolean cameraActive = false;
boolean photoTaken = false;
boolean one_use=false;
boolean animatingText = false;
boolean isDay = true;
boolean state = false;
boolean picture_s1=false;
boolean picture_s2=false;
boolean take_picture=false;
boolean toggle=false;

float rect_tog_posX=400;
float rect_tog_posY=20;
float circ_tog_posX=410;
float circ_tog_posY=30;
float buttonWidth1 = 280;
float buttonWidth2 = 280;
float buttonWidth3 = 280;
float buttonHeight1 = 60;
float buttonHeight2 = 60;
float buttonHeight3 = 60;
float enlargedButtonWidth = 300;
float enlargedButtonHeight = 70;
float animationSpeed = 0.5;
float textsize1 = 16;
float textsize2 = 16;
float textsize3 = 16;
float targetFrameRate = 10; 

//FILTRE
int location = 0;
int rating = 0;
int price = 0;
int origin = 0;

int animationTimer = 0;
int animationSpeedRect = 5;
int animatingTextIndex = 0;
int lastFrame = 0;
int page=0;
int age;
int scrollPosition = 0;
int targetScrollPosition = 0;
int contentHeight = 0;

int C3 = #f5e7cc; 
int C2 = #E28413; 
int C1 = #000022;

PImage arrowImage;
PImage capturedImage;
PImage profile_pic;
PImage HomeIn;
PImage HomeOut;
PImage WeatherIn;
PImage WeatherOut;
PImage SunImg;
PImage MoonImg;
PImage CloudImg;
PImage RainImg;
PImage pp_icon;
PImage save_icon;
PImage discard_icon;

JSONArray users;
JSONArray restaurants;
JSONArray API_rest;

String session_pseudo = "";
String session_password = "";
String first_name = "";
String last_name = "";
String email="";
String new_pseudo="";
String new_password="";
String adress = "";
String phone_num="";



Capture video;

Restaurant[] restaurants_array;
Restaurant[] indoor_array;
Restaurant[] outdoor_array;
User[] users_array;
User current_user;
