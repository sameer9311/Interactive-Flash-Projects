package
{
import mx.controls.Button;
import flash.text.*;
import mx.skins.halo.DateChooserYearArrowSkin;
import flash.geom.Point;
import pie.graphicsLibrary.*;
import pie.uiElements.*;
import flash.display.LoaderInfo;
import flash.utils.*;
import flash.display.Sprite;
import mx.core.FlexGlobals;

public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;


private var nume1:int;
private var denom1:int;
private var nume2:int;
private var denom2:int;
private var flag:int;
private var flag2:int;

private var scorenume:int;
private var scoredenom:int;
private var scoreflag:int;

/**
 *
 * This section contains Physics Parameters
 *
 */
private var h:Number;
private var w:Number;
private var PIEaspectRatio:Number;
private var worldOriginX:Number;
private var worldOriginY:Number;
private var worldWidth:Number;
private var worldHeight:Number;

/**
 *
 * This section contains Drawing Objects
 * 
 *
 */

private var button1:PIEbutton;
private var button2:PIEbutton;
private var button3:PIEbutton;
private var button4:PIEbutton;
private var rndnum:Number;

private var label:PIElabel;
private var label1:PIElabel;
private var label2:PIElabel;
private var label3:PIElabel;
private var label4:PIElabel;
private var label5:PIElabel;
private var label6:PIElabel;
private var label7:PIElabel;
private var label8:PIElabel;
private var label9:PIElabel;
private var label10:PIElabel;
private var label11:PIElabel;
private var label12:PIElabel;
private var label13:PIElabel;
private var label14:PIElabel;
private var label15:PIElabel;
private var label16:PIElabel;
private var label17:PIElabel;
private var label18:PIElabel;
private var label19:PIElabel;
private var label20:PIElabel;
private var label21:PIElabel;
private var label22:PIElabel;
private var label23:PIElabel;
private var label24:PIElabel;
private var label25:PIElabel;

private var line1:PIEline;
private var line2:PIEline;
private var line3:PIEline;
private var line4:PIEline;
private var line5:PIEline;
private var line6:PIEline;
private var line7:PIEline;
private var line8:PIEline;

private var scann1:PIEinput;
private var scann2:PIEinput;
private var scann3:PIEinput;
private var scann4:PIEinput;
private var scann5:PIEinput;
private var scann6:PIEinput;
private var scann7:PIEinput;
private var scann8:PIEinput;
private var scann9:PIEinput;
private var scann10:PIEinput;
private var scann11:PIEinput;
private var scann12:PIEinput;
private var scann13:PIEinput;
 
 
/* Display Parameters */
private var displayBColor:uint;
private var displayFColor:uint;

private var mode:String;

/**
 *
 * This section stores the handles of Drawing and UI Objects
 *
 */
/**
 *
 * This function is called by the PIE framework at the beginning of the experiment
 * The PIE developer has to code the following steps in this section of his code
 *     define a whole range of global (accessible throughout the file) variables to capture initial state
 *     - the basic set of physics variables (velocity, position etc.) of the moving and non moving object
 *     - the basic set of drawing variables (dimension etc.) of the (in particualr) non moving objects
 *
 *     define a whole range of global variables to capture current state (variables which change with time)
 *
 *     define a whole range of global variables to store the handles (integer numbers) of all the objects
 *
 *     obtain the dimensions of  drawinng area from PIE framework and store in global variable
 *
 *     call a PIE framework function to  set the dimensions of the drawing area, right panel and bottom panel
 *
 *     define the position of all the global (static) variables
 *
 *     call PIE framework to create all experiment + UI objects and store returned integers in appropriate handles
 *
 *     set the values of the current state variables to initial values
 *
 * At this stage, we have defined how the initial experiment will appear to the user
 * Our experiment file code now has to  wait for the PIE framework to call other functions depending on user action
 *
 */
public function Experiment(pie:PIE)
{
    /* Store handle of PIE Framework */
    pieHandle = pie;

    /* Call a PIE framework function to set the dimensions of the drawing area, right panel and bottom panel */
    /* We will reserve 70% width and 850%height for the drawing area */
    pieHandle.PIEsetDrawingArea(0.7, 0.85);
	
	h = FlexGlobals.topLevelApplication.height;	
	w = FlexGlobals.topLevelApplication.width;

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
	pieHandle.PIEsetUIpanelInvisible();
	/* load parameters */
	pieHandle.loadParameters();
    /* Set the Experiment Details */
    pieHandle.showExperimentName("Addition Of Fractions");
    pieHandle.showDeveloperName("Sameer Sonawane");
	
	button1 = new PIEbutton(pieHandle, "DisplayText");		
	button1.setActualSize( 100*(w/800), 25*(h/600));
	button1.label = 'REPEAT';
	button1.x = 100*(w/800);
	button1.y = 570*(h/600);
	button1.visible = true;
	pieHandle.addChild(button1);
	
	button2 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button2);	
	button2.visible = true;
	button2.setActualSize( 100*(w/800), 25*(h/600));
	button2.label = 'STEP';
	button2.x = 300*(w/800);
	button2.y = 570*(h/600);
	
	button3 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button3);
	button3.visible = true;
	button3.setActualSize( 100*(w/800), 25*(h/600));
	button3.label = 'AUTO';
	button3.x = 500*(w/800);
	button3.y = 570*(h/600);
	
	button4 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button4);
	button4.visible = true;
	button4.setActualSize( 100*(w/800), 25*(h/600));
	button4.label = 'DONE';
	button4.x = 500*(w/800);
	button4.y = 570 * (h / 600);
	
	line1 = new PIEline(pieHandle, 225 * (w / 800), 50 * (h / 600), 250 * (w / 800), 50 * (h / 600), displayFColor, 2, 0.8);
	pieHandle.addDisplayChild(line1);
	
	line2 = new PIEline(pieHandle, 600 * (w / 800), 50 * (h / 600), 625 * (w / 800), 50 * (h / 600), displayFColor, 2, 0.8);
	pieHandle.addDisplayChild(line2);
	
	line3 = new PIEline(pieHandle, 250 * (w / 800), 130 * (h / 600), 325 * (w / 800), 130 * (h / 600), displayFColor, 2, 0.8);
	
	line4 = new PIEline(pieHandle, 400 * (w / 800), 130 * (h / 600), 425 * (w / 800), 130 * (h / 600), displayFColor, 2, 0.8);
	
	line5 = new PIEline(pieHandle, 250 * (w / 800), 210 * (h / 600), 325 * (w / 800), 210 * (h / 600), displayFColor, 2, 0.8);
	
	line6 = new PIEline(pieHandle, 400 * (w / 800), 210 * (h / 600), 425 * (w / 800), 210 * (h / 600), displayFColor, 2, 0.8);
	
	line7 = new PIEline(pieHandle, 250 * (w / 800), 290 * (h / 600), 325 * (w / 800), 290 * (h / 600), displayFColor, 2, 0.8);
	
	line8 = new PIEline(pieHandle, 400 * (w / 800), 290 * (h / 600), 425 * (w / 800), 290 * (h / 600), displayFColor, 2, 0.8);
	
	label1 = new PIElabel(pieHandle, "First Fraction =", 25*(h/600),  displayBColor, displayFColor);
	label1.x = 25*(w/800);
	label1.y = 30*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = false;	
	
	label3 = new PIElabel(pieHandle, "Second Fraction =", 25*(h/600), displayBColor, displayFColor);
	label3.x = 375*(w/800);
	label3.y = 30*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;	
	
	label7 = new PIElabel(pieHandle, "First Fraction =", 25* (h / 600), displayBColor, displayFColor);
	label7.x = 25*(w/800);
	label7.y = 110 * (h / 600);
	pieHandle.addDisplayChild(label7);
	label7.visible = false;	
	
	label12 = new PIElabel(pieHandle, " =  ", 25* (h / 600), displayBColor, displayFColor);
	label12.x = 350*(w/800);
	label12.y = 110 * (h / 600);
	pieHandle.addDisplayChild(label12);
	label12.visible = false;
	
	label13 = new PIElabel(pieHandle, "Second Fraction =", 25* (h / 600), displayBColor, displayFColor);
	label13.x = 25*(w/800);
	label13.y = 190 * (h / 600);
	pieHandle.addDisplayChild(label13);
	label13.visible = false;	
	
	label18 = new PIElabel(pieHandle, " =  ", 25* (h / 600), displayBColor, displayFColor);
	label18.x = 350*(w/800);
	label18.y = 190 * (h / 600);
	pieHandle.addDisplayChild(label18);
	label18.visible = false;
	
	label19 = new PIElabel(pieHandle, " Addition =  ", 25* (h / 600), displayBColor, displayFColor);
	label19.x = 25*(w/800);
	label19.y = 270 * (h / 600);
	pieHandle.addDisplayChild(label19);
	label19.visible = false;
	
	label24 = new PIElabel(pieHandle, " =  ", 25* (h / 600), displayBColor, displayFColor);
	label24.x = 350*(w/800);
	label24.y = 270 * (h / 600);
	pieHandle.addDisplayChild(label24);
	label24.visible = false;
	
	label25 = new PIElabel(pieHandle, "", 25*(h/600),  displayBColor, displayFColor);
	label25.x = 100*(w/800);
	label25.y = 430*(h/600);
	pieHandle.addDisplayChild(label25);
	label25.visible = false;	
	
	/* read parameter */
	mode = pieHandle.getParameter("mode");
	/* init a label */
	var label:PIElabel;
	if (mode == "demo") {
		/* start demo mode */
		
		demofunc();
		
	} else if (mode == "interactive") {
		
		interactfunc();
		
	} else if (mode == "guided") {
		/* start guided mode */
		
		scoredenom = 0;
		scorenume = 0;
		guidefunc();
		
	} else if (mode == "test") {
		/* start test mode */
		
		scoredenom = 0;
		scorenume = 0;
		testfunc();
		
	} else { 
		/* If no mode provided, start demo mode */
		scoredenom = 0;
		scorenume = 0;
		testfunc();
	}
   
}
public function demofunc():void
{
	button4.visible = false;
	flag = 0;
	
	button1.addClickListener(demorepeatfunction);	
	
	nume1 = Math.ceil(Math.random() * 5);
	denom1 = Math.ceil(Math.random() * 5 + 4);
	
	nume2 = Math.ceil(Math.random() * 5);
	denom2 = Math.ceil(Math.random() * 5 + 4);
	
	label1.visible = true;	
	
	label2 = new PIElabel(pieHandle, String(nume1), 25*(h/600), displayBColor, displayFColor);
	label2.x = 225*(w/800);
	label2.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label4 = new PIElabel(pieHandle, String(denom1), 25*(h/600), displayBColor, displayFColor);
	label4.x = 225*(w/800);
	label4.y = 55 * (h / 600);	
	pieHandle.addDisplayChild(label4);	
	label4.visible = true;	
	
	label3.visible = true;	
	
	label5 = new PIElabel(pieHandle, String(nume2), 25* (h / 600), displayBColor, displayFColor);
	label5.x = 600*(w/800);
	label5.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label5);	
	label5.visible = true;	
	
	label6 = new PIElabel(pieHandle, String(denom2), 25* (h / 600), displayBColor, displayFColor);
	label6.x = 600*(w/800);
	label6.y = 55 * (h / 600);
	pieHandle.addDisplayChild(label6);	
	label6.visible = true;	
	
	demofunc1();
}
public function demofunc1():void
{
	
	label8 = new PIElabel(pieHandle, nume1 + "   X   " + denom2, 25* (h / 600), displayBColor, displayFColor);
	label8.x = 250*(w/800);
	label8.y = 90 * (h / 600);
	
	label9 = new PIElabel(pieHandle, denom1 + "   X   " + denom2, 25* (h / 600), displayBColor, displayFColor);
	label9.x = 250*(w/800);
	label9.y = 135 * (h / 600);
	
	label10 = new PIElabel(pieHandle, String(nume1*denom2), 25* (h / 600), displayBColor, displayFColor);
	label10.x = 400*(w/800);
	label10.y = 90 * (h / 600);
	
	label11 = new PIElabel(pieHandle, String(denom1*denom2), 25* (h / 600), displayBColor, displayFColor);
	label11.x = 400*(w/800);
	label11.y = 135 * (h / 600);
	
	label14 = new PIElabel(pieHandle, nume2 + "   X   " + denom1, 25* (h / 600), displayBColor, displayFColor);
	label14.x = 250*(w/800);
	label14.y = 170 * (h / 600);
	
	label15 = new PIElabel(pieHandle, denom2 + "   X   " + denom1, 25* (h / 600), displayBColor, displayFColor);
	label15.x = 250*(w/800);
	label15.y = 215 * (h / 600);
	
	label16 = new PIElabel(pieHandle,String(nume2*denom1) , 25* (h / 600), displayBColor, displayFColor);
	label16.x = 400*(w/800);
	label16.y = 170 * (h / 600);
	
	label17 = new PIElabel(pieHandle, String(denom2*denom1), 25* (h / 600), displayBColor, displayFColor);
	label17.x = 400*(w/800);
	label17.y = 215 * (h / 600);
	
	label20 = new PIElabel(pieHandle,(nume1*denom2) + "   +   " + (nume2*denom1) , 25* (h / 600), displayBColor, displayFColor);
	label20.x = 250*(w/800);
	label20.y = 250 * (h / 600);
	
	label21 = new PIElabel(pieHandle, String(denom1*denom2), 25* (h / 600), displayBColor, displayFColor);
	label21.x = 275*(w/800);
	label21.y = 295 * (h / 600);
	
	label22 = new PIElabel(pieHandle, String(nume1*denom2 + nume2*denom1), 25* (h / 600), displayBColor, displayFColor);
	label22.x = 400*(w/800);
	label22.y = 250 * (h / 600);
	
	label23 = new PIElabel(pieHandle, String(denom1*denom2), 25* (h / 600), displayBColor, displayFColor);
	label23.x = 400*(w/800);
	label23.y = 295 * (h / 600);	
	
	if ( flag == 3)
	{
		demoautofunction();
	}
	
	button2.addClickListener(demostepfunction1);	
	button3.addClickListener(demoautofunction);
}	

