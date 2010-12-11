Twitter myTwitter;

void setup() {
  
  //setup canvas
  // set the background color
  background(255);
    
  // specify canvas size
  size(300, 300); 
      
  // smooth edges
  smooth();
    
  //some vars
  int good = 0;
  int bad = 0;
  
  myTwitter = new Twitter("danwoods", "pan1cct");
  try {

    Query query = new Query("Watching Beyonce");
    query.setRpp(100);
    QueryResult result = myTwitter.search(query);

    ArrayList tweets = (ArrayList) result.getTweets();

    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      if(msg.matches("(?i).*great.*") || msg.matches("(?i).*amazing.*") || msg.matches("(?i).*incredible.*"))
        good++;
      else if (msg.matches("(?i).*bad.*") || msg.matches("(?i).*horrible.*") || msg.matches("(?i).*a joke.*"))
        bad++;
      println("Tweet by " + user + " at " + d + ": " + msg);
    };
    
    println("Good: " + good + " Bad: " + bad);

  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
    
  };
  
  // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(25);
    
    // set the color
    stroke(255, 0, 0, 175);
    
    // some calculations
    float good_percent = good/100.0;
    float bad_percent = bad/100.0;
    
    float drawing_area = height / .75;
   
    float good_draw = drawing_area * good_percent;
    float bad_draw = drawing_area * bad_percent; 
    
    // draw the line
    line(25, height - 50, 25, height - 50 - good_draw);
    
    // set the color
    stroke(0, 0, 255, 175);
    
    // draw the line
    line(160, height - 50, 160, height - 50 - bad_draw);

  
  //setup text
  PFont font;
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("FFScala", 32);
  textFont(font);
  fill(0, 102, 153);
  text("Twitter", 10, 50);
  
  font = createFont("FFScala", 15);
  textFont(font);
  fill(0, 102, 153);
  text("Percentage of last 100 tweets \nabout \"Watching Beyonce\"", 10, 70);
  
  font = createFont("FFScala", 18);
  textFont(font);
  fill(255, 0, 0);
  
  text("Positive (" + good + "%)", 10, height -20);
  
  fill(0, 102, 153);
  text("Negative (" + bad + "%)", 150, height -20);
};

void draw() {

};

