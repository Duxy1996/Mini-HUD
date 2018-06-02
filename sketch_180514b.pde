void setup()
{
  size(400,500);
  background(126,192,238);  
}

void draw()
{
  background(126,192,238);
  stroke(0);
  float[] formatedPoints = reciver(90, mouseX-width/2);    
  line(0,formatedPoints[2]+mouseY-height/2,width,formatedPoints[1]+mouseY-height/2);   
  
  loadPixels();   
  boolean thereIsBlack = false;    
  if(formatedPoints[2] > formatedPoints[1]) {
    for (int x = 0; x < width; x++) {  
      if(red(pixels[x]) < 100) {
        thereIsBlack = true;
      }
      if(thereIsBlack) {
        pixels[x] = color(0,0,0);
      }        
    }
  } else {
    for (int x = (width-1); x >= 0; x--) {  
      if(red(pixels[x]) < 100) {
        thereIsBlack = true;
      }
      if(thereIsBlack) {
        pixels[x] = color(0,0,0);
      }        
    }
  }
  updatePixels(); 
  paintRestOfPixels(); 
  for (int i = 0; i <= 9; i++) {   
    pushMatrix();
    translate(width/2,(formatedPoints[2]+mouseY-height/2 + formatedPoints[1]+mouseY-height/2)/2);
    rotate(radians(-(mouseX-width/2))/2);    
    text(""+i*10, 0,-i*width*0.13);
    popMatrix();
  }
  for (int i = 1; i <= 9; i++) {  
    pushMatrix();
    translate(width/2,(formatedPoints[2]+mouseY-height/2 + formatedPoints[1]+mouseY-height/2)/2);
    rotate(radians(-(mouseX-width/2))/2);
    text(""+i*-10, 0,+i*width*0.13);
    popMatrix();
  }
}

float[] reciver(float pitch, float roll)
{
  float halfAngle = roll/2;
  float distanceYRight = tan(radians(halfAngle))*(width/2);
  float[] formatedPoints = new float[3];
  formatedPoints[0] = map(pitch,0,90,0,height);
  formatedPoints[1] = height/2-distanceYRight;
  formatedPoints[2] = height/2+distanceYRight;
  return formatedPoints;
}

void paintRestOfPixels() 
{
  boolean thereIsBlack = false;
  loadPixels();   
  for (int x = 0; x < width; x++)
  {  
    thereIsBlack = false;
    for (int y = 0; y < height; y++)
    {      
      int loc = x + y * width;      
        if(red(pixels[loc]) < 100) 
        {
          thereIsBlack = true;
        }
        if(thereIsBlack) 
        {
          pixels[loc] = color(222,184,135);
        }              
    }
  }
  updatePixels(); 
}