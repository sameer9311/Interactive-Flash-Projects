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

private var captureData:PIEobservationTable;
private var oTableX:Number;
private var oTableY:Number;
private var oTableRows:Number;
private var oTableColumns:Number;
private var currentObservation:uint;
private var currentEntryColumn:uint;

private var scann1:PIEinput;
private var scann2:PIEinput;
private var scann3:PIEinput;
private var scann4:PIEinput;
private var scann5:PIEinput;
private var scann6:PIEinput;
private var scann7:PIEinput;
private var scann8:PIEinput;
private var scann9:PIEinput;

private var num1:uint;
private var num2:uint;
private var num3:uint;
private var num4:uint;
private var num5:uint;
private var num6:uint;
private var num7:uint;
private var num8:uint;
private var num9:uint;

private var str1:String;

private var sum1:uint;

private var checkvar1:int;
private var checkvar2:int;
private var checkvar3:Number;

private var flag1:uint;
private var flag2:uint;
private var flag3:uint;
private var flag4:uint;

private var scoreflag:int;
private var scorenume:int;
private var scoredenom:int;

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
	button4.y = 570*(h/600);
	
	arrow1 = new PIEarrow(pieHandle, 125*(w/800) , 140*(h/600) , 125*(w/800), 140*(h/600), displayFColor);
	arrow1.changeBorder(4.0, 0XE1DC28, 0.8);
	
	arrow2 = new PIEarrow(pieHandle, 365*(w/800) , 250*(h/600) , 515*(w/800), 145*(h/600), displayFColor);
	arrow2.changeBorder(4.0, 0XE1DC28, 0.8);
	
	line1 = new PIEline(pieHandle , 350*(w/800) , 340*(h/600) , 380*(w/800), 340*(h/600),  0XBFBFBF,4, 0.8);
	
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
	label8.y = 350 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = false;
	

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
	pieHandle.PIEsetUIpanelInvisible();
	/* load parameters */
	pieHandle.loadParameters();
    /* Set the Experiment Details */
    pieHandle.showExperimentName("Probability of events based on Observation Table");
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
	flag1 = 0;	
	
	button4.visible = false;
	button2.visible = true;
	button3.visible = true;
	
	label1 = new PIElabel(pieHandle, "Number of children", 25*(h/600),  displayBColor, displayFColor);
	label1.x = 300*(w/800);
	label1.y = 15 * (h / 600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	num1 = Math.ceil(Math.random() * 50);
	num2 = Math.ceil(Math.random() * 50);
	num3 = Math.ceil(Math.random() * 50);
	num4 = Math.ceil(Math.random() * 50);
	num5 = Math.ceil(Math.random() * 50);
	num6 = Math.ceil(Math.random() * 50);
	num7 = Math.ceil(Math.random() * 50);
	num8 = Math.ceil(Math.random() * 50);
	num9 = Math.ceil(Math.random() * 50);
	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	oTableX = 50*(w/800);
    oTableY = 70*(h/600);
    oTableRows = 5;
    oTableColumns = 5;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
	pieHandle.addDisplayChild(captureData);
	captureData.visible = true;
	
	initializetable();
}	
public function initializetable():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	captureData.setDefaultColor(displayFColor);
	captureData.highlightTable(displayBColor);
	captureData.setFColorTable(displayFColor);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
	
	captureData.setEditableTable(false);
	
	if ( h >= 610 )
	{
		captureData.setTextHeightTable(25*(w / 800)/(h/600));
	}
	else
	{
		captureData.setTextHeightTable(25*(h / 600)/(w / 800));
	}
	
	captureData.setTextCell(0, 0, "    Monthly income    ");
    captureData.setTextCell(1, 0, "    < 7000    ");
    captureData.setTextCell(2, 0, "    7000-15000   ");
	captureData.setTextCell(3, 0, "    >15000    ");
	captureData.setTextCell(4, 0, "    Sum    ");
	captureData.setTextCell(0, 1, "    0-1    ");
    captureData.setTextCell(0, 2, "    2-3    ");
    captureData.setTextCell(0, 3, "    > 3    ");
	captureData.setTextCell(0, 4, "    Sum    ");
	
	captureData.setTextCell(1, 1, "     "+(num1));
	captureData.setTextCell(1, 2, "     "+(num2));
	captureData.setTextCell(1, 3, "     " +(num3));
	captureData.setTextCell(1, 4, "     "+(num1+num2+num3));
	
	captureData.setTextCell(2, 1, "     "+(num4));
	captureData.setTextCell(2, 2, "     "+(num5));
	captureData.setTextCell(2, 3, "     " +(num6));
	captureData.setTextCell(2, 4, "     " +(num4+num5+num6));
	
	captureData.setTextCell(3, 1, "     "+(num7));
	captureData.setTextCell(3, 2, "     "+(num8));
	captureData.setTextCell(3, 3, "     " +(num9));
	captureData.setTextCell(3, 4, "     " + (num7+num8+num9));
	
	captureData.setTextCell(4, 1, "     " + (num1+num4+num7));
	captureData.setTextCell(4, 2, "     " + (num2+num5+num8));
	captureData.setTextCell(4, 3, "     " + (num3 + num6 + num9));
	
	captureData.width = 600 * (w / 800);
	captureData.height = 175 * (h / 600);
	
	
	if ( flag2 == 1)
	{
		guidedfunc2();
	}
	else if ( flag2 == 2)
	{
		guidedfunc8();
	}
	else
	{
	captureData.setTextCell(4, 4, "     " + (num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9));
	}
	
	button2.addClickListener(demostepfunc1);
	button3.addClickListener(demoautofunc1);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc1():void
{	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(7000-15000)\nchildren(2-3) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc2, 1000);
	}
	
	button2.addClickListener(demostepfunc2);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc2():void
{
	label2 = new PIElabel(pieHandle, String(num5), 25*(h/600),  displayBColor, displayFColor);
	label2.x = 350*(w/800);
	label2.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	arrow1 = new PIEarrow(pieHandle, 400 * (w / 800), 150 * (h / 600) , 370 * (w / 800) , 300 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow1);
	arrow1.changeBorder( 4, 0XE1DC28, 0.4);
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc3, 1000);
	}
	
	button2.addClickListener(demostepfunc3);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc3():void
{
	label3 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  displayBColor, displayFColor);
	label3.x = 350*(w/800);
	label3.y = 345 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
		
	arrow2 = new PIEarrow(pieHandle, 600 * (w / 800), 220 * (h / 600) , 390 * (w / 800) , 350 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow2);
	arrow2.changeBorder( 4, 0XE1DC28, 0.4);
	
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc4, 1000);
	}
	
	button2.addClickListener(demostepfunc4);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc4():void
{
	label4 = new PIElabel(pieHandle, " = "+ (num5/sum1).toPrecision(3), 25*(h/600), displayBColor, displayFColor);
	label4.x = 450*(w/800);
	label4.y = 320 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
		
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	if ( flag4 == 1)
	{
		setTimeout(testfunc4,1000);
	}
	
	else if ( flag3 == 1)
	{
		if ( flag1 == 1)
		{
		setTimeout(interactautofunc2, 2000);
		}
		button2.addClickListener(interactstepfunc2);
	}
	else
	{
		if ( flag1 == 1)
		{
		setTimeout(demostepfunc5, 2000);
		}
		button2.addClickListener(demostepfunc5);
		button1.addClickListener(demorepeatfunc);
	}
}
public function demostepfunc5():void
{	
	label2.visible = false;	
	label3.visible = false;	
	label4.visible = false;
	label5.visible = false;
	line1.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	label5 = new PIElabel(pieHandle, "Probability \nchildren(>3) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc6, 1000);
	}
	
	button2.addClickListener(demostepfunc6);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc6():void
{
	
	label2 = new PIElabel(pieHandle, String(num3+num6+num9), 25*(h/600),  displayBColor, displayFColor);
	label2.x = 350*(w/800);
	label2.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	arrow1 = new PIEarrow(pieHandle, 500 * (w / 800), 225 * (h / 600) , 370 * (w / 800) , 300 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow1);
	arrow1.changeBorder( 4, 0XE1DC28, 0.4);
	arrow1.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc7, 1000);
	}
	
	button2.addClickListener(demostepfunc7);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc7():void
{
	label3 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  displayBColor, displayFColor);
	label3.x = 350*(w/800);
	label3.y = 345 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	
	arrow2 = new PIEarrow(pieHandle, 600 * (w / 800), 220 * (h / 600) , 390 * (w / 800) , 350 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow2);
	arrow2.changeBorder( 4, 0XE1DC28, 0.4);
	
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc8, 1000);
	}
	
	button2.addClickListener(demostepfunc8);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc8():void
{
	label4 = new PIElabel(pieHandle, " = "+ ((num3+num6+num9)/sum1).toPrecision(3), 25*(h/600),  displayBColor, displayFColor);
	label4.x = 450*(w/800);
	label4.y = 320 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
		
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	if ( flag4 == 2)
	{
		setTimeout(testfunc6, 1000);
	}
	
	 else if ( flag3 == 1)
	{
		if ( flag1 == 1)
		{
		setTimeout(interactautofunc3, 2000);
		}
		button2.addClickListener(interactstepfunc3);
	}
	else
	{
		if ( flag1 == 1)
		{
		setTimeout(demostepfunc9, 2000);
		}
		button2.addClickListener(demostepfunc9);
		button1.addClickListener(demorepeatfunc);
	}
}
public function demostepfunc9():void
{	
	label2.visible = false;	
	label3.visible = false;	
	label4.visible = false;
	label5.visible = false;
	line1.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(7000-15000) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc10, 1000);
	}
	
	button2.addClickListener(demostepfunc10);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc10():void
{
	
	label2 = new PIElabel(pieHandle, String(num4+num5+num6), 25*(h/600),  displayBColor, displayFColor);
	label2.x = 350*(w/800);
	label2.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label2);
	label2.visible = true;
	
	arrow1 = new PIEarrow(pieHandle, 600 * (w / 800), 150 * (h / 600) , 370 * (w / 800) , 300 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow1);
	arrow1.changeBorder( 4, 0XE1DC28, 0.4);
	arrow1.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc11, 1000);
	}
	
	button2.addClickListener(demostepfunc11);
	button1.addClickListener(demorepeatfunc);	
}	
public function demostepfunc11():void
{
	label3 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  displayBColor, displayFColor);
	label3.x = 350*(w/800);
	label3.y = 345 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = true;
	
	arrow2 = new PIEarrow(pieHandle, 600 * (w / 800), 220 * (h / 600) , 390 * (w / 800) , 350 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow2);
	arrow2.changeBorder( 4, 0XE1DC28, 0.4);
	
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	if ( flag1 == 1)
	{
		setTimeout(demostepfunc12, 1000);
	}
	
	button2.addClickListener(demostepfunc12);
	button1.addClickListener(demorepeatfunc);
}
public function demostepfunc12():void
{
	label4 = new PIElabel(pieHandle, " = "+ ((num4+num5+num6)/sum1).toPrecision(3), 25*(h/600),  displayBColor, displayFColor);
	label4.x = 450*(w/800);
	label4.y = 320 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
		
	pieHandle.addDisplayChild(line1);
	line1.visible = true;
	
	button2.visible = false;
	button3.visible = false;
	
	if ( flag4 == 3)
	{
		flag1 = 0;
		setTimeout(testrepeatfunc, 1000);
	}
	else if ( flag3 == 1)
	{
		button1.addClickListener(interactrepeatfunc);
	}
	else
	{
		button1.addClickListener(demorepeatfunc);
	}
	
}
public function demoautofunc1():void
{
	flag1 = 1;
	demostepfunc1();
}	
public function demorepeatfunc():void
{
	captureData.visible = false;
	label1.visible = false;
	label2.visible = false;	
	label3.visible = false;	
	label4.visible = false;
	label5.visible = false;
	line1.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;	
	
	demofunc();
}	
public function guidedfunc():void
{
	label4.visible = false;
	
	scoreflag = 1;
	scoredenom = scoredenom + 1;
	
	scann1 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann1.x  = 350*(w/800);
	scann1.y  = 300*(h/600);
	scann1.width = 60*(w/800);
	scann1.height = 30*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;
	
	scann2 = new PIEinput(pieHandle, "", 3, 25*(h/600), displayBColor, displayFColor);
	scann2.x  = 350*(w/800);
	scann2.y  = 345*(h/600);
	scann2.width = 60*(w/800);
	scann2.height = 30*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;
	
	scann3 = new PIEinput(pieHandle, "",5, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 475*(w/800);
	scann3.y  = 320*(h/600);
	scann3.width = 80*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;
	
	button2.visible = false;
	flag2 = 1;
	demofunc();
}	
public function guidedfunc2():void
{
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(7000-15000)\nchildren(0-1) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	button4.addClickListener(guidedfunc3);
	button1.addClickListener(guidedrepeatfunc);
	captureData.setEditableCell(4, 4, true);
	captureData.highlightCell(4, 4, 0x0000CC );
	
}
public function guidedfunc3():void
{
	captureData.setEditableCell(4, 4, false );
	
	label6 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  displayBColor, displayFColor);
	label6.x = 550*(w/800);
	label6.y = 275 * (h / 600);
	pieHandle.addDisplayChild(label6);
	label6.visible = false;
	
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;		
	
	eText = captureData.getText(4,4);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	
	if ( lNumber == sum1 )
	{
		captureData.highlightCell(4, 4, 0X55961E);
		guidedfunc4();
	}
	else
	{
		captureData.highlightCell(4, 4, 0X990033);	
		label6.visible = true;
		scoreflag = 0;
		guidedfunc4();
	}
	button1.addClickListener(guidedrepeatfunc);
	
}	
public function guidedfunc4():void
{	
	arrow1 = new PIEarrow(pieHandle, 300 * (w / 800), 150 * (h / 600) , 370 * (w / 800) , 300 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow1);
	arrow1.changeBorder( 4, 0XE1DC28, 0.4);
	arrow1.visible = true;
	
	arrow2 = new PIEarrow(pieHandle, 600 * (w / 800), 270 * (h / 600) , 390 * (w / 800) , 350 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow2);
	arrow2.changeBorder( 4, 0XE1DC28, 0.4);
	arrow2.visible = false;
	
	scann1.visible = true;
	
	pieHandle.addDisplayChild(line1);
	line1.visible = true;	
	
	button1.addClickListener(guidedrepeatfunc);
	button4.addClickListener(guidedfunc04);
}	
public function guidedfunc04():void
{
	arrow1.visible = false;
	arrow2.visible = true;
	scann2.visible = true;
	button1.addClickListener(guidedrepeatfunc);
	button4.addClickListener(guidedfunc5);
}	
public function guidedfunc5():void
{
	scann1.border = false;
	scann2.border = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	label4 = new PIElabel(pieHandle, " =", 25*(h/600),  displayBColor, displayFColor);
	label4.x = 430*(w/800);
	label4.y = 320 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	scann3.visible = true;
	
	button1.addClickListener(guidedrepeatfunc);
	button4.addClickListener(guidedfunc6);
}	
public function guidedfunc6():void
{
	checkvar1 = int(scann1.text);
	checkvar2 = int(scann2.text);
	checkvar3 = int(scann3.text);
	
	scann1.border = true;
	scann2.border = true;
	scann3.border = true;
	
	label2 = new PIElabel(pieHandle, String(num4), 25*(h/600),  0x99CC00, displayBColor);
	label2.x = 350*(w/800);
	label2.y = 265 * (h / 600);
	pieHandle.addDisplayChild(label2);
	label2.visible = false;
	
	label3 = new PIElabel(pieHandle, String(sum1), 25*(h/600), 0x99CC00, displayBColor);
	label3.x = 350*(w/800);
	label3.y = 385 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	label7 = new PIElabel(pieHandle, (((num4)/sum1).toPrecision(3)), 25*(h/600),  0x99CC00, displayBColor);
	label7.x = 475*(w/800);
	label7.y = 370 * (h / 600);
	pieHandle.addDisplayChild(label7);
	label7.visible = false;
	
	if (checkvar1 == num4)
	{
		scann1.borderColor =  0X55961E;
	}
	else
	{
		scann1.borderColor = 0X990033;
		scoreflag = 0;
		label2.visible = true;
	}
	if (checkvar2 == sum1)
	{
		scann2.borderColor =  0X55961E;
	}
	else
	{
		scann2.borderColor = 0X990033;
		scoreflag = 0;
		label3.visible = true;
	}
	if (checkvar3 == Number((num4/sum1).toPrecision(3)))
	{
		scann3.borderColor =  0X55961E;
	}
	else
	{
		scann3.borderColor = 0X990033;
		label7.visible = true;
		scoreflag = 0;
	}
	
	if ( scoreflag == 1 )
	{
		scorenume = scorenume +1;
	}
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	
	setTimeout(guidedfunc7, 2000);
	button4.visible = false;
	button1.addClickListener(guidedrepeatfunc);
	
}	
public function guidedfunc7():void
{
	flag2 = 2;
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	label7.visible = false;
	scann1.visible = false;
	scann2.visible = false;
	scann3.visible = false;
	line1.visible = false;
	label8.visible = false;
	demofunc();
	button2.visible = false;
	button3.visible = false;
}	

