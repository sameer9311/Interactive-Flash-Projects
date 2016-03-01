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

public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;

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
private var arrow1:PIEarrow;

private var scann:PIEinput;
private var scann2:PIEinput;
private var scann3:PIEinput;
private var checkvar1:Number;
private var checkvar2:Number;
private var checkvar3:Number;
private var scorenum:uint = 0;
private var scoredenom:uint = 0;
private var flag:uint;
private var getvalue:String;
/**
 *
 * This section contains Physics Parameters
 *
 */

private var currentTime:Number;
private var start:Number;
 
private var PIEaspectRatio:Number;
private var worldOriginX:Number;
private var worldOriginY:Number;
private var worldWidth:Number;
private var worldHeight:Number;

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
    pieHandle.PIEsetDrawingArea(1, 1);
	
	currentTime = 0.0;
	start = 0.0;
	
    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
	
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
	
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
	pieHandle.PIEsetUIpanelInvisible();
	
	/* load parameters */
	pieHandle.loadParameters();
	
    /* Set the Experiment Details */
    pieHandle.showExperimentName("Decimal to Percentage");
    pieHandle.showDeveloperName("Sameer Sonawane");
	
	/* read parameter */
	mode = pieHandle.getParameter("mode");
	
	button1 = new PIEbutton(pieHandle, "DisplayText");		
	button1.setActualSize( 100, 50);
	button1.label = 'REPEAT';
	button1.x = 100;
	button1.y = 400;
	button1.visible = true;
	pieHandle.addChild(button1);
	
	button2 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button2);	
	button2.visible = true;
	button2.setActualSize( 100, 50);
	button2.label = 'STEP';
	button2.x = 300;
	button2.y = 400;
	
	button3 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button3);
	button3.visible = true;
	button3.setActualSize( 100, 50);
	button3.label = 'AUTO';
	button3.x = 500;
	button3.y = 400;
	
	button4 = new PIEbutton(pieHandle, "DisplayText");
	pieHandle.addChild(button4);
	button4.visible = true;
	button4.setActualSize( 100, 50);
	button4.label = 'DONE';
	button4.x = 500;
	button4.y = 400;
	
	label1 = new PIElabel(pieHandle, "Decimal :", 25,  displayBColor, displayFColor);
	label1.x = 100;
	label1.y = 100;
	pieHandle.addDisplayChild(label1);
	label1.visible = false;	
	
	label3 = new PIElabel(pieHandle, "Percentage :", 25, displayBColor, displayFColor);
	label3.x = 75;
	label3.y = 200;
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	label5 = new PIElabel(pieHandle, " X      100", 25, displayBColor, displayFColor);
	label5.x = 400;
	label5.y = 200;
	
	arrow1 = new PIEarrow(pieHandle, 325, 135, 325, 195 , displayFColor);
	arrow1.changeBorder(4.0, displayFColor, 0.8);
	
	if (mode == "demo")
	{
		demofunc();	
		
	} 
	
	else if (mode == "interactive") 
	{
		/* start interactive mode */
		interactfunc();
	}
	
	else if (mode == "guided")
	{
		/* start guided mode */
		guidedfunc();
	} 
	
	else if (mode == "test")
	{
		/* start test mode */
		testfunc();
	} 
	
	else 
	{ 
		/* If no mode provided, start demo mode */
		demofunc();
		
	}
}	
public function nextFrame():void
{
	
}   

public function demofunc():void
{
	button4.visible = false;	
	
	button1.addClickListener(demorepeatfunction);	
	
	button2.addClickListener(demostepfunction1);	
	
	button3.addClickListener(demoautofunction1);
	
	rndnum = Math.random() * 10;
	rndnum = Number(rndnum.toPrecision(4));	
	
	label1.visible = true;	
	
	label2 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label2.x = 300;
	label2.y = 100;	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label3.visible = true;	
	
	label4 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label4.x = 300;
	label4.y = 200;			
	
	label6 = new PIElabel(pieHandle, (rndnum*100).toPrecision(5) + "     %", 25, displayBColor, displayFColor);
	label6.x = 300;
	label6.y = 250;	
	
	arrow1 = new PIEarrow(pieHandle, 325, 135, 325, 195 , displayFColor);
	arrow1.changeBorder(4.0, displayFColor, 0.8);
}	
public function demorepeatfunction():void
{	
	label2.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	arrow1.setPIEinvisible();
	demofunc();
}	