public function demorepeatfunction():void
{	
	label7.visible = false;
	label8.visible = false;
	label9.visible = false;	
	label12.visible = false;
	label13.visible = false;
	label14.visible = false;
	label15.visible = false;	
	label18.visible = false;
	label19.visible = false;
	label20.visible = false;	
	label24.visible = false;
	line3.visible = false;
	line4.visible = false;
	line5.visible = false;
	line6.visible = false;
	line7.visible = false;
	line8.visible = false;
	
	if ( flag == 0)
	{
	label2.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	label10.visible = false;
	label11.visible = false;
	label16.visible = false;
	label17.visible = false;
	label21.visible = false;
	label22.visible = false;
	label23.visible = false;
	demofunc();
	}
	if ( flag == 1)
	{	
		label10.visible = false;
	    label11.visible = false;
		label16.visible = false;
		label17.visible = false;
		label21.visible = false;
		label22.visible = false;
		label23.visible = false;
		interactfunc();
	}
	if ( flag == 2)
	{
	
		scann1.visible = false;
		scann2.visible = false;
		scann3.visible = false;
		scann4.visible = false;
		scann5.visible = false;
		scann6.visible = false;
		scann7.visible = false;
		scann8.visible = false;
		scann9.visible = false;
		scann10.visible = false;
		scann11.visible = false;
		scann12.visible = false;
		scann13.visible = false;		
		
		guidefunc();
	}
	if ( flag == 3)
	{
	label2.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	label10.visible = false;
	label11.visible = false;
	label16.visible = false;
	label17.visible = false;
	label21.visible = false;
	label22.visible = false;
	label23.visible = false;
	testfunc();
	}
	
}
public function demostepfunction1():void
{	
	label7.visible = true;
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction2);	
}
public function demostepfunction2():void
{
	pieHandle.addDisplayChild(label8);	
	label8.visible = true;	
	pieHandle.addDisplayChild(label9);	
	label9.visible = true;	
	pieHandle.addDisplayChild(line3);
	line3.visible = true;
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction3);	
}
public function demostepfunction3():void
{
	pieHandle.addDisplayChild(label10);	
	label10.visible = true;	
	pieHandle.addDisplayChild(label11);	
	label11.visible = true;	
	label12.visible = true;
	pieHandle.addDisplayChild(line4);
	line4.visible = true;
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction4);	
}
public function demostepfunction4():void
{	
	label13.visible = true;	
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction5);	
}
public function demostepfunction5():void
{	
	pieHandle.addDisplayChild(label14);	
	label14.visible = true;	
	pieHandle.addDisplayChild(label15);	
	label15.visible = true;	
	
	pieHandle.addDisplayChild(line5);
	line5.visible = true;	
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction6);	
}
public function demostepfunction6():void
{	
	pieHandle.addDisplayChild(label16);	
	label16.visible = true;	
	pieHandle.addDisplayChild(label17);	
	label17.visible = true;	
	label18.visible = true;
	pieHandle.addDisplayChild(line6);
	line6.visible = true;
	line5.visible = true;	
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction7);	
}
public function demostepfunction7():void
{	
	label19.visible = true;
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction8);	
}
public function demostepfunction8():void
{	
	pieHandle.addDisplayChild(label20);	
	label20.visible = true;	
	pieHandle.addDisplayChild(label21);	
	label21.visible = true;
	pieHandle.addDisplayChild(line7);
	line7.visible = true;
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction9);	
}
public function demostepfunction9():void
{	
	pieHandle.addDisplayChild(label22);	
	label22.visible = true;	
	pieHandle.addDisplayChild(label23);	
	label23.visible = true;
	pieHandle.addDisplayChild(line8);
	label24.visible = true;
	line8.visible = true;	
	
	button1.addClickListener(demorepeatfunction);		
	button2.addClickListener(demostepfunction8);	
}
public function demoautofunction():void
{
	setTimeout(demoautofunction1, 500,1);
}
public function demoautofunction1(argu:int):void
{
	if ( argu == 1)
	{
		demostepfunction1();
		setTimeout(demoautofunction1, 500, 2);
	}
	if ( argu == 2)
	{
		demostepfunction2();
		setTimeout(demoautofunction1, 500, 3);
	}
	if ( argu == 3)
	{
		demostepfunction3();
		setTimeout(demoautofunction1, 500, 4);
	}
	if ( argu == 4)
	{
		demostepfunction4();
		setTimeout(demoautofunction1, 500, 5);
	}
	if ( argu == 5)
	{
		demostepfunction5();
		setTimeout(demoautofunction1, 500, 6);
	}
	if ( argu == 6)
	{
		demostepfunction6();
		setTimeout(demoautofunction1, 500, 7);
	}
	if ( argu == 7)
	{
		demostepfunction7();
		setTimeout(demoautofunction1, 500, 8);
	}
	if ( argu == 8)
	{
		demostepfunction8();
		setTimeout(demoautofunction1, 500, 9);
	}
	if ( argu == 9)
	{
		demostepfunction9();		
	}
	button1.addClickListener(demorepeatfunction);
	button4.visible = false;
	
}