public function guidedfunc8():void
{	
	button4.visible = true;
	flag2 = 1;
	label4.visible = false;
	
	scoreflag = 1;
	scoredenom = scoredenom + 1;
	
	captureData.setEditableCell(4, 4, true);
	captureData.highlightCell(4, 4, 0x0000CC );
	
	scann1 = new PIEinput(pieHandle, "", 2, 25*(h/600), displayBColor, displayFColor);
	scann1.x  = 350*(w/800);
	scann1.y  = 300*(h/600);
	scann1.width = 60*(w/800);
	scann1.height = 30*(h/600);
	scann1.border = true;
	pieHandle.addDisplayChild(scann1);
	scann1.visible = false;
	
	scann2 = new PIEinput(pieHandle, "", 3, 25*(h/600), displayBColor, displayFColor);
	scann2.x  = 350*(w/800);
	scann2.y  = 345*(h/600);
	scann2.width = 60*(w/800);
	scann2.height = 30*(h/600);
	scann2.border = true;
	pieHandle.addDisplayChild(scann2);
	scann2.visible = false;
	
	scann3 = new PIEinput(pieHandle, "",5, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 475*(w/800);
	scann3.y  = 320*(h/600);
	scann3.width = 80*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;
	
	button2.visible = false;
	button3.visible = false;
	button4.visible = true;	
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(>15000)\nchildren(>3) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	button4.addClickListener(guidedfunc9);	
	button1.addClickListener(guidedrepeatfunc);
	captureData.setEditableCell(4, 4, true);
	
}
public function guidedfunc9():void
{
	captureData.setEditableCell(4, 4, false );
	
	label6 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  displayBColor, displayFColor);
	label6.x = 550*(w/800);
	label6.y = 275 * (h / 600);
	pieHandle.addDisplayChild(label6);
	label6.visible = false;
	
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;		
	
	eText = captureData.getText(4,4);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	
	if ( lNumber == sum1 )
	{
		captureData.highlightCell(4, 4, 0X55961E);
		guidedfunc10();
	}
	else
	{
		captureData.highlightCell(4, 4, 0X990033);	
		label6.visible = true;
		guidedfunc10();
		scoreflag = 0;
	}
	button1.addClickListener(guidedrepeatfunc);
}	
public function guidedfunc10():void
{	
	scann1.visible = true;
	
	arrow1 = new PIEarrow(pieHandle, 500 * (w / 800), 200 * (h / 600) , 370 * (w / 800) , 300 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow1);
	arrow1.changeBorder( 4, 0XE1DC28, 0.4);
	arrow1.visible = true;
	
	arrow2 = new PIEarrow(pieHandle, 600 * (w / 800), 220 * (h / 600) , 390 * (w / 800) , 350 * (h / 600), displayFColor);
	pieHandle.addDisplayChild(arrow2);
	arrow2.changeBorder( 4, 0XE1DC28, 0.4);
	arrow2.visible = false;
	
	pieHandle.addDisplayChild(line1);
	line1.visible = true;	
	
	button4.addClickListener(guidedfunc10b);
	button1.addClickListener(guidedrepeatfunc);
}	
public function guidedfunc10b():void
{
	arrow1.visible = false;
	arrow2.visible = true;
	scann1.border = false;
	scann2.visible = true;
	
	button4.addClickListener(guidedfunc11);
	button1.addClickListener(guidedrepeatfunc);
}	
public function guidedfunc11():void
{
	scann1.border = false;
	scann2.border = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	label4 = new PIElabel(pieHandle, " =", 25*(h/600),  displayBColor, displayFColor);
	label4.x = 430*(w/800);
	label4.y = 320 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = true;
	
	scann3.visible = true;
	
	button4.addClickListener(guidedfunc12);
	button1.addClickListener(guidedrepeatfunc);
}	
public function guidedfunc12():void
{
	checkvar1 = int(scann1.text);
	checkvar2 = int(scann2.text);
	checkvar3 = int(scann3.text);
	
	scann1.border = true;
	scann2.border = true;
	scann3.border = true;
	
	label2 = new PIElabel(pieHandle, String(num9), 25*(h/600),  0x99CC00, displayBColor);
	label2.x = 350*(w/800);
	label2.y = 265 * (h / 600);
	pieHandle.addDisplayChild(label2);
	label2.visible = false;
	
	label3 = new PIElabel(pieHandle, String(sum1), 25*(h/600),  0x99CC00, displayBColor);
	label3.x = 350*(w/800);
	label3.y = 385 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	label7 = new PIElabel(pieHandle, (((num9)/sum1).toPrecision(3)), 25*(h/600),  0x99CC00, displayBColor);
	label7.x = 475*(w/800);
	label7.y = 370 * (h / 600);
	pieHandle.addDisplayChild(label7);
	label7.visible = false;
	
	if (checkvar1 == num4)
	{
		scann1.borderColor =  0X55961E;
	}
	else
	{
		scann1.borderColor = 0X990033;
		label2.visible = true;
		scoreflag = 0;
	}
	if (checkvar2 == sum1)
	{
		scann2.borderColor =  0X55961E;
	}
	else
	{
		scann2.borderColor = 0X990033;
		label3.visible = true;
		scoreflag = 0;
	}
	if (checkvar3 == Number((num4/sum1).toPrecision(3)))
	{
		scann3.borderColor =  0X55961E;
	}
	else
	{
		scann3.borderColor = 0X990033;
		label7.visible = true;
		scoreflag = 0;
	}
	
	if ( scoreflag == 1 )
	{
		scorenume = scorenume +1;
	}
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	
	button4.visible = false;
	button1.addClickListener(guidedrepeatfunc);
	
}	
public function guidedrepeatfunc():void
{
	label1.visible = false;
	label2.visible = false;
	label3.visible = false;
	label4.visible = false;
	label5.visible = false;
	label6.visible = false;
	label7.visible = false;
	label8.visible = false;
	scann1.visible = false;
	scann2.visible = false;
	scann3.visible = false;	
	line1.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	guidedfunc();
}	
public function interactfunc():void
{
	button2.visible = false;
	button3.visible = false;
	button4.visible  = true;
	
	flag3 = 1;
	
	label1 = new PIElabel(pieHandle, "    Rainfall  ", 25*(h/600),  displayBColor, displayFColor);
	label1.x = 300*(w/800);
	label1.y = 15 * (h / 600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	label5 = new PIElabel(pieHandle, "Probability \n(August)\n(200-300cm) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = false;
	
	oTableX = 50*(w/800);
    oTableY = 70*(h/600);
    oTableRows = 5;
    oTableColumns = 5;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
	pieHandle.addDisplayChild(captureData);
	captureData.visible = true;
	
	initializetable2();
}	
public function initializetable2():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	captureData.setDefaultColor(displayFColor);
	captureData.highlightTable(displayBColor);
	captureData.setFColorTable(displayFColor);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
	
	captureData.setEditableTable(false);
	
	if ( h >= 610 )
	{
		captureData.setTextHeightTable(25*(w / 800)/(h/600));
	}
	else
	{
		captureData.setTextHeightTable(25*(h / 600)/(w / 800));
	}
	
	captureData.setTextCell(0, 0, "       Month      ");
    captureData.setTextCell(1, 0, "      July    ");
    captureData.setTextCell(2, 0, "      August   ");
	captureData.setTextCell(3, 0, "     September   ");
	captureData.setTextCell(4, 0, "    Sum    ");
	captureData.setTextCell(0, 1, "  0-200cm  ");
    captureData.setTextCell(0, 2, "  200-300cm ");
    captureData.setTextCell(0, 3, "  > 300cm  ");
	captureData.setTextCell(0, 4, "   Sum    ");	
	
	captureData.width = 600 * (w / 800);
	captureData.height = 175 * (h / 600);	

	
	captureData.setEditableCell(1, 1, true);
	captureData.highlightCell(1, 1,0x0000CC);
	
	
	button4.addClickListener(interactfunc1a);
	
}	
public function interactfunc1a():void
{	
	captureData.highlightCell(1, 2, 0x0000CC);
	captureData.setEditableCell(1, 2, true);
	captureData.highlightCell(1, 1, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);	
	button4.addClickListener(interactfunc1b);
}	
public function interactfunc1b():void
{
	captureData.highlightCell(1, 3, 0x0000CC);
	captureData.setEditableCell(1, 3, true);
	captureData.highlightCell(1, 2, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1c);
}
public function interactfunc1c():void
{
	captureData.highlightCell(2, 1, 0x0000CC);
	captureData.setEditableCell(2, 1, true);
	captureData.highlightCell(1, 3, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1d);
}
public function interactfunc1d():void
{
	captureData.highlightCell(2, 2, 0x0000CC);
	captureData.setEditableCell(2, 2, true);
	captureData.highlightCell(2, 1, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1e);
}
public function interactfunc1e():void
{
	captureData.highlightCell(2, 3, 0x0000CC);
	captureData.setEditableCell(2, 3, true);
	captureData.highlightCell(2, 2, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1f);
}
public function interactfunc1f():void
{
	captureData.highlightCell(3, 1, 0x0000CC);
	captureData.setEditableCell(3, 1, true);
	captureData.highlightCell(2, 3, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1g);
}
public function interactfunc1g():void
{
	captureData.highlightCell(3, 2, 0x0000CC);
	captureData.setEditableCell(3, 2, true);
	captureData.highlightCell(3, 1, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc1h);
}
public function interactfunc1h():void
{
	captureData.highlightCell(3, 3,0x0000CC);
	captureData.setEditableCell(3, 3, true);
	captureData.highlightCell(3, 2, displayBColor);
	
	button1.addClickListener(interactrepeatfunc);
	button4.addClickListener(interactfunc2);
}
public function interactfunc2():void
{
	button4.visible = false;
	button2.visible = true;
	button3.visible = true;	
	
	captureData.highlightCell(3, 3, displayBColor);
	
	num1 = int(captureData.getText(1, 1));
	num2 = int(captureData.getText(1,2));
	num3 = int(captureData.getText(1,3));
	num4 = int(captureData.getText(2,1));
	num5 = int(captureData.getText(2,2));
	num6 = int(captureData.getText(2,3));
	num7 = int(captureData.getText(3,1));
	num8 = int(captureData.getText(3,2));
	num9 = int(captureData.getText(3,3));	
	
	captureData.setTextCell(1, 4, "     " + (num1 + num2 + num3));
	captureData.setTextCell(2, 4, "     " +(num4 + num5 + num6));
	captureData.setTextCell(3, 4, "     " + (num7 + num8 + num9));
	
	captureData.setTextCell(4, 1, "      " + (num1+num4+num7));
	captureData.setTextCell(4, 2, "      " + (num2+num5+num8));
	captureData.setTextCell(4, 3, "      " + (num3 + num6 + num9));
	
	captureData.setTextCell(4, 4, "     " + (num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9));
	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;	
	
	label5.visible = true;
	
	button1.addClickListener(interactrepeatfunc);
	button3.addClickListener(interactautofunc1);
	button2.addClickListener(interactstepfunc1);
	
}	
public function interactstepfunc1():void
{
	demostepfunc2();
}
public function interactstepfunc2():void
{
	arrow1.visible = false;
	arrow2.visible = false;
	label5.visible = false;
	label4.visible = false;
	label3.visible = false;
	label2.visible = false;
	line1.visible = false;
	
	label5 = new PIElabel(pieHandle, "Probability \n(Rainfall>300cm) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	
	button2.addClickListener(demostepfunc6);
}
public function interactstepfunc3():void
{
	arrow1.visible = false;
	arrow2.visible = false;
	label5.visible = false;
	label4.visible = false;
	label3.visible = false;
	label2.visible = false;
	line1.visible = false;
	
	label5 = new PIElabel(pieHandle, "Probability \n(Rainfall in August) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	
	button2.addClickListener(demostepfunc10);
}
public function interactautofunc1():void
{
	flag1 = 1;
	demostepfunc2();
}	
public function interactautofunc2():void
{
	arrow1.visible = false;
	arrow2.visible = false;
	label5.visible = false;
	label4.visible = false;
	label3.visible = false;
	label2.visible = false;
	line1.visible = false;
	
	label5 = new PIElabel(pieHandle, "Probability \n(Rainfall>300cm) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	setTimeout(demostepfunc6,2000);
}
public function interactautofunc3():void
{
	arrow1.visible = false;
	arrow2.visible = false;
	label5.visible = false;
	label4.visible = false;
	label3.visible = false;
	label2.visible = false;
	line1.visible = false;
	
	label5 = new PIElabel(pieHandle, "Probability \n(Rainfall in August) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	setTimeout(demostepfunc10,2000);
}
public function interactrepeatfunc():void
{
	arrow1.visible = false;
	arrow2.visible = false;
	label5.visible = false;
	label4.visible = false;
	label3.visible = false;
	label2.visible = false;
	line1.visible = false;
	interactfunc();
}	
public function testfunc():void
{	
	flag4 = 1;
	
	scoreflag = 1;
	scoredenom = scoredenom + 1;
	
	label1.visible = false; 
	
	button2.visible = false;
	button3.visible = false;
	
	num1 = Math.ceil(Math.random() * 50);
	num2 = Math.ceil(Math.random() * 50);
	num3 = Math.ceil(Math.random() * 50);
	num4 = Math.ceil(Math.random() * 50);
	num5 = Math.ceil(Math.random() * 50);
	num6 = Math.ceil(Math.random() * 50);
	num7 = Math.ceil(Math.random() * 50);
	num8 = Math.ceil(Math.random() * 50);
	num9 = Math.ceil(Math.random() * 50);
	
	scann3 = new PIEinput(pieHandle, "",6, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 475*(w/800);
	scann3.y  = 320*(h/600);
	scann3.width = 80*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = false;
	
	label1 = new PIElabel(pieHandle, "Number of children", 25*(h/600),  displayBColor, displayFColor);
	label1.x = 300*(w/800);
	label1.y = 15 * (h / 600);
	pieHandle.addDisplayChild(label1);
	label1.visible = true;
	
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	oTableX = 50*(w/800);
    oTableY = 50*(h/600);
    oTableRows = 5;
    oTableColumns = 5;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
	pieHandle.addDisplayChild(captureData);
	captureData.visible = true;
		
	initializetable3();
}
public function initializetable3():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	captureData.setDefaultColor(displayFColor);
	captureData.highlightTable(displayBColor);
	captureData.setFColorTable(displayFColor);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
	
	captureData.setEditableTable(false);
	
	if ( h >= 610 )
	{
		captureData.setTextHeightTable(25*(w / 800)/(h/600));
	}
	else
	{
		captureData.setTextHeightTable(25*(h / 600)/(w / 800));
	}
	
	captureData.setTextCell(0, 0, "    Monthly income    ");
    captureData.setTextCell(1, 0, "    < 7000    ");
    captureData.setTextCell(2, 0, "    7000-15000   ");
	captureData.setTextCell(3, 0, "    >15000    ");
	captureData.setTextCell(4, 0, "    Sum    ");
	captureData.setTextCell(0, 1, "    0-1    ");
    captureData.setTextCell(0, 2, "    2-3    ");
    captureData.setTextCell(0, 3, "    > 3    ");
	captureData.setTextCell(0, 4, "    Sum    ");
	
	captureData.setTextCell(1, 1, "     "+(num1));
	captureData.setTextCell(1, 2, "     "+(num2));
	captureData.setTextCell(1, 3, "     " +(num3));
	captureData.setTextCell(1, 4, "     "+(num1+num2+num3));
	
	captureData.setTextCell(2, 1, "     "+(num4));
	captureData.setTextCell(2, 2, "     "+(num5));
	captureData.setTextCell(2, 3, "     " +(num6));
	captureData.setTextCell(2, 4, "     " +(num4+num5+num6));
	
	captureData.setTextCell(3, 1, "     "+(num7));
	captureData.setTextCell(3, 2, "     "+(num8));
	captureData.setTextCell(3, 3, "     " +(num9));
	captureData.setTextCell(3, 4, "     " + (num7+num8+num9));
	
	captureData.setTextCell(4, 1, "     " + (num1+num4+num7));
	captureData.setTextCell(4, 2, "     " + (num2+num5+num8));
	captureData.setTextCell(4, 3, "     " + (num3 + num6 + num9));
	
	captureData.width = 600 * (w / 800);
	captureData.height = 175 * (h / 600);
	
	testfunc2();
}	
public function testfunc2():void
{
	sum1 = num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9;
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(7000-15000)\nchildren(2-3) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	label4 = new PIElabel(pieHandle, "INCORRECT", 20*(h/600),  displayBColor, displayFColor);
	label4.x = 300*(w/800);
	label4.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = false;
	
	label3 = new PIElabel(pieHandle, "CORRECT", 20*(h/600),  displayBColor, displayFColor);
	label3.x = 300*(w/800);
	label3.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	label6 = new PIElabel(pieHandle,(num5 / sum1).toPrecision(3) , 25*(h/600),  0x99CC00, displayBColor);
	label6.x = 475*(w/800);
	label6.y = 375 * (h / 600);
	pieHandle.addDisplayChild(label6);
	label6.visible = false;
	
	scann3.visible = true;
	
	button4.addClickListener(testfunc3);
	
}
public function testfunc3():void
{
	flag1 = 0;
	
	checkvar3 = Number(scann3.text);
	checkvar3 = Number(checkvar3.toPrecision(3));
	
	if ( checkvar3 == Number((num5 / sum1).toPrecision(3)))
	{
		scann3.borderColor =  0X55961E;
		label3.visible = true;	
	
		scorenume = scorenume +1;	
	
		label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
		label8.x = 50*(w/800);
		label8.y = 400 * (h / 600);
		pieHandle.addDisplayChild(label8);
		label8.visible = true;
		
		setTimeout(testfunc4, 1000);
	}
	else
	{
		scann3.borderColor =  0X990033;
		label4.visible = true;
		label6.visible = true;		
	
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
		
		setTimeout(testrepeatfunc, 1000);
		flag1 = 1;
	}
}
public function testrepeatfunc():void
{
	scann3.visible = false;
	label4.visible = false;
	label3.visible = false;
	label6.visible = false;	
	label8.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	label2.visible = false;	
	scann3.visible = false;
	line1.visible = false;
	
	if ( flag1 == 1 && flag4 == 1)
	{
		captureData.setTextCell(4, 4, "   " + sum1);
		demostepfunc2();
	}
	else if ( flag1 == 1 && flag4 == 2 )
	{
		captureData.setTextCell(4, 4, "   " + sum1);
		demostepfunc6();
	}
	else if ( flag1 == 1 && flag4 == 3 )
	{
		captureData.setTextCell(4, 4, "   " + sum1);
		demostepfunc10();
	}
	else
	{
		testfunc();
	}
}	
public function testfunc4():void
{
	flag4 = 2;
	
	scoredenom = scoredenom + 1;
	
	scann3 = new PIEinput(pieHandle, "",6, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 475*(w/800);
	scann3.y  = 320*(h/600);
	scann3.width = 80*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = true;
	
	line1.visible = false;
	label2.visible = false;
	label4.visible = false;
	label5.visible = false;	
	label3.visible = false;
	label6.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	label5 = new PIElabel(pieHandle, "Probability \nchildren(>3) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	label4 = new PIElabel(pieHandle, "INCORRECT", 20*(h/600),  displayBColor, displayFColor);
	label4.x = 300*(w/800);
	label4.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = false;
	
	label3 = new PIElabel(pieHandle, "CORRECT", 20*(h/600),  displayBColor, displayFColor);
	label3.x = 300*(w/800);
	label3.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	button4.addClickListener(testfunc5);
}	
public function testfunc5():void
{
	flag1 = 0;
	checkvar3 = Number(scann3.text);
	checkvar3 = Number(checkvar3.toPrecision(3));
	
	if ( checkvar3 == Number(((num3+num6+num9)/sum1).toPrecision(3)))
	{
		scann3.borderColor =  0X55961E;
		label3.visible = true;	
		setTimeout(testfunc6, 1000);
		
		scorenume = scorenume + 1;	
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	}
	else
	{
		scann3.borderColor =  0X990033;
		label4.visible = true;
		label6.visible = true;
		setTimeout(testrepeatfunc, 1000);
		flag1 = 1;	
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	}
}
public function testfunc6():void
{
	flag4 = 3;
	
	scoredenom = scoredenom + 1;
	
	line1.visible = false;
	label2.visible = false;
	label4.visible = false;
	label5.visible = false;	
	label3.visible = false;
	label6.visible = false;
	label8.visible = false;
	arrow1.visible = false;
	arrow2.visible = false;
	
	scann3 = new PIEinput(pieHandle, "",6, 25*(h/600), displayBColor, displayFColor);
	scann3.x  = 475*(w/800);
	scann3.y  = 320*(h/600);
	scann3.width = 80*(w/800);
	scann3.height = 30*(h/600);
	scann3.border = true;
	pieHandle.addDisplayChild(scann3);
	scann3.visible = true;
	
	label5 = new PIElabel(pieHandle, "Probability \nincome(7000-15000) :", 25*(h/600),  displayBColor, displayFColor);
	label5.x = 50*(w/800);
	label5.y = 300 * (h / 600);
	pieHandle.addDisplayChild(label5);
	label5.visible = true;
	
	label4 = new PIElabel(pieHandle, "INCORRECT", 20*(h/600),  displayBColor, displayFColor);
	label4.x = 300*(w/800);
	label4.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label4);
	label4.visible = false;
	
	label3 = new PIElabel(pieHandle, "CORRECT", 20*(h/600),  displayBColor, displayFColor);
	label3.x = 300*(w/800);
	label3.y = 250 * (h / 600);
	pieHandle.addDisplayChild(label3);
	label3.visible = false;
	
	button4.addClickListener(testfunc7);
}	
public function testfunc7():void
{
	flag1 = 0;
	
	checkvar3 = Number(scann3.text);
	checkvar3 = Number(checkvar3.toPrecision(3));
	
	if ( checkvar3 == Number(((num4+num5+num6)/sum1).toPrecision(3)))
	{
		scann3.borderColor =  0X55961E;
		label3.visible = true;	
		setTimeout(testrepeatfunc, 1000);
		
		scorenume = scorenume + 1;
	
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 350 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	}
	else
	{
		scann3.borderColor =  0X990033;
		label4.visible = true;
		label6.visible = true;
		setTimeout(testrepeatfunc, 1000);
		flag1 = 1;
		
	
	label8 = new PIElabel(pieHandle, "Your current score: "+scorenume+" / "+scoredenom, 25*(h/600),  displayBColor, displayFColor);
	label8.x = 50*(w/800);
	label8.y = 400 * (h / 600);
	pieHandle.addDisplayChild(label8);
	label8.visible = true;
	}
	
}
/*
 ***
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