public function demostepfunction1():void
{
	label4.visible = true;
	pieHandle.addDisplayChild(label4);
	pieHandle.addDisplayChild(arrow1);
	arrow1.setPIEvisible();
	
	button2.addClickListener(demostepfunction2);	
}	
public function demostepfunction2():void
{	
	label5.visible = true;
	pieHandle.addDisplayChild(label5);
	
	button2.addClickListener(demostepfunction3);
}	
public function demostepfunction3():void
{
	label6.visible = true;
	pieHandle.addDisplayChild(label6);
	
	button1.addClickListener(demorepeatfunction);
	
}
public function demoautofunction1():void
{
	currentTime = 0.0;
	start = 1;
	
	setTimeout(demoautofunction2,500,0);	
}
public function demoautofunction2(ans:int):void
{
	if (ans == 0)
	{
		label4.visible = true;
		pieHandle.addDisplayChild(label4);
		pieHandle.addDisplayChild(arrow1);
		arrow1.setPIEvisible();
		setTimeout(demoautofunction2, 1000, 1);
	}
	if ( ans == 1)
	{
		label5.visible = true;
		pieHandle.addDisplayChild(label5);
		setTimeout(demoautofunction2, 1000, 2);
	}
	if ( ans == 2 )
	{
		label6.visible = true;
		pieHandle.addDisplayChild(label6);
	}
	
	button1.addClickListener(demorepeatfunction);
}	

public function interactfunc():void
{
	button4.visible = false;
	
	label1.visible = true;
	label3.visible = true;
	
	scann = new PIEinput(pieHandle, "", 6, 30, displayBColor, displayFColor);
	scann.x  = 300;
	scann.y  = 100;
	scann.width = 100;
	scann.height = 40;
	scann.border = true;
	pieHandle.addDisplayChild(scann);
	scann.visible = true;		
	
	button1.addClickListener(demorepeatfunction);
	button2.addClickListener(interactstepfunc1);
	button3.addClickListener(interactautofunc1);
	
}	

public function interactstepfunc1():void
{	
	rndnum = Number(scann.text);
	
	label4 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label4.x = 300;
	label4.y = 200;
	
	label6 = new PIElabel(pieHandle, (rndnum*100).toPrecision(5) + "     %", 25, displayBColor, displayFColor);
	label6.x = 300;
	label6.y = 250;
	
	label4.visible = true;
	pieHandle.addDisplayChild(label4);
	pieHandle.addDisplayChild(arrow1);
	arrow1.setPIEvisible();
	
	button2.addClickListener(interactstepfunc2);
	button1.addClickListener(interactrepeatfunc);
	
}

public function interactstepfunc2():void
{
	label5.visible = true;
	pieHandle.addDisplayChild(label5);
	
	button2.addClickListener(interactstepfunc3);
	button1.addClickListener(interactrepeatfunc);
}	

public function interactstepfunc3():void
{
	label6.visible = true;
	pieHandle.addDisplayChild(label6);
	
	button1.addClickListener(interactrepeatfunc);
}	

public function interactrepeatfunc():void
{
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	arrow1.setPIEinvisible();
	interactfunc();
}	

public function interactautofunc1():void
{
	rndnum = Number(scann.text);
	
	label4 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label4.x = 300;
	label4.y = 200;
	
	label6 = new PIElabel(pieHandle, (rndnum*100).toPrecision(5) + "     %", 25, displayBColor, displayFColor);
	label6.x = 300;
	label6.y = 250;
	
	setTimeout(interactautofunc2,500,0);
}
public function interactautofunc2(ans:int):void
{
	if (ans == 0)
	{
		label4.visible = true;
		pieHandle.addDisplayChild(label4);
		pieHandle.addDisplayChild(arrow1);
		arrow1.setPIEvisible();
		setTimeout(interactautofunc2, 1000, 1);
	}
	if ( ans == 1)
	{
		label5.visible = true;
		pieHandle.addDisplayChild(label5);
		setTimeout(interactautofunc2, 1000, 2);
	}
	if ( ans == 2 )
	{
		label6.visible = true;
		pieHandle.addDisplayChild(label6);
	}
	
	button1.addClickListener(interactrepeatfunc);
}	

public function guidedfunc():void
{
	
	button2.visible = false;
	button3.visible = false;
	
	
	rndnum = Math.random() * 10;
	rndnum = Number(rndnum.toPrecision(4));	
	
	label = new PIElabel(pieHandle, (rndnum*100).toPrecision(5) + "     %", 25, displayBColor, displayFColor);
	label.x = 450;
	label.y = 250;
	
	label7 = new PIElabel(pieHandle, "", 25, displayBColor, displayFColor);
	label7.x = 100;
	label7.y = 350;
	
	label1.visible = true;	
	
	label2 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label2.x = 300;
	label2.y = 100;	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label3.visible = true;	
	
	
	scann = new PIEinput(pieHandle, "", 6, 30, displayBColor, displayFColor);
	scann.x  = 300;
	scann.y  = 200;
	scann.width = 100;
	scann.height = 40;
	scann.border = true;
	pieHandle.addDisplayChild(scann);
	scann.visible = true;
	
	scann2 = new PIEinput(pieHandle, "X  ", 7, 30, displayBColor, displayFColor);
	scann2.x  = 400;
	scann2.y  = 200;
	scann2.width = 100;
	scann2.height = 40;
	scann2.border = true;
	
	scann3 = new PIEinput(pieHandle, "", 6, 30, displayBColor, displayFColor);
	scann3.x  = 300;
	scann3.y  = 250;
	scann3.width = 100;
	scann3.height = 40;
	scann3.border = true;
	
	pieHandle.addDisplayChild(arrow1);
	arrow1.setPIEvisible();	
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidefunc2);
}

