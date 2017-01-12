Bacteria[] bacteriaArray; // Create a bacteria array to store the bacteria objects.
BacteriaOdd[] oddBacteriaArray;
boolean startGame; // Create a boolean value to determine when to exit the title screen and begin the game.
 void setup()   
 {     
   size(500, 500); // Initialize vairables.
   bacteriaArray = new Bacteria[1000];
   oddBacteriaArray = new BacteriaOdd[1000];
   startGame = false;
   
   for (int i = 0; i < bacteriaArray.length; i++) { // Fill the bacteria array with new objects.
     bacteriaArray[i] = new Bacteria();
   }
   
   for (int i = 0; i < oddBacteriaArray.length; i++) { // Fill the bacteria array with new objects.
     oddBacteriaArray[i] = new BacteriaOdd();
   }
 }   
 
 void draw()   
 {    
   background(180, 180, 180); // Set the background.
   if (startGame) { // Condition to check if title screen is exited.
     for (Bacteria bacteria : bacteriaArray) { // Move and show every bacteria.
       bacteria.move();
       bacteria.show();
     }
     
     for (BacteriaOdd oddBacteria : oddBacteriaArray) { // Move and show every bacteria.
       oddBacteria.move();
       oddBacteria.show();
     }
   } else { // Create the title screen.
     fill(255);
     textAlign(CENTER);
     textSize(25);
     text("Click the mouse to start.", 250, 225);
     text("Move the mouse to attract bacteria.", 250, 250);
     text("Click to drive them away!", 250, 275);
     
     if (mousePressed == true) startGame = true; // Exit the title screen upon mouse press.
   }
 }
 
 class Bacteria // Create a Bacteria class to control move and show methods.
 {     
   int bacteriaX; // Create x and y values.
   int bacteriaY;
   
   Bacteria() { // Randomly instantiate the x and y values upon construction.
     bacteriaX = (int) (Math.random() * 501);
     bacteriaY = (int) (Math.random() * 501);
   }
   
   void show() {
     fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256)); // Random color.
     ellipse(bacteriaX, bacteriaY, 10, 10); // Draw the bacteria.
   }
   
   void move() {
     bacteriaX = bacteriaX + ((int) (Math.random() * 21) - 10); // Randomly move the bacteria every loop.
     bacteriaY = bacteriaY + ((int) (Math.random() * 21) - 10);
     if (mouseX > bacteriaX) { // Conditions to check the x-location of the bacteria in relation to the mouse. Move the bacteria accordingly.
       bacteriaX = bacteriaX + (int) (Math.random() * 10);
     } else if (mouseX < bacteriaX) {
       bacteriaX = bacteriaX - (int) (Math.random() * 10);
     } else {
       bacteriaX = bacteriaX + ((int) (Math.random() * 17) - 8);
     }
     
     if (mouseY > bacteriaY) { // Conditions to check the y-location of the bacteria in relation to the mouse. Move the bacteria accordingly.
       bacteriaY = bacteriaY + (int) (Math.random() * 10);
     } else if (mouseY < bacteriaY) {
       bacteriaY = bacteriaY - (int) (Math.random() * 10);
     } else {
       bacteriaY = bacteriaY + ((int) (Math.random() * 17) - 8);
     }
     
     if (mousePressed) { // If mouse is pressed, randomly disperse the bacteria. (Explosion effect).
       bacteriaX = bacteriaX + ((int) (Math.random() * 201) - 100);
       bacteriaY = bacteriaY + ((int) (Math.random() * 201) - 100);
     }
   }
 }
 
 class BacteriaOdd // Create a new Bacteria class to control move and show methods.
 {     
   int bacteriaX; // Create x and y values.
   int bacteriaY;
   
   BacteriaOdd() { // Randomly instantiate the x and y values upon construction.
     bacteriaX = (int) (Math.random() * 501);
     bacteriaY = (int) (Math.random() * 501);
   }
   
   void show() {
     fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256)); // Random color.
     int point2X = bacteriaX + 8;
     int point2Y = bacteriaY + 8;
     int point3X = bacteriaX - 8;
     int point3Y = bacteriaY - 8;
     triangle(bacteriaX, bacteriaY, point2X, point2Y, point3X, point3Y); // Draw the bacteria.
   }
   
   void move() {
     bacteriaX = bacteriaX + ((int) (Math.random() * 21) - 10); // Randomly move the bacteria every loop.
     bacteriaY = bacteriaY + ((int) (Math.random() * 21) - 10);
     if (mouseX > bacteriaX) { // Conditions to check the x-location of the bacteria in relation to the mouse. Move the bacteria accordingly.
       bacteriaX = bacteriaX + (int) (Math.random() * 10);
     } else if (mouseX < bacteriaX) {
       bacteriaX = bacteriaX - (int) (Math.random() * 10);
     } else {
       bacteriaX = bacteriaX + ((int) (Math.random() * 17) - 8);
     }
     
     if (mouseY > bacteriaY) { // Conditions to check the y-location of the bacteria in relation to the mouse. Move the bacteria accordingly.
       bacteriaY = bacteriaY + (int) (Math.random() * 10);
     } else if (mouseY < bacteriaY) {
       bacteriaY = bacteriaY - (int) (Math.random() * 10);
     } else {
       bacteriaY = bacteriaY + ((int) (Math.random() * 17) - 8);
     }
     
     if (mousePressed) { // If mouse is pressed, randomly disperse the bacteria. (Explosion effect).
       bacteriaX = bacteriaX + ((int) (Math.random() * 201) - 100);
       bacteriaY = bacteriaY + ((int) (Math.random() * 201) - 100);
     }
   }
 }