public function interactfunc():void
{
	label1.visible = true;
	label3.visible = true;
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	flag = 1;
	
	scann1 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann1.x  = 225*(w/800);
	scann1.y  = 10*(h/600);
	scann1.width = 40*(w/800);
	scann1.height = 30*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = true;	
	
	scann2 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann2.x  = 225*(w/800);
	scann2.y  = 55*(h/600);
	scann2.width = 40*(w/800);
	scann2.height = 30*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;	
	
	scann3 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 600*(w/800);
	scann3.y  = 10*(h/600);
	scann3.width = 40*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;	
	
	scann4 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann4.x  = 600*(w/800);
	scann4.y  = 55*(h/600);
	scann4.width = 40*(w/800);
	scann4.height = 30*(h/600);
	scann4.border = true;
	pieHandle.addDisplayChild(scann4);
	scann4.visible = false;	
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(interactstepfunc01);
	button2.addClickListener(interactstepfunc1);
	button3.addClickListener(interactautofunc1);
	
}
public function interactstepfunc01():void
{
	scann1.border = false;
	scann2.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(interactstepfunc02);
}
public function interactstepfunc02():void
{
	scann2.border = false;
	scann3.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(interactstepfunc03);
}
public function interactstepfunc03():void
{
	scann3.border = false;
	scann4.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(interactstepfunc04);
}
public function interactstepfunc04():void
{
	scann4.border = false;
	button4.visible = false;
	button2.visible = true;
	button3.visible = true;
	button1.addClickListener(demorepeatfunction);
	button2.addClickListener(interactstepfunc1);
	button3.addClickListener(interactautofunc1);
}	
public function interactstepfunc1():void
{
	scann1.border = false;
	scann2.border = false;
	scann3.border = false;
	scann4.border = false;
	
	nume1 = int(scann1.text);	
	denom1 = int(scann2.text);
	nume2 = int(scann3.text);
	denom2 = int(scann4.text);
	
	if (denom1 == 0)
	{
		denom1 = 1;
	}
	if (denom2 == 0)
	{
		denom2 = 1;
	}
	
	demofunc1();
}
public function interactautofunc1():void
{
	scann1.border = false;
	scann2.border = false;
	scann3.border = false;
	scann4.border = false;
	
	nume1 = int(scann1.text);
	denom1 = int(scann2.text);
	nume2 = int(scann3.text);
	denom2 = int(scann4.text);
	
	if (denom1 == 0)
	{
		denom1 = 1;
	}
	if (denom2 == 0)
	{
		denom2 = 1;
	}
	demofunc1();
	demoautofunction1(1);
}