public function guidefunc2():void
{
	checkvar1 = Number(scann.text);
	
	scann.border = false;
		
	pieHandle.addDisplayChild(scann2);
	scann2.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidefunc3);
}	

public function guidefunc3():void
{
	getvalue = scann2.text;
	
	scann2.border = false;	
	
	pieHandle.addDisplayChild(scann3);
	scann3.visible = true;
	
	button1.addClickListener(guiderepeatfunc);
	button4.addClickListener(guidefunc4);
}	

public function guidefunc4():void
{
	var trim:RegExp = /^\s+|\s+$/g;
	checkvar3 = Number(scann3.text);	
	
	scann.border = true;
	scann2.border = true;
	
	flag = 1;
	
	scoredenom = scoredenom + 1;
	
	if ( checkvar1 == rndnum )
	{
		scann.borderColor =  0X55961E;
	}
	else
	{
		flag = 0;
		scann.borderColor =  0X990033;
	}	

    checkvar2 = Number(getvalue.replace(/\D+/, ''));	
	
	
	if ( checkvar2 == 100 )
	{
		scann2.borderColor =  0X55961E;
	}
	else
	{
		flag = 0;
		scann2.borderColor =  0X990033;
	}	
	
	if ( checkvar3 == Number((rndnum*100).toPrecision(5)))
	{
		scann3.borderColor =  0X55961E;
	}
	else
	{
		flag = 0;
		scann3.borderColor =  0X990033;
		
		pieHandle.addDisplayChild(label);
		label.visible = true;		
	}	
	if ( flag == 1)
	{
		scorenum = scorenum + 1;
	}
	
	label7 = new PIElabel(pieHandle, "Your current score : "+scorenum+" / "+scoredenom , 25, displayBColor, displayFColor);
	label7.x = 100;
	label7.y = 300;	
	pieHandle.addDisplayChild(label7);
	label.visible = true;
	
	button1.addClickListener(guiderepeatfunc);	
}
public function guiderepeatfunc():void
{
	label2.visible = false;
	arrow1.setPIEinvisible();
	scann.visible = false;
	scann2.visible = false;
	scann3.visible = false;
	label.visible = false;
	label7.visible = false;
	
	guidedfunc();
}	

public function testfunc():void
{
	button2.visible = false;
	button3.visible = false;
	
	rndnum = Math.random() * 10;
	rndnum = Number(rndnum.toPrecision(4));	
	
		
	label = new PIElabel(pieHandle, (rndnum*100).toPrecision(5) + "     %", 25, displayBColor, displayFColor);
	label.x = 500;
	label.y = 200;
	
	label7 = new PIElabel(pieHandle, "", 25, displayBColor, displayFColor);
	label7.x = 100;
	label7.y = 350;
	
	label1.visible = true;	
	
	label2 = new PIElabel(pieHandle, String(rndnum), 25, displayBColor, displayFColor);
	label2.x = 300;
	label2.y = 100;	
	pieHandle.addDisplayChild(label2);	
	label2.visible = true;	
	
	label3.visible = true;	
	
	scann = new PIEinput(pieHandle, " ", 16, 30, displayBColor, displayFColor);
	scann.x  = 300;
	scann.y  = 200;
	scann.width = 150;
	scann.height = 40;
	scann.border = true;
	pieHandle.addDisplayChild(scann);
	scann.visible = true;
	
	button1.addClickListener(testrepeatfunc);
	button4.addClickListener(testfunc2);
}	
public function testfunc2():void
{
	checkvar1 = Number(scann.text);
	
	scoredenom = scoredenom + 1;
	
		
	if ( checkvar1 == Number((rndnum * 100).toPrecision(5)))
	{
		scann.borderColor = 0X55961E;
		scorenum = scorenum + 1;
	}
	else
	{
		scann.borderColor = 0X990033;
		pieHandle.addDisplayChild(label);
		label.visible = true;		
	}
	label7 = new PIElabel(pieHandle, "Your current score : "+scorenum+" / "+scoredenom , 25, displayBColor, displayFColor);
	label7.x = 100;
	label7.y = 300;	
	pieHandle.addDisplayChild(label7);
	label.visible = true;
	
	button1.addClickListener(testrepeatfunc);	
}	

public function testrepeatfunc():void
{
	label7.visible = false;
	label.visible = false;
	scann.visible = false;
	testfunc();
}	
/**
 *
 * This function is called by the PIE framework to reset the experiment to default values
 * It defines the values of all the global (static) variables
 *
 */

}

}


