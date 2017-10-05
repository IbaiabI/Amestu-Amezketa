  
float x_canv = 1100;
float y_canv = 800;

float radio = 350;
float text_alt = 30;

float xzent = radio + 80;
float yzent = y_canv/2;

float z_ang = 3;
float sz_ang = 12;
float z_rad = 10;

float lodi_handi = 1;
float lodi_txiki = 0.3;

float rmin = 2*radio/z_rad;
float rmax = radio - 1*radio/z_rad;
int umin = 1900;
int umax = 2017;

float n_rerdi = 10;
float n_rmin = 15;
float n_rmax = 110;

PFont f;

String text1 = "Paisaje historico";
String text2 = "Paisaje fisico";
String text3 = "Paisaje imaginario";

color[11] tex_ezau = {"Zona Cero",
                     "Mordedores",
                     "Pandemia",
                     "Vísceras Espaciales",
                     "Segregación",
                     "Deambuladores",
                     "Aceleración",
                     "Alternancia Temporal",
                     "Sobrexcitación",
                     "Sobrexposición",
                     "Sobrevaloración"};
                      
color[11] c_ezau = {color(0   ,0   ,0   ),
                    color(10  ,90  ,10  ),
                    color(20  ,20  ,20  ),
                    color(30  ,30  ,60  ),
                    color(40  ,40  ,40  ), 
                    color(50  ,90  ,50  ),
                    color(60  ,60  ,30  ),
                    color(70  ,70  ,70  ),
                    color(90  ,70  ,70  ),
                    color(80  ,80  ,90  ),
                    color(90  ,30  ,90  ) };
                 
PImage[11] im_ezau = {};

int x_botons = 850;
int y_botons = 50;
int s_ezau = 40;
int d_ezau = 45;
                    
boolean[11] act_ezau = {0,0,0,0,0,0,0,0,0,0,0}; 
boolean act_node = 1;
int num_node = 0;
     
Nodo n;
Nodo[] lista_N = {};

Boton b;
Boton[] lista_B = {};

class Nodo{
    String izena;
    PImage im;
    float mota;   
    float hille; 
    float urte;
    boolean ezau[];
    float r;
    float ang;
    float x;
    float y;

    Nodo(String t_izena, String t_irudi, int t_mota, int t_hille, 
                                         int t_urte, boolean[] t_ezau){
        izena = t_izena;
        im = loadImage(t_irudi);
        mota = t_mota;
        hille = t_hille;
        urte = t_urte;
        ezau = t_ezau;
        r = rmin + (rmax-rmin)*(urte-umin)/(umax-umin);
        ang = (mota-1)*2*PI/3 + (hille-1/2)*(2*PI/3)/sz_ang;
        x = xzent + r*cos(ang);
        y = yzent + r*sin(ang);
    }
    void display(){

        pushMatrix();
        pushStyle();

        translate(xzent,yzent);
        rotate(ang);

        fill(255);
        ellipse(r,0,n_rerdi,n_rerdi);
        
        fill(0,0);
        for(int i=0; i < ezau.length ; ++i){
            if(ezau[i]*act_ezau[i]){
            	stroke(c_ezau[i]);
            	float n_r = n_rmin + (n_rmax - n_rmin)*i/ezau.length;
            	ellipse(r,0,n_r,n_r);  
            }
        }       
        
        popMatrix();
        popStyle();
    }
}

class Boton{
    int x;
    int y;
    Boton(int t_x, int t_y){
        x = t_x;
        y = t_y; 
    }
}

