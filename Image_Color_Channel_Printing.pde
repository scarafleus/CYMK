PImage img;
  
void setup()
{
  size(1920, 1573);
  img = loadImage("sources/img_but.jpg");
  
  loadPixels();
  for (int i = 0; i < width*height; i++)
  {    
    color col = img.pixels[i];
    
    float r = red(col) / 255.0;
    float g = green(col) / 255.0;
    float b = blue(col) / 255.0;
    
    float k = 1 - max(max(r, g), b);
    float c = (1 - r - k) / (1 - k);
    float m = (1 - g - k) / (1 - k);
    float y = (1 - b - k) / (1 - k);
    
    // Inverted CYMK
    //c = 1-c;
    //y = 1-y;
    //m = 1-m;
    //k = 1-k;
    // K^2
    //k *= k;
    // Rotated Channels
    //float t = c;
    //c = k;
    //k = y;
    //y = t;
    // Intense k
    //k = 1 - (1-k)*(1-k);
    // Really intense k
    //k = 1 - (1-k)*(1-k);
    //k *= k;
    //k = 1 - (1-k)*(1-k);
    //k *= k;
    //k = 1 - (1-k)*(1-k);
    //k *= k;
    // Sin Frequency
    //float freq = 0.5;
    //k = abs(sin(freq*TWO_PI * k));
    //c = abs(sin(freq*TWO_PI * c));
    //y = abs(sin(freq*TWO_PI * y));
    //m = abs(sin(freq*TWO_PI * m));
    // Isolate channels
    c = 0;
    y = 0;
    m = 0;
    
    float rn = 255 * (1 - c) * (1 - k);
    float gn = 255 * (1 - m) * (1 - k);
    float bn = 255 * (1 - y) * (1 - k);
    
    pixels[i] = color(rn, gn, bn);
  }
  updatePixels();
}

void draw() {}

void keyPressed()
{
  saveFrame("results/key.png");
}
