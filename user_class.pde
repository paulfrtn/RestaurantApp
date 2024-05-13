class User {
  int user_id;
  String first_name;
  String last_name;
  String email;
  String pseudo;
  String password;
  int age;
  String address;
  String phone_num;
  PImage profile_pic;
  
  User(int user_id, String first_name, String last_name, String email,String pseudo, String password ,int age, String address, String phone_num) {
    this.user_id = user_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.pseudo=pseudo;
    this.password=password;
    this.age = age;
    this.address = address;
    this.phone_num = phone_num;
    this.profile_pic = loadImage("images/default_pp.png");
    profile_pic.resize(100,100);
  }
  void display(){
    textSize(22);
    fill(C1);
    text("first name:"+first_name,width/2, height/2);
    text("last name :"+last_name,width/2, height/2+50);
    text("age :"+age,width/2, height/2+100);
    PGraphics mask = createGraphics(100, 100);
    mask.beginDraw();
    mask.background(0);
    mask.ellipse(50, 50, 100, 100);
    mask.endDraw();
  
    // Apply mask
    profile_pic.mask(mask);
  
    // Draw the profile picture
    image(profile_pic, width/2-50, height/2-150);
    }
}
