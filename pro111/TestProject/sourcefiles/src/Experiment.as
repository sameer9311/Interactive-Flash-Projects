package
{
import flash.events.DRMCustomProperties;
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

/**
 *
 * This section contains screen Parameters
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
 * This section contains display Parameters
 *
 */

private var button1:PIEbutton;
private var button2:PIEbutton;
private var button3:PIEbutton;
private var button4:PIEbutton;
private var arrow1:PIEarrow;
private var arrow2:PIEarrow;
private var line1:PIEline;

private var label:PIElabel;
private var label1:PIElabel;
private var label2:PIElabel;
private var label3:PIElabel;
private var label4:PIElabel;
private var label5:PIElabel;
private var label6:PIElabel;
private var label7:PIElabel;
private var label8:PIElabel;

/**
 *
 * This section contains answer checking Parameters
 *
 */

private var num1:uint;
private var digit1:uint;
private var num2:uint;
private var digit2:uint;
private var scann1:PIEinput;
private var scann2:PIEinput;
private var scann3:PIEinput;
private var flag:int;
private var flag2:int;
private var flag3:int;
private var flag4:int;
private var scoreflag:int;
private var scorenume:int;
private var scoredenom:int;
private var checkvar1:int;
private var checkvar2:int;
private var checkvar3:int;


/**
 *
 * This section contains Drawing Objects
 *
 */
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
	
	arrow1 = new PIEarrow(pieHandle, 125*(w/800) , 140*(h/600) , 125*(w/800), 240*(h/600), displayFColor);
	arrow1.changeBorder(4.0, 0XE1DC28, 0.8);
	
	arrow2 = new PIEarrow(pieHandle, 365*(w/800) , 250*(h/600) , 515*(w/800), 145*(h/600), displayFColor);
	arrow2.changeBorder(4.0, 0XE1DC28, 0.8);
	
	line1 = new PIEline(pieHandle, 525*(w/800), 145*(h/600), 535*(w/800), 145*(h/600), 0XBFBFBF, 6, 0.8)
	pieHandle.addDisplayChild(line1);
	line1.visible = false;
	
	label2 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label2.x = 25*(w/800);
	label2.y = 30 * (h / 600);
	
	label6 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 30 * (h / 600);
	
	label3 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label3.x = 25*(w/800);
	label3.y = 30 * (h / 600);
	
	label4 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 30 * (h / 600);
	
	label5 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 30 * (h / 600);
	
	label1 = new PIElabel(pieHandle, "", 35*(h/600),  displayBColor, displayFColor);
	label1.x = 25*(w/800);
	label1.y = 30 * (h / 600);
	
	label7 = new PIElabel(pieHandle, "2", 25*(h/600),  0X0D0D0D, 0XBFBFBF);
	label7.x = 620*(w/800);
	label7.y = 30 * (h / 600);
	
	label8 = new PIElabel(pieHandle, "2", 25*(h/600),  0X0D0D0D, 0XBFBFBF);
	label8.x = 50*(w/800);
	label8.y = 350*(h/600);
	

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
	pieHandle.PIEsetUIpanelInvisible();
	/* load parameters */
	pieHandle.loadParameters();
    /* Set the Experiment Details */
    pieHandle.showExperimentName("Properties of Squares");
    pieHandle.showDeveloperName("Sameer Sonawane");
	/* read parameter */
	mode = pieHandle.getParameter("mode");
	/* init a label */
	var label:PIElabel;
	if (mode == "demo") {
		/* start demo mode */
		
		demofunc();
		
	} else if (mode == "interactive") {
		/* start interactive mode */
		
		interactfunc();
		
	} else if (mode == "guided") {
		/* start guided mode */
		scorenume = 0;
		scoredenom = 0;
		guidedfunc();
		
	} else if (mode == "test") {
		/* start test mode */
		scorenume = 0;
		scoredenom = 0;
		testfunc();
		
	} else { 
		/* If no mode provided, start demo mode */
		demofunc();
	}
   
}
public function demofunc():void
{
	button4.visible = false;
	button2.visible = true;
	button3.visible = true;
	flag = 0;	
	
	num1 = Math.ceil(Math.random() * 20 + 10);	
	
	num2 = Math.ceil(Math.random() * 20 + 10) * 10;	
	
	setTimeout(demostepfunc1, 500);
	
}
public function demostepfunc1():void
{
	label1 = new PIElabel(pieHandle, "Sum of first n odd natural numbers is n x n", 35*(h/600),  displayBColor, 0XE1DC28);
	label1.x = 25*(w/800);
	label1.y = 30*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
		
	button2.addClickListener(demostepfunc2);
	button1.addClickListener(demorepeatfunc);
	button3.addClickListener(demoautofunc);
}	
public function demostepfunc2():void
{	
	button3.visible = false;
	label2 = new PIElabel(pieHandle, "1 = ", 35*(h/600),  displayBColor, displayFColor);
	label2.x = 25*(w/800);
	label2.y = 100*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc3, 500);
	}
	
	button2.addClickListener(demostepfunc3);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc3():void
{	
	label2.visible = false;
	
	label2 = new PIElabel(pieHandle, "1 =  1 ", 35*(h/600),  displayBColor, displayFColor);
	label2.x = 25*(w/800);
	label2.y = 100*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc4, 500);
	}
	
	button2.addClickListener(demostepfunc4);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc4():void
{	
	label2.visible = false;
	
	label2 = new PIElabel(pieHandle, "1 =  1 = 1 x 1 ", 35*(h/600),  displayBColor, displayFColor);
	label2.x = 25*(w/800);
	label2.y = 100*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc5, 500);
	}
	
	button2.addClickListener(demostepfunc5);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc5():void
{	
	label3 = new PIElabel(pieHandle, "1 + 3  = ", 35*(h/600),  displayBColor, displayFColor);
	label3.x = 25*(w/800);
	label3.y = 160*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc6, 500);
	}
	
	button2.addClickListener(demostepfunc6);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc6():void
{	
	label3.visible = false;
	
	label3 = new PIElabel(pieHandle, "1 + 3 =  4 ", 35*(h/600),  displayBColor, displayFColor);
	label3.x = 25*(w/800);
	label3.y = 160*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc7, 500);
	}
	
	button2.addClickListener(demostepfunc7);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc7():void
{	
	label3.visible = false;
	
	label3 = new PIElabel(pieHandle, "1 + 3 =  4  = 2 x 2", 35*(h/600),  displayBColor, displayFColor);
	label3.x = 25*(w/800);
	label3.y = 160*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc8, 500);
	}
	
	button2.addClickListener(demostepfunc8);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc8():void
{	
	label4 = new PIElabel(pieHandle, "1 +  ", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 220*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc9, 500);
	}
	
	button2.addClickListener(demostepfunc9);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc9():void
{
	label4.visible = false;

	label4 = new PIElabel(pieHandle, "1 + 3 + ", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 220*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc10, 500);
	}
	
	button2.addClickListener(demostepfunc10);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc10():void
{
	label4.visible = false;

	label4 = new PIElabel(pieHandle, "1 + 3 + 5  =", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 220*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc11, 500);
	}
	
	button2.addClickListener(demostepfunc11);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc11():void
{
	label4.visible = false;

	label4 = new PIElabel(pieHandle, "1 + 3 + 5  = 9 ", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 220*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc12, 500);
	}
	
	button2.addClickListener(demostepfunc12);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc12():void
{
	label4.visible = false;

	label4 = new PIElabel(pieHandle, "1 + 3 + 5  = 9 = 3 x 3", 35*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 220*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc13, 500);
	}
	
	button2.addClickListener(demostepfunc13);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc13():void
{	
	label5 = new PIElabel(pieHandle, "1 ", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc14, 500);
	}
	
	button2.addClickListener(demostepfunc14);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc14():void
{	
	label5.visible = false;
	
	label5 = new PIElabel(pieHandle, "1 + 3", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc15, 500);
	}
	
	button2.addClickListener(demostepfunc15);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc15():void
{	
	label5.visible = false;
	
	label5 = new PIElabel(pieHandle, "1 + 3 + 5", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc16, 500);
	}
	
	button2.addClickListener(demostepfunc16);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc16():void
{	
	label5.visible = false;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc17, 500);
	}
	
	label5 = new PIElabel(pieHandle, "1 + 3 + 5 + 7", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	button2.addClickListener(demostepfunc17);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc17():void
{	
	label5.visible = false;
	
	label5 = new PIElabel(pieHandle, "1 + 3 + 5 + 7 = 16", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc18, 500);
	}
	
	button2.addClickListener(demostepfunc18);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc18():void
{	
	label5.visible = false;
	
	label5 = new PIElabel(pieHandle, "1 + 3 + 5 + 7 = 16 = 4 x 4", 35*(h/600),  displayBColor, displayFColor);
	label5.x = 25*(w/800);
	label5.y = 280*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc19, 500);
	}
	
	button2.addClickListener(demostepfunc19);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc19():void
{	
	label6 = new PIElabel(pieHandle, "1 ", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc20, 500);
	}
	
	button2.addClickListener(demostepfunc20);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc20():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc21, 500);
	}
	
	button2.addClickListener(demostepfunc21);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc21():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3 + 5", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc22, 500);
	}
	
	button2.addClickListener(demostepfunc22);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc22():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3 + 5 + 9", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc23, 500);
	}
	
	button2.addClickListener(demostepfunc23);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc23():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3 + 5 + 9 + 11", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc24, 500);
	}
	
	button2.addClickListener(demostepfunc24);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc24():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3 + 5 + 9 + 11 = 25", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc25, 500);
	}
	
	button2.addClickListener(demostepfunc25);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc25():void
{	
	label6.visible = false;
	
	label6 = new PIElabel(pieHandle, "1 + 3 + 5 + 9 + 11 = 25 = 5 x 5", 35*(h/600),  displayBColor, displayFColor);
	label6.x = 25*(w/800);
	label6.y = 340*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;	
	
	if (flag == 1)
	{
		setTimeout(demostepfunc26, 1500);
	}
	
	button2.addClickListener(demostepfunc26);
	button1.addClickListener(demorepeatfunc);
}

