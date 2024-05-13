void mousePressed()
{
  if(mouseButton == LEFT &&( (mouseX>400 && mouseX <425) && (mouseY>20 && mouseY < 40)) && toggle){
    
    toggle=false;
  }
  if(mouseButton == LEFT &&( (mouseX>425 && mouseX <450) && (mouseY>20 && mouseY < 40)) && !toggle){
   
    toggle=true;
  }
  if (mouseX >= 70 && mouseX <= 100 && mouseY >= 10 && mouseY <= 40 && weatherapp==false) {
    weatherapp = true;
    VIEW_LIST = false;
    CREDITS = false;
    PROFILE = false;
    ADD_REST = false;
    menuOpen = false;
  } else if (mouseX >= 20 && mouseX <= 50 && mouseY >= 10 && mouseY <= 40 && weatherapp==true) {
    weatherapp = false;
    MENU = true;
  }
  if(!logged_in)
  {
    if(mouseButton == LEFT && isMouseOverSignUp()){
      login = true;
    }
    if(mouseButton == LEFT && isMouseOverSignIn())
    {
      login=false;
      creating = true;
      enter_session_pseudo = false;
      enter_session_password = false;
      page=1;
    }
    if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>600 && mouseY<650)))
    {
      creating=false;
      creation=true;
    }
    if(page==0){
      enter_session_pseudo = input_click_page1(100,400,300,330,enter_session_pseudo);
      enter_session_password = input_click_page1(100,400,400,430,enter_session_password);
    }
    if(page==1){
      enter_first_name = input_click_page1(100,400,100,130,enter_first_name);
      enter_last_name = input_click_page1(100,400,150,180,enter_last_name);
      enter_pseudo = input_click_page1(100,400,200,230,enter_pseudo);
      enter_password = input_click_page1(100,400,250,280,enter_password);
      enter_email = input_click_page1(100,400,300,330,enter_email);
      enter_age = input_click_page1(100,400,350,380,enter_age);
      enter_adress = input_click_page1(100,400,400,430,enter_adress);
      enter_phone_num = input_click_page1(100,400,450,480,enter_phone_num); 
      
      if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>500 && mouseY<550))){
        page=2;
        picture_s1=true;
      }
    }
    if(page==2){
      profile_picture();
      if(mouseButton == LEFT && ((mouseX>575 && mouseX<625)&&(mouseY>675 && mouseY<725))){
          picture_s2=true;
          picture_s1=false;
          take_picture=true;
        }
    }
  }
  else
  {
    //Sidebar
    if(mouseX > width/2-30 && mouseX < width/2+30 && mouseY < height && mouseY > height-60  && menuOpen == false)
    {
      animatingMenu = true;
      animationTimer = 0;
      menuOpen = true;
    }
    //Fermer sidebar
    else if(mouseX > width/2-30 && mouseX < width/2+30 && mouseY < height && mouseY > height-60  && menuOpen == true)
    {
      animatingMenu = true;  
      animationTimer = 100; 
      menuOpen = false;
      
    }
    //QUIT
    else if (mouseX > width - 100 && mouseX < width && mouseY > height-60 && mouseY < height && menuOpen == true)
    {
      clickSound.close(); // Unload the sound
      minim.stop(); // Stop Minim
      exit();
    }
    //CREDIT
    else if (mouseX > 30 && mouseX < 100 && mouseY > height-60 && mouseY < height && menuOpen == true)
    {
      menuOpen = false;
      MENU = false;
      CREDITS = true;
    }
    //ADD RESTAURANT
    else if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 250 && mouseY < 310) 
    {
      menuOpen = false;
      MENU = false;
      ADD_REST = true;
    }
    //LIST Of RESTAURANTS
    else if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 350 && mouseY < 410) 
    {
      menuOpen = false;
      MENU = false;
      VIEW_LIST = true;
    }
    //PROFIL
    else if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 450 && mouseY < 510) 
    {
      menuOpen = false;
      MENU = false;
      PROFILE = true;
    }
    //RETURN
    else if (mouseX > 25 && mouseX < 45 && mouseY > height/2-15 && mouseY < height/2+15) 
    {
      if(CREDITS)
      {
        CREDITS = false;
        MENU = true;
      }
      if(PROFILE)
      {
        PROFILE = false;
        MENU = true;
      }
    }
    //HOME
    else if (mouseX > 20 && mouseX < 40 && mouseY > 10 && mouseY < 40) 
    {
      if(ADD_REST)
      {
        ADD_REST = false;
        MENU = true;
      }
      if(VIEW_LIST)
      {
        VIEW_LIST = false;
        MENU = true;
      }
    }
    //FILTER
    if(ADD_REST)
    {
      if(mouseX > 75 && mouseX < 75+150 && mouseY > 120-20 && mouseY < 120+20)
      {
        location = (location < 2) ? location + 1 : 0;
      }
      if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 120-20 && mouseY < 120+20)
      {
        price = (price < 3) ? price + 1 : 0;
      }
      if(mouseX > 75 && mouseX < 75+150 && mouseY > 170-20 && mouseY < 170+20)
      {
        rating = (rating < 5) ? rating + 1 : 0;
      }
      if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 170-20 && mouseY < 170+20)
      {
        origin = (origin < 5) ? origin + 1 : 0;
      }
    }
    clickSound.trigger();
  } 
}

void drawLeftArrow(float arrowSize, float arrowY, float arrowHeadSize, float arrowTailSize) {
  float arrowXEnd = arrowSize;
  float arrowXStart = arrowXEnd + arrowHeadSize;
  
  // Draw the arrow head
  fill(C1);   
  beginShape();
  vertex(arrowXStart, arrowY - arrowHeadSize);
  vertex(arrowXEnd, arrowY);
  vertex(arrowXStart, arrowY + arrowHeadSize);
  endShape(CLOSE);
}
