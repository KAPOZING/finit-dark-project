//Animation
animation_init();

frameSpeed = 0.1;

lastSprite = sprite;


//State
enum_init();

currentState = 0;

onGround = true;


//Key input
keyLeft = false;
keyRight = false;
keyUp = false;
keyDown = false;

keyA = false; //For jump and dodge
keyB = false; //For attacks


//Movement
collision_init();

xSpeed = 0; //Current Hrizontal speed
ySpeed = 0; //Current Vertical speed

hAccel = 0.1; //Horizontal acceleration
hDecel = 0.1; //Horizontal Deceleration
hMaxSpeed = 1; //Horizontal Max Speed

jPower = -2; //Jump Power
gForce = 0.1; // Gravity

airJump = true;

airAccel = 0.05;
airDecel = 0.005;
airMaxSpeed = 1;