public function demostepfunc26():void
{	
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;	
	label7.visible = false;
	
	label1 = new PIElabel(pieHandle, "To find last digit of square of a number:", 30*(h/600),  displayBColor, 0XE1DC28);
	label1.x = 25*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc27, 1500);
	}
	
	button2.addClickListener(demostepfunc27);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc27():void
{
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num1), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 95*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	digit1 = (num1 % 10);
	
	if (flag == 1)
	{
		setTimeout(demostepfunc28, 1500);
	}
	
	button2.addClickListener(demostepfunc28);
	button1.addClickListener(demorepeatfunc);
	
}	
public function demostepfunc28():void
{
	label4 = new PIElabel(pieHandle, digit1 + "   X   " + digit1 + "   =   " + (digit1*digit1), 40*(h/600),  displayBColor, displayFColor);
	label4.x = 115*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc29, 1500);
	}
	
	button2.addClickListener(demostepfunc29);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc29():void
{
	label5 = new PIElabel(pieHandle, String(num1*num1), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 475*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;
	
	line1.visible = true;
	
	if (flag2 == 1)
	{
		button1.addClickListener(interactrepeatfunc);
		button2.visible = false;
		button3.visible = false;
	}
	else
	{
		button2.addClickListener(demostepfunc30);
		button1.addClickListener(demorepeatfunc);
		if (flag == 1 )
		{
		setTimeout(demostepfunc30, 1500);
		}
	}
	
	
}	
public function demostepfunc30():void
{	
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;	
	arrow1.visible = false;
	arrow2.visible = false;
	line1.visible = false;
	
	label1 = new PIElabel(pieHandle, "To find number of trailing zeroes in square of a number:", 30*(h/600),  displayBColor, 0XE1DC28);
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc31, 1500);
	}
	
	button2.addClickListener(demostepfunc31);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc31():void
{
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num2), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 75*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if ((num2 % 100) == 0)
	{
		digit2 = 2;
	}
	else if ((num2 % 10) == 0)
	{
		digit2 = 1;		
	}
	else
	{
		digit2 = 0;
	}
	
	if (flag == 1)
	{
		setTimeout(demostepfunc32, 1500);
	}
	
	button2.addClickListener(demostepfunc32);
	button1.addClickListener(demorepeatfunc);
	
}	
public function demostepfunc32():void
{
	label4 = new PIElabel(pieHandle, digit2 + "   X   2   =   " + (digit2*2), 40*(h/600),  displayBColor, displayFColor);
	label4.x = 115*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc33, 1500);
	}
	
	button2.addClickListener(demostepfunc33);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc33():void
{
	label5 = new PIElabel(pieHandle, String(num2*num2), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 455*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;
	
	if (flag2 == 2)
	{
		button1.addClickListener(interactrepeatfunc);
		button2.visible = false;
		button3.visible = false;
	}
	else
	{
		button2.addClickListener(demostepfunc34);
		button1.addClickListener(demorepeatfunc);
		if (flag == 1 )
		{
		setTimeout(demostepfunc34, 1500);
		}
	}
}	
public function demostepfunc34():void
{
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;	
	arrow1.visible = false;
	arrow2.visible = false;
	
	label1 = new PIElabel(pieHandle, "For natural numbers n and (n+1), there are \n 2n natural numbers between their squares", 30*(h/600),  displayBColor, 0XE1DC28);
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc35, 3500);
	}
	
	button2.addClickListener(demostepfunc35);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc35():void
{
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Two numbers:  1  2  3  4  ", 30 * (h / 600),  displayBColor, displayFColor);
	label1.htmlText = "Two numbers:     1 <u>2 3</u> 4   ";
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc36, 1500);
	}
	
	button2.addClickListener(demostepfunc36);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc36():void
{	
	label2 = new PIElabel(pieHandle, "Four numbers: 1  2  3  4 5 6 7 8 9    ", 30 * (h / 600),  displayBColor, displayFColor);
	label2.htmlText = "Four numbers:    4 <u>5 6 7 8</u> 9 ";
	label2.x = 15*(w/800);
	label2.y = 130*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc37, 1500);
	}
	
	button2.addClickListener(demostepfunc37);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc37():void
{	
	
	label3 = new PIElabel(pieHandle, "Two numbers: 1  2  3  4 5 6 7 8 9 10 11 12 13 14 15 16", 30 * (h / 600),  displayBColor, displayFColor);
	label3.htmlText = "Six numbers:     9 <u>10 11 12 13 14 15</u> 16";
	label3.x = 15*(w/800);
	label3.y = 220*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if (flag == 1)
	{
		setTimeout(demostepfunc38, 1500);
	}
	
	button2.addClickListener(demostepfunc38);
	button1.addClickListener(demorepeatfunc);
}	
public function demostepfunc38():void
{	
	
	label4 = new PIElabel(pieHandle, "Two numbers: 1  2  3  4 5 6 7 8 9 10 11 12 13 14 15 16", 30 * (h / 600),  displayBColor, displayFColor);
	label4.htmlText = "Eight numbers:   16 <u>17 18 19 20 21 22 23 24</u> 25";
	label4.x = 15*(w/800);
	label4.y = 310*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;	
	
	button2.visible = false;
	button3.visible = false;
	button1.visible = true;
	
	button1.addClickListener(demorepeatfunc);
}	
public function demoautofunc():void
{	
	button2.visible = false;
	button3.visible = false;
	button1.visible = false;
	flag = 1;
	setTimeout(demostepfunc2, 500);
}	