public function guidefunc():void
{
	label25.visible = false;
	flag = 2;
	scoreflag = 1;
	scoredenom = scoredenom + 1;
	
	button4.visible = true;
	button2.visible = false;
	button3.visible = false;
	
	nume1 = Math.ceil(Math.random() * 5);
	denom1 = Math.ceil(Math.random() * 5 + 4);
	
	nume2 = Math.ceil(Math.random() * 5);
	denom2 = Math.ceil(Math.random() * 5 + 4);
	
	label1.visible = true;	
	
	label2 = new PIElabel(pieHandle, String(nume1), 25*(h/600), displayBColor, displayFColor);
	label2.x = 225*(w/800);
	label2.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label4 = new PIElabel(pieHandle, String(denom1), 25*(h/600), displayBColor, displayFColor);
	label4.x = 225*(w/800);
	label4.y = 55 * (h / 600);	
	pieHandle.addDisplayChild(label4);	
	label4.visible = true;	
	
	label3.visible = true;	
	
	label5 = new PIElabel(pieHandle, String(nume2), 25* (h / 600), displayBColor, displayFColor);
	label5.x = 600*(w/800);
	label5.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label5);	
	label5.visible = true;	
	
	label6 = new PIElabel(pieHandle, String(denom2), 25* (h / 600), displayBColor, displayFColor);
	label6.x = 600*(w/800);
	label6.y = 55 * (h / 600);
	pieHandle.addDisplayChild(label6);	
	label6.visible = true;
	
	label7.visible = true;
	
	label8 = new PIElabel(pieHandle, nume1 + " X  " , 25* (h / 600), displayBColor, displayFColor);
	label8.x = 250*(w/800);
	label8.y = 90 * (h / 600);
	label8.visible = true;
	pieHandle.addDisplayChild(label8);
	
	label9 = new PIElabel(pieHandle, denom1 + " X " , 25* (h / 600), displayBColor, displayFColor);
	label9.x = 250*(w/800);
	label9.y = 135 * (h / 600);
	label9.visible = true;
	pieHandle.addDisplayChild(label9);
	
	pieHandle.addDisplayChild(line3);
	line3.visible = true;	
	
	scann1 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann1.x  = 300*(w/800);
	scann1.y  = 90*(h/600);
	scann1.width = 35*(w/800);
	scann1.height = 30*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = true;	
	
	scann2 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann2.x  = 300*(w/800);
	scann2.y  = 135*(h/600);
	scann2.width = 35*(w/800);
	scann2.height = 30*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;	
	
	scann3 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 400*(w/800);
	scann3.y  = 90*(h/600);
	scann3.width = 35*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	
	scann4 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann4.x  = 400*(w/800);
	scann4.y  = 135*(h/600);
	scann4.width = 35*(w/800);
	scann4.height = 30*(h/600);
	scann4.border = true;
	
	scann5 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann5.x  = 300*(w/800);
	scann5.y  = 170*(h/600);
	scann5.width = 35*(w/800);
	scann5.height = 30*(h/600);
	scann5.border = true;
	
	scann6 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann6.x  = 300*(w/800);
	scann6.y  = 215*(h/600);
	scann6.width = 35*(w/800);
	scann6.height = 30*(h/600);
	scann6.border = true;
	
	scann7 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann7.x  = 400*(w/800);
	scann7.y  = 170*(h/600);
	scann7.width = 35*(w/800);
	scann7.height = 30*(h/600);
	scann7.border = true;
	
	scann8 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann8.x  = 400*(w/800);
	scann8.y  = 215*(h/600);
	scann8.width = 35*(w/800);
	scann8.height = 30*(h/600);
	scann8.border = true;
	
	scann9 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann9.x  = 225*(w/800);
	scann9.y  = 250*(h/600);
	scann9.width = 35*(w/800);
	scann9.height = 30*(h/600);
	scann9.border = true;
	
	scann10 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann10.x  = 300*(w/800);
	scann10.y  = 250*(h/600);
	scann10.width = 35*(w/800);
	scann10.height = 30*(h/600);
	scann10.border = true;
	
	label14 = new PIElabel(pieHandle, nume2 + " X ", 25* (h / 600), displayBColor, displayFColor);
	label14.x = 250*(w/800);
	label14.y = 170 * (h / 600);
	
	label15 = new PIElabel(pieHandle, denom2 + " X " , 25* (h / 600), displayBColor, displayFColor);
	label15.x = 250*(w/800);
	label15.y = 215 * (h / 600);
	
	label20 = new PIElabel(pieHandle,"+" , 25* (h / 600), displayBColor, displayFColor);
	label20.x = 275*(w/800);
	label20.y = 250 * (h / 600);
	
	scann11 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann11.x  = 275*(w/800);
	scann11.y  = 295*(h/600);
	scann11.width = 35*(w/800);
	scann11.height = 30*(h/600);
	scann11.border = true;
	
	scann12 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann12.x  = 400*(w/800);
	scann12.y  = 250*(h/600);
	scann12.width = 35*(w/800);
	scann12.height = 30*(h/600);
	scann12.border = true;
	
	scann13 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann13.x  = 400*(w/800);
	scann13.y  = 295*(h/600);
	scann13.width = 35*(w/800);
	scann13.height = 30*(h/600);
	scann13.border = true;
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc02);
}
public function guidefunc02():void
{
	scann1.border = false;
	scann2.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc2);
}	
public function guidefunc2():void
{
	scann1.border = false;
	scann2.border = false;
	
	label12.visible = true;
	
	pieHandle.addDisplayChild(line4);
	line4.visible = true;
		
	pieHandle.addDisplayChild(scann3);
	scann3.visible = true;		
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc03);	
}	
public function guidefunc03():void
{
	scann3.border = false;
	pieHandle.addDisplayChild(scann4);
	scann4.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc3);	
}	
public function guidefunc3():void
{
	scann3.border = false;
	scann4.border = false;
	
	label13.visible = true;
	
	pieHandle.addDisplayChild(line5);
	line5.visible = true;	
	
	pieHandle.addDisplayChild(label14);
	label14.visible = true;
	
	label15.visible = true;
	pieHandle.addDisplayChild(label15);	
	
	pieHandle.addDisplayChild(scann5);
	scann5.visible = true;	
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc04);
}	
public function guidefunc04():void
{
	scann5.border = false;
	pieHandle.addDisplayChild(scann6);
	scann6.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc4);
}	
public function guidefunc4():void
{
	scann5.border = false;
	scann6.border = false;
	
	label18.visible = true;	
	
	pieHandle.addDisplayChild(line6);
	line6.visible = true;	
	
	pieHandle.addDisplayChild(scann7);
	scann7.visible = true;	
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc05);
}	
public function guidefunc05():void
{	
	scann7.border = false;
	pieHandle.addDisplayChild(scann8);
	scann8.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc5);
}	
public function guidefunc5():void
{
	scann7.border = false;
	scann8.border = false;
	
	label19.visible = true;
	
	pieHandle.addDisplayChild(line7);
	line7.visible = true;	
	
	pieHandle.addDisplayChild(scann9);
	scann9.visible = true;	
	
	pieHandle.addDisplayChild(scann10);
	scann10.visible = true;	
	
	pieHandle.addDisplayChild(label20);
	label20.visible = true;		
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc06);
}	
public function guidefunc06():void
{
	scann9.border = false;
	scann10.border = false;
	pieHandle.addDisplayChild(scann11);
	scann11.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc6);
}	
public function guidefunc6():void
{
	scann9.border = false;
	scann10.border = false;
	scann11.border = false;
	
	label24.visible = true;
	
	pieHandle.addDisplayChild(line8);
	line8.visible = true;	
	
	pieHandle.addDisplayChild(scann12);
	scann12.visible = true;	
	
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc07);
}	
public function guidefunc07():void
{	scann12.border = false;
	pieHandle.addDisplayChild(scann13);
	scann13.visible = true;
	button1.addClickListener(demorepeatfunction);
	button4.addClickListener(guidefunc7);
}	
public function guidefunc7():void
{
	flag2 = 1;
	scann1.border = true;
	scann2.border = true;
	scann3.border = true;
	scann4.border = true;
	scann5.border = true;
	scann6.border = true;
	scann7.border = true;
	scann8.border = true;
	scann9.border = true;
	scann10.border = true;
	scann11.border = true;	
	
	if (int(scann1.text) == denom2)
	{
		scann1.borderColor = 0X55961E;
	}
	else
	{		
		scann1.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann2.text) == denom2)
	{
		scann2.borderColor = 0X55961E;
	}
	else
	{		
		scann2.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann3.text) == (nume1*denom2))
	{
		scann3.borderColor = 0X55961E;
	}
	else
	{		
		scann3.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann4.text) == (denom1*denom2))
	{
		scann4.borderColor = 0X55961E;
	}
	else
	{		
		scann4.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann5.text) == denom1)
	{
		scann5.borderColor = 0X55961E;
	}
	else
	{		
		scann5.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann6.text) == denom1)
	{
		scann6.borderColor = 0X55961E;
	}
	else
	{		
		scann6.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann7.text) == (nume2*denom1))
	{
		scann7.borderColor = 0X55961E;
	}
	else
	{		
		scann7.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann8.text) == (denom1*denom2))
	{
		scann8.borderColor = 0X55961E;
	}
	else
	{		
		scann8.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann9.text) == (nume1*denom2))
	{
		scann9.borderColor = 0X55961E;
	}
	else
	{		
		scann9.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann10.text) == (denom1*nume2))
	{
		scann10.borderColor = 0X55961E;
	}
	else
	{		
		scann10.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann11.text) == (denom1*denom2))
	{
		scann11.borderColor = 0X55961E;
	}
	else
	{		
		scann11.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann12.text) == ((nume1*denom2)+(nume2*denom1)))
	{
		scann12.borderColor = 0X55961E;
	}
	else
	{		
		scann12.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann13.text) == (denom1*denom2))
	{
		scann13.borderColor = 0X55961E;
	}
	else
	{		
		scann13.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	
	if ( scoreflag == 1)
	{
		scorenume = scorenume +1;
	}
	
	label25 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label25.x = 50*(w/800);
	label25.y = 350*(h/600);
	pieHandle.addDisplayChild(label25);
	label25.visible = true;
	
	button4.visible = false;
	button1.addClickListener(demorepeatfunction);
}	
public function testfunc():void
{	
	flag = 3;
	flag2 = 1;	
	scoreflag = 1;
	scoredenom = scoredenom +1;
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	
	nume1 = Math.ceil(Math.random() * 5);
	denom1 = Math.ceil(Math.random() * 5 + 4);
	
	nume2 = Math.ceil(Math.random() * 5);
	denom2 = Math.ceil(Math.random() * 5 + 4);
	
	label1.visible = true;
	label25.visible = false;
	
	label2 = new PIElabel(pieHandle, String(nume1), 25*(h/600), displayBColor, displayFColor);
	label2.x = 225*(w/800);
	label2.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label4 = new PIElabel(pieHandle, String(denom1), 25*(h/600), displayBColor, displayFColor);
	label4.x = 225*(w/800);
	label4.y = 55 * (h / 600);	
	pieHandle.addDisplayChild(label4);	
	label4.visible = true;	
	
	label3.visible = true;	
	
	label5 = new PIElabel(pieHandle, String(nume2), 25* (h / 600), displayBColor, displayFColor);
	label5.x = 600*(w/800);
	label5.y = 10 * (h / 600);	
	pieHandle.addDisplayChild(label5);	
	label5.visible = true;	
	
	label6 = new PIElabel(pieHandle, String(denom2), 25* (h / 600), displayBColor, displayFColor);
	label6.x = 600*(w/800);
	label6.y = 55 * (h / 600);
	pieHandle.addDisplayChild(label6);	
	label6.visible = true;
	
	label19.visible = true;
	
	scann9 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann9.x  = 260*(w/800);
	scann9.y  = 250*(h/600);
	scann9.width = 45*(w/800);
	scann9.height = 30*(h/600);
	scann9.border = true;
	pieHandle.addDisplayChild(scann9);
	scann9.visible = true;
	
	scann11 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann11.x  = 260*(w/800);
	scann11.y  = 295*(h/600);
	scann11.width = 45*(w/800);
	scann11.height = 30*(h/600);
	scann11.border = true;
	scann11.visible = false;
	pieHandle.addDisplayChild(scann11);
	
	label17 = new PIElabel(pieHandle,String((nume1*denom2)+(nume2*denom1)),25* (h / 600), displayBColor, displayFColor);
	label17.x = 360*(w/800);
	label17.y = 250 * (h / 600);	
	pieHandle.addDisplayChild(label17);	
	label17.visible = false;	
	
	label18 = new PIElabel(pieHandle,String(denom1*denom2),25* (h / 600), displayBColor, displayFColor);
	label18.x = 360*(w/800);
	label18.y = 295 * (h / 600);
	pieHandle.addDisplayChild(label18);	
	label18.visible = false;
	
	pieHandle.addDisplayChild(line7);
	line7.visible = true;
	
	button1.addClickListener(testrepeatfunc);
	button4.addClickListener(testfunc02);
}	
public function testfunc02():void
{
	scann9.border = false;
	scann11.visible = true;
	button1.addClickListener(testrepeatfunc);
	button4.addClickListener(testfunc2);
}	
public function testfunc2():void
{	
	scann9.border = true;
	if (int(scann9.text) == ((nume1*denom2)+(nume2*denom1)))
	{
		scann9.borderColor = 0X55961E;
	}
	else
	{		
		scann9.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	if (int(scann11.text) == (denom1*denom2))
	{
		scann11.borderColor = 0X55961E;
	}
	else
	{		
		scann11.borderColor = 0X990033;
		flag2 = 0;
		scoreflag = 0;
	}
	
	if ( scoreflag == 1)
	{
		scorenume = scorenume +1;
	}
	label25 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label25.x = 50*(w/800);
	label25.y = 350*(h/600);
	pieHandle.addDisplayChild(label25);
	label25.visible = true;
	
	button4.visible = false;
	
	if ( flag2 == 0)
	{
		label17.visible = true;
		label18.visible = true;
	}
}	
public function testfunc3():void
{
	scann9.visible = false;;
	scann11.visible = false;
	label19.visible = false;
	line7.visible = false;
	label25.visible = false;
	demofunc1();
}	
public function testrepeatfunc():void
{
	scann11.visible = false;
	scann9.visible = false;
	label17.visible = false;
	label18.visible = false;
	
	testfunc();
}	
/**
 *
 * This function is called by the PIE framework to reset the experiment to default values
 * It defines the values of all the global (static) variables
 *
 */
public function nextFrame():void
{

}



}

}
