float rectWidth = 100;
float rectHeight = 40;
float posX = 200;
float posY = 500;
float rectWidth2 = 100;
float rectHeight2 = 40;
float posX2 = 200;
float posY2 = 600;
color normalColor = C1;
color hoverColor = C3;

void load_users(JSONArray users) {
  if (users != null) {
    users_array = new User[users.size()];

    for (int i = 0; i < users.size(); i++) {
      JSONObject userJSON = users.getJSONObject(i);
      int user_id = userJSON.getInt("user_id");
      String first_name = userJSON.getString("first_name");
      String last_name = userJSON.getString("last_name");
      String email = userJSON.getString("email");
      String pseudo = userJSON.getString("pseudo");
      String password = userJSON.getString("password");
      int age = userJSON.getInt("age");
      String address = userJSON.getString("address");
      String phone_num = userJSON.getString("phone_num");

      users_array[i] = new User(user_id, first_name, last_name, email, pseudo, password, age, address, phone_num);
    }
  } else {
    println("Aucun utilisateur trouvé.");
  }
}

void connexion_form(String pseudo, String password) {
  textSize(20);
  fill(C1);
  text("Connexion", 200, 250);
  stroke(255);
  strokeWeight(1);

  input_click_activity(100, 300, 300, 30, pseudo, enter_session_pseudo, "Enter your pseudo");
  input_click_activity(100, 400, 300, 30, password, enter_session_password, "Enter your password");

  if (isMouseOverSignUp()) {
    rectWidth = lerp(rectWidth, 110, 0.2);
    rectHeight = lerp(rectHeight, 50, 0.2);
    posX = lerp(posX, 195, 0.2);
    posY = lerp(posY, 495, 0.2);
    fill(hoverColor);
    stroke(normalColor);
    strokeWeight(2);
    rect(posX, posY, rectWidth, rectHeight,10);
    fill(normalColor);
    text("Sign up", 225, 525);
  } else {
    rectWidth = lerp(rectWidth, 100, 0.2);
    rectHeight = lerp(rectHeight, 40, 0.2);
    posX = lerp(posX, 200, 0.2);
    posY = lerp(posY, 500, 0.2);
    fill(normalColor);
    stroke(hoverColor);
    rect(posX, posY, rectWidth, rectHeight,10);
    fill(hoverColor);
    text("Sign up", 225, 525);
  }

  noStroke();
}

boolean isMouseOverSignUp() {
  return mouseX > 200 && mouseX < 200 + rectWidth && mouseY > 500 && mouseY < 500 + rectHeight;
}
boolean isMouseOverSignIn() {
  return mouseX > 200 && mouseX < 200 + rectWidth && mouseY > 550 && mouseY < 550 + rectHeight;
}

void session() {
  if (!logged_in) {
    fill(C1);
    
    if (isMouseOverSignIn()) {
    rectWidth2 = lerp(rectWidth2, 110, 0.2);
    rectHeight2 = lerp(rectHeight2, 50, 0.2);
    posX2 = lerp(posX2, 195, 0.2);
    posY2 = lerp(posY2, 545, 0.2);
    fill(hoverColor);
    stroke(normalColor);
    strokeWeight(2);
    rect(posX2, posY2, rectWidth2, rectHeight2,10);
    fill(normalColor);
    text("Sign in", 225, 575);
  } else {
    rectWidth2 = lerp(rectWidth2, 100, 0.2);
    rectHeight2 = lerp(rectHeight2, 40, 0.2);
    posX2 = lerp(posX2, 200, 0.2);
    posY2 = lerp(posY2, 550, 0.2);
    fill(normalColor);
    stroke(hoverColor);
    rect(posX2, posY2, rectWidth2, rectHeight2,10);
    fill(hoverColor);
    text("Sign in", 225, 575);
  }
    
    
    
    connexion_form(session_pseudo, session_password);
  } else {
    current_user.display();
  }
  if (login) {
    for (int i = 0; i < users_array.length; i++) {
      if (session_pseudo.equals(users_array[i].pseudo)) {
        if (session_password.equals(users_array[i].password)) {
          current_user = new User(users_array[i].user_id, users_array[i].first_name, users_array[i].last_name, users_array[i].email, users_array[i].pseudo, users_array[i].password, users_array[i].age, users_array[i].address, users_array[i].phone_num);
          logged_in = true;
        }
      }
    }
    login = false;
    
  }
}

void create_user_form(String firstname, String lastname, String Pseudo, String PassWord, String mail, int age, String Adress, String phone_number, PImage profile_pic) {
  textSize(20);
  fill(C1);
  noFill();
  stroke(C1);
  strokeWeight(1);

  if (creating) {

    input_click_activity(100, 100, 300, 30, firstname, enter_first_name, "Enter your first name");
    input_click_activity(100, 150, 300, 30, lastname, enter_last_name, "Enter your last name");
    input_click_activity(100, 200, 300, 30, Pseudo, enter_pseudo, "Enter your pseudo");
    input_click_activity(100, 250, 300, 30, PassWord, enter_password, "Enter your password");
    input_click_activity(100, 300, 300, 30, mail, enter_email, "Enter your email");
    input_click_activity_4int(100, 350, 300, 30, age, enter_age, "Enter your age");
    input_click_activity(100, 400, 300, 30, Adress, enter_adress, "Enter your home adress");
    input_click_activity(100, 450, 300, 30, phone_num, enter_phone_num, "Enter your phone number");


    fill(C1);
    rect(100, 500, 300, 50);
    fill(C3);
    text("Take a profile picture", 170, 530);
    profile_pic = loadImage("images/default_pp.png");

    fill(C1);
    rect(100, 600, 300, 50);
    fill(C3);
    text("Create your account", 170, 630);
  }

  if (creation) {
    JSONObject newUserJSON = new JSONObject();
    newUserJSON.setInt("user_id", generate_user_id());
    newUserJSON.setString("first_name", first_name);
    newUserJSON.setString("last_name", last_name);
    newUserJSON.setString("pseudo", new_pseudo);
    newUserJSON.setString("password", new_password);
    newUserJSON.setInt("age", age);
    newUserJSON.setString("email", email);
    newUserJSON.setString("address", adress);
    newUserJSON.setString("phone_num", phone_num);
    newUserJSON.setString("profile_pic", "Json/default_pp.jpg");

    users.setJSONObject(users.size(), newUserJSON);
    saveJSONArray(users, "Json/users.json");
    load_users(users);
    page = 0;
    creation = false;
  }
}