public function demorepeatfunc():void
{
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	label7.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	line1.visible = false;
	
	demofunc();
	
}	
public function interactfunc():void
{	
	flag = 0;
	flag2 = 1;
	button4.visible = false;
	button2.visible = true;
	button3.visible = true;
	
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;	
	
	
	scann1 = new PIEinput(pieHandle, "", 2, 30*(h/600), displayBColor, displayFColor);
	scann1.x  = 620*(w/800);
	scann1.y  = 40*(h/600);
	scann1.width = 50*(w/800);
	scann1.height = 40*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = true;
	
	scann2 = new PIEinput(pieHandle, "", 3, 30*(h/600), displayBColor, displayFColor);
	scann2.x  = 680*(w/800);
	scann2.y  = 40*(h/600);
	scann2.width = 50*(w/800);
	scann2.height = 40*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;	
	
	label1 = new PIElabel(pieHandle, "Enter a number to find last digit of its square:",30 * (h / 600),  displayBColor, displayFColor);
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;		
	
	button1.addClickListener(interactfunc2);
	button2.addClickListener(interactstepfunc1);
	button3.addClickListener(interactautofunc1);
}
public function interactstepfunc1():void
{
	scann2.visible = false;
	num1 = uint(scann1.text);
	scann1.visible = false;
	demostepfunc27();
}
public function interactautofunc1():void
{
	flag = 1;
	scann2.visible = false;
	num1 = uint(scann1.text);
	scann1.visible = false;
	demostepfunc27();
}
public function interactfunc2():void
{
	flag = 0;
	flag2 = 2;
	button4.visible = false;	
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	scann1.visible = false;	
	
	button2.visible = true;
	button3.visible = true;
	
	scann2.visible = true;
	
	label1 = new PIElabel(pieHandle, "Enter a number to find trailing zeroes in its square:",30 * (h / 600),  displayBColor, displayFColor);
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	button1.addClickListener(interactfunc);
	button2.addClickListener(interactstepfunc2);
	button3.addClickListener(interactautofunc2);
}	
public function interactstepfunc2():void
{
	num2 = uint(scann2.text);
	scann2.visible = false;
	demostepfunc31();
}	
public function interactautofunc2():void
{
	flag = 1;
	num2 = uint(scann2.text);
	scann2.visible = false;
	demostepfunc31();
}
public function interactrepeatfunc():void
{
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;	
	arrow1.visible = false;
	arrow2.visible = false;
	scann1.visible = false;
	scann2.visible = false;
	line1.visible = false;
		
	if ( flag2 == 2)
	{
	interactfunc();
	}
	else 
	{
	interactfunc2();
	}
	
}	
public function guidedfunc():void
{
	flag3 = 1;
	
	label8.visible = false;
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	
	num1 = Math.ceil(Math.random() * 20 + 10);		
	num2 = Math.ceil(Math.random() * 20 + 10) * 10;
	
	scoredenom = scoredenom +1;
	scoreflag = 1;
	
	scann1 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann1.x  = 115*(w/800);
	scann1.y  = 250*(h/600);
	scann1.width = 50*(w/800);
	scann1.height = 40*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;
	
	scann2 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann2.x  = 220*(w/800);
	scann2.y  = 250*(h/600);
	scann2.width = 50*(w/800);
	scann2.height = 40*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;
	
	scann3 = new PIEinput(pieHandle, "", 2, 30*(h/600), displayBColor, displayFColor);
	scann3.x  = 310*(w/800);
	scann3.y  = 250*(h/600);
	scann3.width = 50*(w/800);
	scann3.height = 40*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;
	
	label1 = new PIElabel(pieHandle, "To find last digit of square of a number:", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 25*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	setTimeout(guidedfunc2, 1000);
}	
public function guidedfunc2():void
{
	flag3 = 2;
	
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num1), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 95*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	digit1 = (num1 % 10);
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	scann1.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc3);
	
	
}	
public function guidedfunc3():void
{
	scann1.border = false;
	
	label4 = new PIElabel(pieHandle, "X" , 30*(h/600),  displayBColor, displayFColor);
	label4.x = 180*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	scann2.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc4);
	
}
public function guidedfunc4():void
{
	scann2.border = false;
	
	label6 = new PIElabel(pieHandle, "=", 40*(h/600),  displayBColor, displayFColor);
	label6.x = 280*(w/800);
	label6.y = 250*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	scann3.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc5);
}
public function guidedfunc5():void
{
	checkvar1 = int(scann1.text);
	checkvar2 = int(scann2.text);
	checkvar3 = int(scann3.text);
	
	scann1.border = true;
	scann2.border = true;
	
	if ( checkvar1 == (num1 % 10))
	{
		scann1.borderColor = 0X55961E;
	}
	else
	{
		scann1.borderColor = 0X990033;
		scoreflag = 0;
	}
	if ( checkvar2 == (num1 % 10))
	{
		scann2.borderColor = 0X55961E;
	}
	else
	{
		scann2.borderColor = 0X990033;
		scoreflag = 0;
	}
	if ( checkvar3 == (num1%10)*(num1%10))
	{
		scann3.borderColor = 0X55961E;
	}
	else
	{
		scann3.borderColor = 0X990033;
		scoreflag = 0;
	}
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;	
	
	label5 = new PIElabel(pieHandle, String(num1*num1), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 475*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if ( scoreflag == 1)
	{
		scorenume = scorenume +1;
	}
	
	label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 350*(h/600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	
	button4.visible = false;
	button1.addClickListener(guiderepeatfunc);
	
}
public function guiderepeatfunc():void
{
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;	
	label6.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	scann1.visible = false;
	scann2.visible = false;
	scann3.visible = false;
	label8.visible = false;
	
	if (flag3 == 2)
	{
		guidedfunc6();
	}
	else
	{
		guidedfunc();
	}
}
public function guidedfunc6():void
{
	flag3 = 1;
	button4.visible = true;
	
	scoredenom = scoredenom + 1;
	scoreflag = 1;
	
	scann1 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann1.x  = 115*(w/800);
	scann1.y  = 250*(h/600);
	scann1.width = 50*(w/800);
	scann1.height = 40*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;;
	
	scann2 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann2.x  = 220*(w/800);
	scann2.y  = 250*(h/600);
	scann2.width = 50*(w/800);
	scann2.height = 40*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;
	
	scann3 = new PIEinput(pieHandle, "", 2, 30*(h/600), displayBColor, displayFColor);
	scann3.x  = 310*(w/800);
	scann3.y  = 250*(h/600);
	scann3.width = 50*(w/800);
	scann3.height = 40*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;
	
	label1 = new PIElabel(pieHandle, "To find number of trailing zeroes in square of a number:", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 15*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	setTimeout(guidedfunc7, 1000);
}
public function guidedfunc7():void
{
		
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num2), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 70*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if ((num2 % 100) == 0)
	{
		digit2 = 2;
	}
	else if ((num2 % 10) == 0)
	{
		digit2 = 1;		
	}
	else
	{
		digit2 = 0;
	}
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	scann1.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc8);
	
	
}	
public function guidedfunc8():void
{
	scann1.border = false;
	
	label4 = new PIElabel(pieHandle, "X" , 30*(h/600),  displayBColor, displayFColor);
	label4.x = 180*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	scann2.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc9);
	
}
public function guidedfunc9():void
{
	scann2.border = false;
	
	label6 = new PIElabel(pieHandle, "=", 40*(h/600),  displayBColor, displayFColor);
	label6.x = 280*(w/800);
	label6.y = 250*(h/600);
	pieHandle.addDisplayChild(label6);
	label6.visible = true;
	
	scann3.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidedfunc10);
}
public function guidedfunc10():void
{
	checkvar1 = int(scann1.text);
	checkvar2 = int(scann2.text);
	checkvar3 = int(scann3.text);
	
	scann1.border = true;
	scann2.border = true;
	
	if ( checkvar1 == digit2)
	{
		scann1.borderColor = 0X55961E;
	}
	else
	{
		scann1.borderColor = 0X990033;
		scoreflag = 0;
	}
	if ( checkvar2 == 2)
	{
		scann2.borderColor = 0X55961E;
	}
	else
	{
		scann2.borderColor = 0X990033;
		scoreflag = 0;
	}
	if ( checkvar3 == (digit2*2))
	{
		scann3.borderColor = 0X55961E;
	}
	else
	{
		scann3.borderColor = 0X990033;
		scoreflag = 0;
	}
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;	
	
	label5 = new PIElabel(pieHandle, String(num2*num2), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 475*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if ( scoreflag == 1)
	{
		scorenume = scorenume +1;
	}
	
	label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 350*(h/600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	
	
	button4.visible = false;
	button1.addClickListener(guiderepeatfunc);
	
}
public function testfunc():void
{
	flag4 = 1;
	
	scoreflag = 1;
	scoredenom = scoredenom +1;
	label8.visible = false;
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	
	num1 = Math.ceil(Math.random() * 20 + 10);		
	num2 = Math.ceil(Math.random() * 20 + 10) * 10;
	
	scann1 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann1.x  = 500*(w/800);
	scann1.y  = 190*(h/600);
	scann1.width = 50*(w/800);
	scann1.height = 40*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;	
	
	label4 = new PIElabel(pieHandle, "To find last digit of square of a number:", 30*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 40*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	setTimeout(testfunc2, 500);
}
public function testfunc2():void
{
	flag4 = 2;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 140*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Last digit of square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 400*(w/800);
	label2.y = 140*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num1), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 95*(w/800);
	label3.y = 190*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	scann1.visible = true;
	
	button1.addClickListener(testrepeatfunc);
	button4.addClickListener(testfunc3);
}	
public function testfunc3():void
{
	checkvar1 = int(scann1.text);
	
	
	
	if ( checkvar1 == (((num1 % 10) * (num1 % 10)) % 10) )
	{
		scann1.borderColor = 0X55961E;
		button1.addClickListener(testrepeatfunc);
		
		scorenume = scorenume + 1;
		
		label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
		label8.x = 50*(w/800);
		label8.y = 350*(h/600);
		pieHandle.addDisplayChild(label8);
		label8.visible = true;
		
		button4.visible = false;
		
	}
	else
	{
		scann1.borderColor = 0X990033;
		flag = 1;
		
		label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
		label8.x = 50*(w/800);
		label8.y = 350*(h/600);
		pieHandle.addDisplayChild(label8);
		label8.visible = true;
		
		button4.visible = false;
		
		setTimeout(testrepeatfunc, 1000);
		
	}
}
public function testrepeatfunc():void
{
	scann1.visible = false;
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	label8.visible = false;
		
	if (flag4 == 2)
		{
			if (flag == 1)
			{
				testfunc4();
			}
			else
			{
			testfunc7();
			}
		}
		else
		{
			if (flag == 1)
			{
				testfunc10();
			}
			else
			{
				testfunc();
			}
		}
	
}	
public function testfunc4():void
{
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num1), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 95*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	digit1 = (num1 % 10);
	
	if (flag == 1)
	{
		setTimeout(testfunc5, 1500);
	}
	
	
}	
public function testfunc5():void
{
	label4 = new PIElabel(pieHandle, digit1 + "   X   " + digit1 + "   =   " + (digit1*digit1), 40*(h/600),  displayBColor, displayFColor);
	label4.x = 115*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	if (flag == 1)
	{
		setTimeout( testfunc6, 1500);
	}
	
	
}	
public function testfunc6():void
{
	flag = 0;
	
	label5 = new PIElabel(pieHandle, String(num1*num1), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 475*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;	
	
	button1.addClickListener(testrepeatfunc);
}	
public function testfunc7():void
{
	flag4 = 1;
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	
	scoredenom = scoredenom + 1;
	scoreflag = 1;
	
	num1 = Math.ceil(Math.random() * 20 + 10);		
	num2 = Math.ceil(Math.random() * 20 + 10) * 10;
	
	scann1 = new PIEinput(pieHandle, "", 1, 30*(h/600), displayBColor, displayFColor);
	scann1.x  = 500*(w/800);
	scann1.y  = 190*(h/600);
	scann1.width = 50*(w/800);
	scann1.height = 40*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;	
	
	label4 = new PIElabel(pieHandle, "To find number of trailing zeroes in square of a number:", 30*(h/600),  displayBColor, displayFColor);
	label4.x = 25*(w/800);
	label4.y = 40*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	setTimeout(testfunc8, 1000);
}
public function testfunc8():void
{
	flag4 = 1;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 140*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Number of zeroes in square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 350*(w/800);
	label2.y = 140*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num2), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 95*(w/800);
	label3.y = 190*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	scann1.visible = true;
	
	button4.addClickListener(testfunc9);
}	
public function testfunc9():void
{
	checkvar1 = int(scann1.text);
	
	if ((num2 % 100) == 0)
	{
		digit2 = 2;
	}
	else if ((num2 % 10) == 0)
	{
		digit2 = 1;		
	}
	else
	{
		digit2 = 0;
	}
	
	
	
	if ( checkvar1 == (digit2*2) )
	{
		scann1.borderColor = 0X55961E;
		button1.addClickListener(testrepeatfunc);
		
		scorenume = scorenume +1;
		
		label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
		label8.x = 50*(w/800);
		label8.y = 350*(h/600);
		pieHandle.addDisplayChild(label8);
		label8.visible = true;
		
		button4.visible = false;
	}
	else
	{
		scann1.borderColor = 0X990033;
		flag = 1;
		
		label8 = new PIElabel(pieHandle, "Your current score :"+scorenume+" / "+scoredenom, 40*(h/600),  displayBColor, displayFColor);
		label8.x = 50*(w/800);
		label8.y = 350*(h/600);
		pieHandle.addDisplayChild(label8);
		label8.visible = true;
		
		button4.visible = false;
		
		setTimeout(testrepeatfunc, 1000);
		
	}
}	
public function testfunc10():void
{
	label1.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number", 30*(h/600),  displayBColor, displayFColor);
	label1.x = 75*(w/800);
	label1.y = 40*(h/600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label2 = new PIElabel(pieHandle, "Square", 30*(h/600),  displayBColor, displayFColor);
	label2.x = 475*(w/800);
	label2.y = 40*(h/600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	label3 = new PIElabel(pieHandle, String(num2), 40*(h/600),  displayBColor, displayFColor);
	label3.x = 75*(w/800);
	label3.y = 90*(h/600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	if ((num2 % 100) == 0)
	{
		digit2 = 2;
	}
	else if ((num2 % 10) == 0)
	{
		digit2 = 1;		
	}
	else
	{
		digit2 = 0;
	}
	
	if (flag == 1)
	{
		setTimeout(testfunc11, 1500);
	}
	
	
	
}	
public function testfunc11():void
{
	label4 = new PIElabel(pieHandle, digit2 + "   X   2   =   " + (digit2*2), 40*(h/600),  displayBColor, displayFColor);
	label4.x = 115*(w/800);
	label4.y = 250*(h/600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.visible = true;
	
	if (flag == 1)
	{
		setTimeout(testfunc12, 1500);
	}
	
	
}	
public function testfunc12():void
{
	flag = 0;
	
	label5 = new PIElabel(pieHandle, String(num2*num2), 40*(h/600),  displayBColor, displayFColor);
	label5.x = 455*(w/800);
	label5.y = 90*(h/600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	pieHandle.addDisplayChild(arrow2);
	arrow2.visible = true;
	
	button1.addClickListener(testrepeatfunc);
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