void setup()
{
    size(x_canv,y_canv);

    f = loadFont("ISOCTEUR.ttf");
    textFont(f);     
    textAlign(CENTER);
        
    for(int i=0; i < tex_ezau.length ; ++i){   
        b = new Boton(x_botons, y_botons + d_ezau*i);   
        lista_B = append(lista_B,b);  
    }
    
    im_ezau[0] = loadImage("ezau/zc.jpg");
    im_ezau[1] = loadImage("ezau/m.jpg");
    im_ezau[2] = loadImage("ezau/p.jpg");
    im_ezau[3] = loadImage("ezau/ve.jpg");
    im_ezau[4] = loadImage("ezau/s.jpg");
    im_ezau[5] = loadImage("ezau/d.jpg");
    im_ezau[6] = loadImage("ezau/a.jpg");
    im_ezau[7] = loadImage("ezau/at.jpg");
    im_ezau[8] = loadImage("ezau/sc.jpg");
    im_ezau[9] = loadImage("ezau/sp.jpg");
    im_ezau[10] = loadImage("ezau/sv.jpg");
    
    lista_N = append(lista_N,new Nodo("Hola1","nodos/1.jpg",1,4,1900,{1,0,1,1,1,0,0,1,1,1,1}));   
    lista_N = append(lista_N,new Nodo("Hola2","nodos/2.jpg",1,6,1910,{1,1,1,1,0,1,1,1,0,0,1}));   
    lista_N = append(lista_N,new Nodo("Hola3","nodos/3.jpg",1,3,1930,{0,0,0,1,1,1,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola4","nodos/4.jpg",1,3,2000,{1,1,1,0,1,0,1,1,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola5","nodos/5.jpg",1,8,1950,{1,1,1,1,0,1,0,1,0,1,0}));
    lista_N = append(lista_N,new Nodo("Hola6" ,"nodos/6.jpg",1,9,2007,{0,0,0,0,1,1,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola7" ,"nodos/7.jpg",1,2,2001,{1,1,0,1,0,1,0,1,0,1,1}));
    lista_N = append(lista_N,new Nodo("Hola8" ,"nodos/8.jpg",1,5,1970,{0,1,1,0,1,1,0,1,1,1,0}));
    lista_N = append(lista_N,new Nodo("Hola9" ,"nodos/9.jpg",1,5,1970,{0,1,0,1,0,1,1,0,0,1,0}));
    lista_N = append(lista_N,new Nodo("Hola10","nodos/10.jpg",1,5,1970,{1,1,0,1,1,0,0,1,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola11","nodos/11.jpg",1,5,1970,{0,1,1,0,1,0,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola12","nodos/12.jpg",1,10,1980,{0,0,0,1,1,0,1,1,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola13","nodos/13.jpg",1,2,1960,{1,0,1,1,0,0,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola14","nodos/14.jpg",1,9,2012,{1,1,0,1,1,0,1,0,0,1,0}));
    lista_N = append(lista_N,new Nodo("Hola15","nodos/15.jpg",1,3,2016,{0,1,1,1,0,1,1,0,1,0,0}));
    lista_N = append(lista_N,new Nodo("Hola16","nodos/16.jpg",2,4,2017,{1,0,1,0,1,1,0,1,0,1,1}));
    lista_N = append(lista_N,new Nodo("Hola17","nodos/17.jpg",2,3,2017,{1,0,1,1,0,0,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola18","nodos/18.jpg",2,5,2017,{1,0,1,1,0,1,0,1,0,1,1}));
    lista_N = append(lista_N,new Nodo("Hola19","nodos/19.jpg",2,1,2017,{0,1,1,0,1,1,1,0,1,0,1}));
    lista_N = append(lista_N,new Nodo("Hola20","nodos/20.jpg",3,3,1930,{1,1,0,1,1,1,0,1,0,0,1}));
    lista_N = append(lista_N,new Nodo("Hola21","nodos/21.jpg",3,8,1944,{0,0,1,0,1,0,1,1,1,1,0}));
    lista_N = append(lista_N,new Nodo("Hola22","nodos/22.jpg",3,4,1950,{1,1,1,1,0,1,1,1,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola23","nodos/23.jpg",3,10,1955,{1,0,1,0,1,0,1,0,1,1,0}));
    lista_N = append(lista_N,new Nodo("Hola24","nodos/24.jpg",3,1,1960,{1,1,0,1,1,0,0,1,1,1,0}));
    lista_N = append(lista_N,new Nodo("Hola25","nodos/25.jpg",3,4,1967,{1,1,1,1,0,1,0,0,0,0,1}));
    lista_N = append(lista_N,new Nodo("Hola26","nodos/26.jpg",3,12,1970,{1,0,1,0,1,0,1,0,1,1,1}));
    lista_N = append(lista_N,new Nodo("Hola27","nodos/27.jpg",3,4,1976,{0,1,0,1,0,1,0,1,0,1,1}));
    lista_N = append(lista_N,new Nodo("Hola28","nodos/28.jpg",3,2,1983,{1,1,1,1,0,1,0,0,1,1,0}));
    lista_N = append(lista_N,new Nodo("Hola29","nodos/29.jpg",3,7,1990,{1,0,1,1,1,0,1,1,0,1,0}));
}

void mousePressed()
{
    for(int i=0; i < lista_B.length ; ++i)
    {
        if( (mouseX > lista_B[i].x) && (mouseX < (lista_B[i].x + s_ezau + 150)) ){
        if( (mouseY > lista_B[i].y) && (mouseY < (lista_B[i].y + s_ezau)) ){
            if(act_ezau[i]){
              act_ezau[i] = 0;
            } else {
              act_ezau[i] = 1;
            }
        }
        }
    }
}

void mouseMoved()
{
    float dn,dx,dy,d=1000000;
    act_node = 0;
    for(int i=0; i < lista_N.length ; ++i)
    {
        dx = lista_N[i].x - mouseX;
        dy = lista_N[i].y - mouseY;
        dn = sqrt(dx*dx + dy*dy);
        if((dn<d) && (dn<20)){
           d = dn;
           act_node = 1;
           num_node = i;
        }
    }
}

void draw() 
{
    pushMatrix();
    pushStyle();

    translate(xzent,yzent);
    
    background(0);

    float r = radio + text_alt;

    fill(70);
    arc(0,0,2*r,2*r,0,PI*2/3);

    fill(100);
    arc(0,0,2*r,2*r,PI*2/3,PI*4/3);

    fill(130);
    arc(0,0,2*r,2*r,PI*4/3,2*PI);

    fill(110);
    arc(0,0,2*radio,2*radio,0,PI*2/3);

    fill(140);
    arc(0,0,2*radio,2*radio,PI*2/3,PI*4/3);

    fill(170);
    arc(0,0,2*radio,2*radio,PI*4/3,2*PI);

    stroke(93,108,255);
    fill(36,0);

    strokeWeight(lodi_handi);   
    ellipse(0,0,2*(radio+text_alt),2*(radio+text_alt));
    ellipse(0,0,2*radio,2*radio);
    
    strokeWeight(lodi_txiki);    
    float dr = radio/z_rad;
    for(int i=1 ; i < z_rad; ++i){
         float r = radio-i*dr;
         ellipse(0,0,2*r,2*r);
    }
    
    float dang = 360.0/(sz_ang*z_ang);
    for(int i=1 ; i <= (sz_ang*z_ang); ++i){
         float ang = radians(i*dang);
         line(0,0,radio*cos(ang),radio*sin(ang));
    }

    strokeWeight(lodi_handi);
    float dang = 360.0/z_ang;
    for(int i=1 ; i <= z_ang; ++i){
         float ang = radians(i*dang);
         line(0,0,(radio+text_alt)*cos(ang), (radio+text_alt)*sin(ang));
    }
    
    textSize(15);
    fill(200);     
    float ark = 0;
    
    for (int i = 0; i < text1.length(); ++i){
         float r = radio + 8;
         char letra = text1.charAt(i);
         float w = textWidth(letra) + 5;
         ark += w/2;
         float theta = ark/r - PI/2;
         pushMatrix();
         translate(r*cos(theta),r*sin(theta));
         rotate(theta + PI/2);
         text(letra,0,0);
         popMatrix();
         ark += w/2 ;

    } 

    float ark = 0;
    
    for (int i = 0; i < text2.length(); ++i){
         float r = radio + 8;
         char letra = text2.charAt(i);
         float w = textWidth(letra) + 5; 
         ark += w/2;
         float theta = ark/r - PI*7/6;
         pushMatrix();
         translate(r*cos(theta),r*sin(theta));
         rotate (theta + PI/2);
         text(letra,0,0);
         popMatrix();
         ark += w/2 ;

    } 
    
    float ark = 0;
    
    for (int i = 0; i < text3.length(); ++i){
         float r = radio + 8;
         char letra = text3.charAt(i);
         float w = textWidth(letra) + 5;
         ark += w/2;
         float theta = ark/r + PI/6;
         pushMatrix();
         translate(r*cos(theta),r*sin(theta));
         rotate (theta + PI/2);
         text(letra,0,0);
         popMatrix();
         ark += w/2 ;

    } 

    textSize(10);

    for(int j=0; j<z_ang; ++j){
        rotate(PI*2/z_ang);
        float theta = -2;
        for (int i = 1; i <= sz_ang ; ++i){
           float r = radio - 25;       
           pushMatrix();
           translate(r*cos(theta),r*sin(theta));
           rotate(theta + PI/2);
           text(str(i),0,0);
           popMatrix();
           theta += 2*PI/(sz_ang*z_ang);
        } 
    }
    popMatrix();
    popStyle();
    pushStyle();
    
    for(int i=0; i < lista_N.length ; ++i){
        lista_N[i].display();
    }        
    
    
    if(act_node){
        fill(255);
        tint(255);
        image(lista_N[num_node].im,850,560,200,200);
        text(lista_N[num_node].izena,950,780);
    }
   
    textAlign(LEFT);
        
    for(int i=0; i < lista_B.length ; ++i){
       if(act_ezau[i]){
            stroke(255);
            fill(255);
            tint(255);
         }
       else{          
            stroke(100);
            fill(100);
            tint(100);
       }
       image(im_ezau[i],lista_B[i].x,lista_B[i].y, s_ezau, s_ezau);
       text(tex_ezau[i],lista_B[i].x+s_ezau+10 ,lista_B[i].y+s_ezau/2);         
    }  
    
    popStyle();
         
}