int generate_user_id() {
  String[] numbers = loadStrings("Json/id.txt");
  int number = 0;
  if (numbers.length > 0) {
    number = int(numbers[0]);
  }
  number++;

  String[] updatedNumber = {str(number)};
  saveStrings("Json/id.txt", updatedNumber);

  return number;
}

String input_edit(String string, boolean bool) {
  if (bool) {
    if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z' || key == ' ') {
      string += key;
    } else if (key == BACKSPACE && string.length() > 0) {
      string = string.substring(0, string.length() - 1);
    }
  }
  return string;
}

int input_edit_4int(int number, boolean bool) {
  if (bool) {
    if (key >= '0' && key <= '9') {
      number = number * 10 + (key - '0');
    } else if (key == BACKSPACE && number > 0) {
      number = number / 10;
    }
  }
  return number;
}

boolean input_click_page1(int x_inf, int x_sup, int y_inf, int y_sup, boolean bool) {
  if (mouseButton == LEFT && ((mouseX > x_inf && mouseX < x_sup) && (mouseY > y_inf && mouseY < y_sup))) {
    enter_session_pseudo = false;
    enter_session_password = false;
    enter_password = false;
    enter_email = false;
    enter_profile_pic = false;
    enter_first_name = false;
    enter_last_name = false;
    enter_pseudo = false;
    enter_age = false;
    enter_adress = false;
    enter_phone_num = false;
    bool = true;
  }
  return bool;
}

void input_click_activity(int x, int y, int l, int L, String string, boolean bool, String name) {
  stroke(C1);
  if (!bool && string.length() == 0) {
    noFill();
    rect(x, y, l, L,10);
    textSize(16);
    fill(C1);
    text(name, x + 10, y + 20);
  }
  else {
    if (!bool && string.length() > 0) {
      noFill();
      rect(x, y, l, L,10);
      textSize(16);
      fill(C1);
      text(string, x + 10, y + 20);
      if(session_password.length() >0){
        fill(C3);
        rect(100, 400, 300, 30,10);
      }
    }
    if (bool) {
      fill(C2);
      rect(x, y, l, L,10);
      textSize(16);
      fill(C3);
      text(string, x + 10, y + 20);
    }
  }
  if (enter_session_password && page==0) {
    fill(C2);
    rect(100, 400, 300, 30,10);
    textSize(16);
    fill(C3);
    for (int i = 0; i < string.length(); i++) {
       text("*", 110 + i * 10, 425);
      }
    } 
  else if (!enter_session_password && session_password.length() > 0 && page==0) {
    noFill();
    rect(100, 400, 300, 30,10);
    textSize(16);
    rect(100, 400, 300, 30,10);
    fill(C1);
    for (int i = 0; i < session_password.length() ; i++) {
      text("*", 110 + i * 10, 425);
    }
  } 
}

void input_click_activity_4int(int x, int y, int l, int L, int number, boolean bool, String name) {
  if (!bool && number == 0) {
    noFill();
    rect(x, y, l, L,10);
    textSize(16);
    fill(C3);
    text(name, x + 10, y + 20);
  }
  if (!bool && number > 0) {
    noFill();
    rect(x, y, l, L,10);
    textSize(16);
    fill(C3);
    text(number, x + 10, y + 20);
  }
  if (bool) {
    fill(C2);
    rect(x, y, l, L,10);
    textSize(16);
    fill(C3);
    text(number, x + 10, y + 20);
  }
}


void profile_picture(){
  if (picture_s1) {
    page=2;
    if(!one_use){
       background(#2a9d8f);
       one_use=true;
    }
    windowResize(1200,800);
    width=1200;
    height=800;
    if (!cameraActive && !photoTaken) {
      video = new Capture(this, width, height);
      video.start();
      cameraActive = true;
    } else if (photoTaken) {
      capturedImage = null; 
      photoTaken = false;
      cameraActive = true;
    } else {
      video.stop();
      video.dispose();
      cameraActive = false;
    }
  }
  if (picture_s2) {
    if (cameraActive) {
      saveFrame("images/pp/photo.png");
      capturedImage = loadImage("images/pp/photo.png");
      photoTaken = true;
      video.stop();
      video.dispose();
      cameraActive = false;
      picture_s2=false;
    }
  }
  if (photoTaken) {
    if (key == 'y' || key == 'Y') {
      println("Photo saved as photo.png");
      photoTaken = false;
      capturedImage = null;
      cameraActive = true;
      background(255);
      video = new Capture(this, width, height);
      video.start();
    } else if (key == 'n' || key == 'N') {
      File fileToDelete = new File(sketchPath("images/pp/photo.png"));
      fileToDelete.delete();
      capturedImage = null;
      photoTaken = false;
      cameraActive = true;
      background(255);
      video = new Capture(this, width, height);
      video.start();
    }
  }
}
