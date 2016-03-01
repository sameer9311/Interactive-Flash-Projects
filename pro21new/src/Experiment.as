package
{
import flash.events.MouseEvent;
import mx.skins.halo.DateChooserYearArrowSkin;
import flash.geom.Point;
import pie.graphicsLibrary.*;
import pie.uiElements.*;
import flash.utils.*;
import flash.display.Sprite;
import mx.core.FlexGlobals;


public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;

/**
 *
 * This section contains display Parameters
 *
 */

private var PIEaspectRatio:Number;
private var worldOriginX:Number;
private var worldOriginY:Number;
private var worldWidth:Number;
private var worldHeight:Number;
private var t1:PIElabel;
private var t2:PIElabel;
private var nextimage:PIEimage;
private var backimage:PIEimage;
private var resetimage:PIEimage;
private var weimg:PIEimage;
private var youimg:PIEimage;
private var iimg:PIEimage;
private var sheimg:PIEimage;
private var heimg:PIEimage;
private var theyimg:PIEimage;
private var itimg:PIEimage;
private var sayimg:PIEimage;
private var correctimg:PIEimage;
private var wrongimg:PIEimage;

/**
 *
 * This section contains Drawing Objects
 *
 */

private var line1:PIEline; 
private var line2:PIEline;
private var line3:PIEline;
private var line4:PIEline;
private var line5:PIEline;
private var line6:PIEline;
private var line7:PIEline;
private var line8:PIEline;
private var line9:PIEline;
private var line10:PIEline;
private var line11:PIEline;
private var line12:PIEline;
private var line13:PIEline;
private var line14:PIEline;
private var line15:PIEline;
private var head1:PIEcircle;
private var head2:PIEcircle;
private var head3:PIEcircle;
private var arr1:PIEarrow;
private var tri1:PIEtriangle;
private var tri2:PIEtriangle;

/* Display Parameters */
private var displayBColor:uint;
private var displayFColor:uint;
private var UIpanelBColor:uint;
private var UIpanelFColor:uint;
private var controlBColor:uint;
private var controlFColor:uint;
private var drawingcolour1:uint;
private var drawingcolour2:uint;
private var drawingcolour3:uint;

/* screen resolution parameters */
private var h:Number;
private var w:Number;


public function Experiment(pie:PIE)
{
    /* Store handle of PIE Framework */
    pieHandle = pie;

    /* Call a PIE framework function to set the dimensions of the drawing area, right panel and bottom panel */
    /* We will reserve 100% width and 100%height for the drawing area */
    pieHandle.PIEsetDrawingArea(1.0, 1.0);    
	
	h = FlexGlobals.topLevelApplication.height;
	w = FlexGlobals.topLevelApplication.width;

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
    UIpanelBColor = 0X00DD00;
    UIpanelFColor = 0XCCCCCC;
    controlBColor = 0X8888DD;
    controlFColor = 0XCCCCCC;
	drawingcolour1 = 0XFF7E0B;
	drawingcolour2 = 0X8800C2;
	drawingcolour3 = 0XE1DC28;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
    pieHandle.PIEsetUIpanelColors(UIpanelBColor, UIpanelFColor);

    /* Set the Experiment Details */
    pieHandle.showExperimentName("PRONOUNS TUTORIAL");
    pieHandle.showDeveloperName("Sameer Sonawane");

    /* define the position of all the global (static) variables */
    /* Code in a single Function (recommended) for reuse */
    this.resetExperiment();
	this.resetWorld();
	
	nextimage = new PIEimage(pieHandle, 2.9, 2.3, 0.4, 0.4 , PIEimageLocation.nxtImgPtr);
	nextimage.setPIEborder(false);
    
	backimage = new PIEimage(pieHandle, 0.1 , 2.3, 0.4, 0.4 , PIEimageLocation.bkImgPtr);
	backimage.setPIEborder(false);
	
	resetimage = new PIEimage(pieHandle, 2.9, 2.3, 0.4, 0.4 , PIEimageLocation.rstImgPtr);
	resetimage.setPIEborder(false);
	
	weimg = new PIEimage(pieHandle, 2.9, 0.2, 0.4, 0.4 , PIEimageLocation.weImgPtr);
	weimg.setPIEborder(false);
	
	iimg = new PIEimage(pieHandle, 2.9, 0.5, 0.4, 0.4 , PIEimageLocation.iImgPtr);
	iimg.setPIEborder(false);
	
	youimg = new PIEimage(pieHandle, 2.9, 0.8, 0.4, 0.4 , PIEimageLocation.youImgPtr);
	youimg.setPIEborder(false);	
	
	theyimg = new PIEimage(pieHandle, 2.9, 1.1, 0.4, 0.4 , PIEimageLocation.theyImgPtr);
	theyimg.setPIEborder(false);	
	
	heimg = new PIEimage(pieHandle, 2.9, 1.4, 0.4, 0.4 , PIEimageLocation.heImgPtr);
	heimg.setPIEborder(false);	
	
	sheimg = new PIEimage(pieHandle, 2.9, 1.7, 0.4, 0.4 , PIEimageLocation.sheImgPtr);
	sheimg.setPIEborder(false);	
	
	itimg = new PIEimage(pieHandle, 2.9, 2, 0.4, 0.4 , PIEimageLocation.itImgPtr);
	itimg.setPIEborder(false);
	
	correctimg = new PIEimage(pieHandle, 1.5, 2.1, 0.4, 0.4, PIEimageLocation.corImgPtr);
	correctimg.setPIEborder(false);
	
	wrongimg = new PIEimage(pieHandle, 1.5, 2.1, 0.4, 0.4, PIEimageLocation.wrngImgPtr);
	wrongimg.setPIEborder(false);
   
    slide1();
}

/**
 *
 * This function is called by the PIE framework to reset the experiment to default values
 * It defines the values of all the global (static) variables
 *
 */
public function resetExperiment():void
{
 
   
}

/*
 * This function resets the world boundaries and adjusts display to match the world boundaries
 */
public function resetWorld():void
{
    /* get the PIE drawing area aspect ratio (width/height) to model the dimensions of our experiment area */
    PIEaspectRatio = pieHandle.PIEgetDrawingAspectRatio();	
	
    /* Initialise World Origin and Boundaries */
    worldHeight  = 2.5;                            /* 2.5 meters height */
    worldWidth   = worldHeight * PIEaspectRatio;   /* match world aspect ratio to PIE aspect ratio */
    worldOriginX = 0.0;
    worldOriginY = 0.0;
    pieHandle.PIEsetApplicationBoundaries(worldOriginX, worldOriginY, worldWidth, worldHeight);
	
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
public function slide1():void
{
	   
    t1 = new PIElabel(pieHandle, "PRONOUNS", 55, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 210*(w/800);
	t1.y = 200*(h/600);
	t1.visible = true;
	
	setTimeout(slide2, 2000);
	
}
public function slide2():void
{
	t1.visible = false;	
	
	t1 = new PIElabel(pieHandle, "EXAMPLES", 55, 0XE1DC28, displayBColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 215*(w/800);
	t1.y = 140*(h/600);
	t1.visible = true;
	
	t2 = new PIElabel(pieHandle, "QUIZ", 55, 0X347CB8, displayBColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 300*(w/800);
	t2.y = 260*(h/600);
	t2.visible = true;
	
	t1.addEventListener(MouseEvent.CLICK, clickfunction1, false, 0, false);
	t2.addEventListener(MouseEvent.CLICK, clickfunction2, false, 0, false);
	
}
public function clickfunction1(Event:MouseEvent):void
{
	slide3();
}	
public function clickfunction2(Event:MouseEvent):void
{
	slide10();
}	
public function slide3():void
{
	t1.visible = false;
	t2.visible = false;
	
	pieHandle.addDisplayChild(nextimage);	
	nextimage.setPIEvisible();
	
	pieHandle.addDisplayChild(backimage);
	backimage.setPIEvisible();
	
	head1 = new PIEcircle(pieHandle, 1.0, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1.0, 1.0, 1.0, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1.0, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1.0, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1.0, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
	
	line5 = new PIEline(pieHandle, 1.0, 1.167, 1.35, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line5); 
	
	head2 = new PIEcircle(pieHandle, 1.7, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 1.7, 1.0, 1.7, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 1.7, 1.5, 1.45, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.7, 1.5, 1.95, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 1.7, 1.167, 1.35, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.7, 1.167, 2.05, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	sayimg = new PIEimage(pieHandle, 1.9, 0.6,  0.4, 0.40 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "WE : Group of people together with the person", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	nextimage.addClickListener(slide4);
	backimage.addClickListener(backslide3);
	
}	
public function backslide3():void
{
	clearscreen();
	t1.visible = false;	
	sayimg.setPIEinvisible();
	backimage.setPIEinvisible();
	nextimage.setPIEinvisible();
	
	slide1();
	
}
public function slide4():void
{
	sayimg.setPIEinvisible();
	clearscreen();
	t1.visible = false;
	
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 2.2, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 2.2, 1.0, 2.2, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 2.2, 1.5, 1.95, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2.2, 1.5, 2.45, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.2, 1.167, 1.85, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.2, 1.167, 2.55, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6,  0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "YOU : Person pointing to other person near him", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	nextimage.addClickListener(slide5);
	backimage.addClickListener(backslide4);
	
}	
public function backslide4():void
{
	clearscreen();
	arr1.setPIEinvisible();
	t1.visible = false;
	sayimg.setPIEinvisible();
	
	slide3();
}	
public function slide5():void
{
	
	arr1.setPIEinvisible();
	clearscreen();
	t1.visible = false;
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
	
	line5 = new PIEline(pieHandle, 1, 1.167, 1.45, 1.25, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line5); 
	
	arr1 = new PIEarrow(pieHandle, 1.45, 1.25, 1.2, 1, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "I : Person pointing to himself", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	nextimage.addClickListener(slide6);
	backimage.addClickListener(backslide5);
}	
public function backslide5():void
{
	clearscreen();
	arr1.setPIEinvisible();
	t1.visible = false;
	sayimg.setPIEinvisible();
	
	slide4();
}
public function slide6():void
{
	
	arr1.setPIEinvisible();	
	t1.visible = false;
	clearscreen();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	tri1 = new PIEtriangle(pieHandle, new Point(2, 1.084), new Point(2.25, 1.084), new Point(2.125, 1.29), displayBColor);
	tri1.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri1);
	
	tri2 = new PIEtriangle(pieHandle, new Point(2.125, 1.29), new Point(1.925, 1.71), new Point(2.325, 1.71), displayBColor);
	tri2.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri2);
	
	line5 = new PIEline(pieHandle, 2.12, 1.084, 2.12, 1, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.084, 1.925, 1.229, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 1.925, 1.229, 2.125, 1.3125, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2.25, 1.084, 2.325, 1.229, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.325, 1.229, 2.125, 1.3125, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.075, 1.71, 2.075, 1.9167, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 2.175, 1.71, 2.175, 1.9167, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	head2 = new PIEcircle(pieHandle, 2.125, 0.90, 0.10, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "SHE : Person pointing to a female away from him", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	backimage.addClickListener(backslide6);
	nextimage.addClickListener(slide7);
}	
public function backslide6():void
{
	t1.visible = false;	
	line11.setPIEinvisible();
	arr1.setPIEinvisible();
	tri1.setPIEinvisible();
	tri2.setPIEinvisible();
	sayimg.setPIEinvisible();
	clearscreen();
	slide5();
}
public function slide7():void
{
	t1.visible = false;	
	line11.setPIEinvisible();
	arr1.setPIEinvisible();	
	tri1.setPIEinvisible();
	tri2.setPIEinvisible();
	clearscreen();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	tri1 = new PIEtriangle(pieHandle, new Point(2, 1.084), new Point(2.25, 1.084), new Point(2.125, 1.5), displayBColor);
	tri1.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri1);
	
	line5 = new PIEline(pieHandle, 2.125, 1.084, 2.125, 1, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.084, 1.95, 1.375, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line8 = new PIEline(pieHandle, 2.25, 1.084, 2.3, 1.375, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.125, 1.5, 2, 1.9166, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.125, 1.5, 2.25, 1.9166, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);	
		
	head2 = new PIEcircle(pieHandle, 2.125, 0.9, 0.1, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "HE : Person pointing to a male away from him", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	backimage.addClickListener(backslide7);
	nextimage.addClickListener(slide8);	
	
}	
public function backslide7():void
{
	t1.visible = false;
	sayimg.setPIEinvisible();
	tri1.setPIEinvisible();
	arr1.setPIEinvisible();
	clearscreen();
	slide6();
}
public function slide8():void
{
	t1.visible = false;	
	arr1.setPIEinvisible();	
	tri1.setPIEinvisible();	
	clearscreen();
	sayimg.setPIEinvisible();	
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 2, 1.084, 0.1, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line5 = new PIEline(pieHandle, 2, 1.1875, 2, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.5, 1.875, 1.7083, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 2, 1.5, 2.125, 1.7083, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2, 1.29166, 1.75, 1.396, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2, 1.29166, 2.25, 1.396, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	head3 = new PIEcircle(pieHandle, 2.5, 1.084, 0.1, displayBColor);
    head3.changeBorder(4, drawingcolour3, 0.8);
    pieHandle.addDisplayChild(head3);
	
	line10 = new PIEline(pieHandle, 2.5, 1.1875, 2.5, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 2.5, 1.5, 2.375, 1.7083, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 2.5, 1.5, 2.625, 1.7083, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2.5, 1.29166, 2.25, 1.396, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 2.5, 1.29166, 2.75, 1.396, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line14);	
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "THEY : Person pointing to a group of people away from him", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	backimage.addClickListener(backslide8);
	nextimage.addClickListener(slide9);		
	
}	
public function backslide8():void
{
	
	t1.visible = false;
	clearscreen();
	sayimg.setPIEinvisible();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	head3.setPIEinvisible();
	arr1.setPIEinvisible();
	
	slide7();		
}	
public function slide9():void
{
	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();	
	head3.setPIEinvisible();
	arr1.setPIEinvisible();			
	t1.visible = false;
	clearscreen();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 0.5, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 0.5, 1.0, 0.5, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 0.5, 1.5, 0.25, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 0.5, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 0.5, 1.167, 0.15, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 0.5, 1.167, 1, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 1.5, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 1.5, 1.0, 1.5, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 1.5, 1.5, 1.25, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.5, 1.5, 1.75, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 1.5, 1.167, 1.15, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.5, 1.167, 1.85, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	
	head3 = new PIEcircle(pieHandle, 2.2, 0.8, 0.2, displayBColor);
    head3.changeBorder(4, drawingcolour3, 0.8);
    pieHandle.addDisplayChild(head3);	
	
	line5 = new PIEline(pieHandle, 2.2, 1, 2.2, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line11 = new PIEline(pieHandle, 2.2, 1.5, 1.95, 2, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 2.2, 1.5, 2.45, 2, drawingcolour3, 4.0, 0.8);	
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2.2, 1.167, 1.85, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 2.2, 1.167, 2.55, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line14); 
	
	sayimg = new PIEimage(pieHandle, 0.7, 0.6, 0.40, 0.40 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	t1 = new PIElabel(pieHandle, "YOU : Person pointing to two people standing near him", 22*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 20;
	t1.visible = true;
	
	pieHandle.addDisplayChild(resetimage);	
	resetimage.setPIEvisible();
	
	backimage.addClickListener(backslide9);
	resetimage.addClickListener(endfunction1);
	
}
public function backslide9():void
{	
	sayimg.setPIEinvisible();
	t1.visible = false;	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	head3.setPIEinvisible();
	arr1.setPIEinvisible();	
	clearscreen();
	resetimage.setPIEinvisible();
	slide8();
}
public function endfunction1():void
{
	clearscreen();
	sayimg.setPIEinvisible();
	t1.visible = false;	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	head3.setPIEinvisible();
	arr1.setPIEinvisible();	
	
	resetimage.setPIEinvisible();
	nextimage.setPIEinvisible();
	backimage.setPIEinvisible();
	slide1();	
	
}	
public function slide10():void
{
	t1.visible = false;
	t2.visible = false;	
	
	t1 = new  PIElabel(pieHandle, "Select the correct pronoun:", 25*(h/600), displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 20;
	t1.y = 20;
	t1.visible = true;
	
	pieHandle.addDisplayChild(nextimage);	
	nextimage.setPIEvisible();
	
	pieHandle.addDisplayChild(backimage);
	backimage.setPIEvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
	
	line5 = new PIEline(pieHandle, 1, 1.167, 1.45, 1.25, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line5); 
	
	arr1 = new PIEarrow(pieHandle, 1.45, 1.25, 1.2, 1, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	pieHandle.addDisplayChild(weimg);
	weimg.setPIEvisible();
	
	pieHandle.addDisplayChild(iimg);
	iimg.setPIEvisible();
	
	pieHandle.addDisplayChild(youimg);
	youimg.setPIEvisible();
	
	pieHandle.addDisplayChild(heimg);
	heimg.setPIEvisible();
	
	pieHandle.addDisplayChild(sheimg);
	sheimg.setPIEvisible();
	
	pieHandle.addDisplayChild(itimg);
	itimg.setPIEvisible();
	
	pieHandle.addDisplayChild(theyimg);
	theyimg.setPIEvisible();
	
	pieHandle.addDisplayChild(iimg);
	iimg.setPIEvisible();
	
	iimg.addClickListener(correctanswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide10);
	nextimage.addClickListener(slide11);
	
}	
public function backslide10():void
{
	line1.setPIEinvisible();
	line2.setPIEinvisible();
	line3.setPIEinvisible();
	line4.setPIEinvisible();
	line5.setPIEinvisible();
	head1.setPIEinvisible();
	arr1.setPIEinvisible();
	iimg.setPIEinvisible();
	weimg.setPIEinvisible();
	theyimg.setPIEinvisible();
	heimg.setPIEinvisible();
	sheimg.setPIEinvisible();
	itimg.setPIEinvisible();
	youimg.setPIEinvisible();
	nextimage.setPIEinvisible();
	backimage.setPIEinvisible();
	sayimg.setPIEinvisible();
	t1.visible = false;
	slide1();
	
}	
public function slide11():void
{
	line1.setPIEinvisible();
	line2.setPIEinvisible();
	line3.setPIEinvisible();
	line4.setPIEinvisible();
	line5.setPIEinvisible();
	head1.setPIEinvisible();	
	arr1.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 0.5, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 0.5, 1.0, 0.5, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 0.5, 1.5, 0.25, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 0.5, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 0.5, 1.167, 0.15, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 0.5, 1.167, 1, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 1.5, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 1.5, 1.0, 1.5, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 1.5, 1.5, 1.25, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.5, 1.5, 1.75, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 1.5, 1.167, 1.15, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.5, 1.167, 1.85, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	
	head3 = new PIEcircle(pieHandle, 2.2, 0.8, 0.2, displayBColor);
    head3.changeBorder(4, drawingcolour3, 0.8);
    pieHandle.addDisplayChild(head3);	
	
	line5 = new PIEline(pieHandle, 2.2, 1, 2.2, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line11 = new PIEline(pieHandle, 2.2, 1.5, 1.95, 2, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 2.2, 1.5, 2.45, 2, drawingcolour3, 4.0, 0.8);	
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2.2, 1.167, 1.85, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 2.2, 1.167, 2.55, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line14); 
	
	sayimg = new PIEimage(pieHandle, 0.7, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(correctanswer);
	
	backimage.addClickListener(backslide11);
	nextimage.addClickListener(slide12);
	
}	
public function backslide11():void
{
	clearscreen();
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	arr1.setPIEinvisible();
	head3.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	slide10();
}	
public function slide12():void
{
	clearscreen();
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	arr1.setPIEinvisible();
	head3.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 0.5, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 0.5, 1.0, 0.5, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 0.5, 1.5, 0.25, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 0.5, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 0.5, 1.167, 0.15, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
	
	line5 = new PIEline(pieHandle, 0.5, 1.167, 0.85, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line5); 
	
	head2 = new PIEcircle(pieHandle, 1.2, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 1.2, 1.0, 1.2, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 1.2, 1.5, 0.95, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.2, 1.5, 1.45, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 1.2, 1.167, 0.85, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.2, 1.167, 1.55, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	
	head3 = new PIEcircle(pieHandle, 1.95, 0.8, 0.2, displayBColor);
    head3.changeBorder(4, drawingcolour3, 0.8);
    pieHandle.addDisplayChild(head3);
	
	line15 = new PIEline(pieHandle, 1.95, 1, 1.95, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line15);
	
	line11 = new PIEline(pieHandle, 1.95, 1.5, 1.7, 2, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 1.95, 1.5, 2.2, 2, drawingcolour3, 4.0, 0.8);	
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 1.95, 1.167, 1.6, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 1.95, 1.167, 2.3, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line14); 
	
	sayimg = new PIEimage(pieHandle, 2.15, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();		
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(correctanswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide12);
	nextimage.addClickListener(slide13);
	
}	
public function backslide12():void
{
	clearscreen();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	line15.setPIEinvisible();
	head3.setPIEinvisible();
	sayimg.setPIEinvisible();
	slide11();
}	
public function slide13():void
{
	clearscreen();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	line15.setPIEinvisible();
	head3.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	tri1 = new PIEtriangle(pieHandle, new Point(2, 1.084), new Point(2.25, 1.084), new Point(2.125, 1.29), displayBColor);
	tri1.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri1);
	
	tri2 = new PIEtriangle(pieHandle, new Point(2.125, 1.29), new Point(1.925, 1.71), new Point(2.325, 1.71), displayBColor);
	tri2.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri2);
	
	line5 = new PIEline(pieHandle, 2.12, 1.084, 2.12, 1, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.084, 1.925, 1.229, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 1.925, 1.229, 2.125, 1.3125, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2.25, 1.084, 2.325, 1.229, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.325, 1.229, 2.125, 1.3125, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.075, 1.71, 2.075, 1.9167, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 2.175, 1.71, 2.175, 1.9167, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	head2 = new PIEcircle(pieHandle, 2.125, 0.90, 0.10, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(correctanswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide13);
	nextimage.addClickListener(slide14);
}	
public function backslide13():void
{
	line11.setPIEinvisible();
	arr1.setPIEinvisible();
	tri1.setPIEinvisible();
	tri2.setPIEinvisible();
	sayimg.setPIEinvisible();
	clearscreen();
	
	slide12();
}
public function slide14():void
{
	line11.setPIEinvisible();
	arr1.setPIEinvisible();
	tri1.setPIEinvisible();
	tri2.setPIEinvisible();
	sayimg.setPIEinvisible();
	clearscreen();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	line5 = new PIEline(pieHandle, 1.60, 1.25, 2, 1.5, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.5, 2.4, 1.25, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 1.60, 1.25, 2, 1.042, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2.4, 1.25, 2, 1.042, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2, 1.042, 2, 0.625, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.4, 1.25, 2.4, 0.825, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 2.4, 0.833, 2, 0.625, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 1.60, 1.25, 1.60, 1.67, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2, 1.5, 2, 1.875, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 2.4, 1.25, 2.4, 1.67, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line14);
	
	line15 = new PIEline(pieHandle, 2, 0.75, 2.4, 0.96, drawingcolour2, 4.0, 0.8)
	pieHandle.addDisplayChild(line15);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(correctanswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide14);
	nextimage.addClickListener(slide15);
}	
public function backslide14():void
{
	clearscreen();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	line15.setPIEinvisible();
	arr1.setPIEinvisible();
	sayimg.setPIEinvisible();
	slide13();
	
}
public function slide15():void
{
	clearscreen();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	line15.setPIEinvisible();
	arr1.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	tri1 = new PIEtriangle(pieHandle, new Point(2, 1.084), new Point(2.25, 1.084), new Point(2.125, 1.5), displayBColor);
	tri1.changeBorder(4.0, drawingcolour2, 0.8);
	pieHandle.addDisplayChild(tri1);
	
	line5 = new PIEline(pieHandle, 2.125, 1.084, 2.125, 1, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.084, 1.95, 1.375, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line8 = new PIEline(pieHandle, 2.25, 1.084, 2.3, 1.375, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.125, 1.5, 2, 1.9166, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.125, 1.5, 2.25, 1.9166, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);	
		
	head2 = new PIEcircle(pieHandle, 2.125, 0.9, 0.1, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(correctanswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide15);
	nextimage.addClickListener(slide16);
	
}	
public function backslide15():void
{
	sayimg.setPIEinvisible();
	tri1.setPIEinvisible();
	arr1.setPIEinvisible();
	clearscreen();
	slide14();
}	
public function slide16():void
{
	sayimg.setPIEinvisible();
	tri1.setPIEinvisible();
	arr1.setPIEinvisible();
	clearscreen();
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 2, 1.084, 0.1, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line5 = new PIEline(pieHandle, 2, 1.1875, 2, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 2, 1.5, 1.875, 1.7083, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 2, 1.5, 2.125, 1.7083, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2, 1.29166, 1.75, 1.396, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2, 1.29166, 2.25, 1.396, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	head3 = new PIEcircle(pieHandle, 2.5, 1.084, 0.1, displayBColor);
    head3.changeBorder(4, drawingcolour3, 0.8);
    pieHandle.addDisplayChild(head3);
	
	line10 = new PIEline(pieHandle, 2.5, 1.1875, 2.5, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 2.5, 1.5, 2.375, 1.7083, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 2.5, 1.5, 2.625, 1.7083, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2.5, 1.29166, 2.25, 1.396, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	line14 = new PIEline(pieHandle, 2.5, 1.29166, 2.75, 1.396, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line14);	
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(correctanswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide16);
	nextimage.addClickListener(slide17);
}	
public function backslide16():void
{
	clearscreen();
	sayimg.setPIEinvisible();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	head3.setPIEinvisible();
	arr1.setPIEinvisible();
	slide15();
}	
public function slide17():void
{
	clearscreen();
	sayimg.setPIEinvisible();	
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	line14.setPIEinvisible();
	head3.setPIEinvisible();
	arr1.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	head2 = new PIEcircle(pieHandle, 2.2, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 2.2, 1.0, 2.2, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 2.2, 1.5, 1.95, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 2.2, 1.5, 2.45, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.2, 1.167, 1.85, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 2.2, 1.167, 2.55, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6,  0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(correctanswer);
	
	backimage.addClickListener(backslide17);
	nextimage.addClickListener(slide18);
}	
public function backslide17():void
{
	clearscreen();
	arr1.setPIEinvisible();	
	sayimg.setPIEinvisible();
	
	slide16();
}	
public function slide18():void
{
	clearscreen();
	arr1.setPIEinvisible();	
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1, 1.0, 1, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1, 1.5, 01.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
			
	arr1 = new PIEarrow(pieHandle, 1, 1.167, 1.5, 1.167, drawingcolour1);
	arr1.changeBorder(4.0, drawingcolour1, 0.8);
	pieHandle.addDisplayChild(arr1);
	
	line5 = new PIEline(pieHandle, 1.5, 1.292, 1.5, 1.5, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line5);
	
	line6 = new PIEline(pieHandle, 1.5, 1.292, 2.125, 0.979, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line6);
	
	line7 = new PIEline(pieHandle, 1.5, 1.292, 1.875, 1.395, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.875, 1.395, 2.5, 1.084, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 2.5, 1.084, 2.125, 0.979, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.5, 1.5, 1.875, 1.604, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	line11 = new PIEline(pieHandle, 1.875, 1.604, 2.5, 1.292, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line11);
	
	line12 = new PIEline(pieHandle, 1.875, 1.604, 1.875, 1.395, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line12);
	
	line13 = new PIEline(pieHandle, 2.5, 1.292, 2.5, 1.084, drawingcolour3, 4.0, 0.8);
	pieHandle.addDisplayChild(line13);
	
	sayimg = new PIEimage(pieHandle, 1.2, 0.6, 0.4, 0.4 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(wronganswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(correctanswer);
	youimg.addClickListener(wronganswer);
	
	backimage.addClickListener(backslide18);
	nextimage.addClickListener(slide19);
	
}	
public function backslide18(): void
{
	clearscreen();
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	arr1.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	slide17();
}	
public function slide19():void
{
	clearscreen();
	line11.setPIEinvisible();
	line12.setPIEinvisible();
	line13.setPIEinvisible();
	arr1.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	head1 = new PIEcircle(pieHandle, 1.0, 0.8, 0.2, displayBColor);
    head1.changeBorder(4, drawingcolour1, 0.8);
    pieHandle.addDisplayChild(head1);
	
	line1 = new PIEline(pieHandle, 1.0, 1.0, 1.0, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line1);
	
   	line2 = new PIEline(pieHandle, 1.0, 1.5, 0.75, 2, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line2);
	
	 line3 = new PIEline(pieHandle, 1.0, 1.5, 1.25, 2, drawingcolour1, 4.0, 0.8);	
	pieHandle.addDisplayChild(line3);
	
	line4 = new PIEline(pieHandle, 1.0, 1.167, 0.65, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line4);
	
	line5 = new PIEline(pieHandle, 1.0, 1.167, 1.35, 1.5, drawingcolour1, 4.0, 0.8);
	pieHandle.addDisplayChild(line5); 
	
	head2 = new PIEcircle(pieHandle, 1.7, 0.8, 0.2, displayBColor);
    head2.changeBorder(4, drawingcolour2, 0.8);
    pieHandle.addDisplayChild(head2);
	
	line6 = new PIEline(pieHandle, 1.7, 1.0, 1.7, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line6); 
	
	line7 = new PIEline(pieHandle, 1.7, 1.5, 1.45, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line7);
	
	line8 = new PIEline(pieHandle, 1.7, 1.5, 1.95, 2, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line8);
	
	line9 = new PIEline(pieHandle, 1.7, 1.167, 1.35, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line9);
	
	line10 = new PIEline(pieHandle, 1.7, 1.167, 2.05, 1.5, drawingcolour2, 4.0, 0.8);
	pieHandle.addDisplayChild(line10);
	
	sayimg = new PIEimage(pieHandle, 1.9, 0.6,  0.4, 0.40 , PIEimageLocation.sayImgPtr);
	sayimg.setPIEborder(false);
	pieHandle.addDisplayChild(sayimg);
	sayimg.setPIEvisible();	
	
	iimg.addClickListener(wronganswer);
	weimg.addClickListener(correctanswer);
	theyimg.addClickListener(wronganswer);
	heimg.addClickListener(wronganswer);
	sheimg.addClickListener(wronganswer);
	itimg.addClickListener(wronganswer);
	youimg.addClickListener(wronganswer);
	
	pieHandle.addDisplayChild(resetimage);	
	resetimage.setPIEvisible();
	
	backimage.addClickListener(backslide19);
	resetimage.addClickListener(endfunction2);
}	
public function backslide19():void
{
	clearscreen();
	resetimage.setPIEinvisible();
	sayimg.setPIEinvisible();
	
	slide18();
}	
public function endfunction2():void
{
	clearscreen();
	t1.visible = false;
	sayimg.setPIEinvisible();
	resetimage.setPIEinvisible();
	backimage.setPIEinvisible();
	nextimage.setPIEinvisible();
	heimg.setPIEinvisible();
	sheimg.setPIEinvisible();
	theyimg.setPIEinvisible();
	weimg.setPIEinvisible();
	iimg.setPIEinvisible();
	youimg.setPIEinvisible();
	itimg.setPIEinvisible();
	
	slide1();
	
}	
public function correctanswer():void
{
	pieHandle.addDisplayChild(correctimg);
	correctimg.setPIEvisible();
	
	setTimeout(disappear,500);
}	
public function wronganswer():void
{
	pieHandle.addDisplayChild(wrongimg);
	wrongimg.setPIEvisible();
	
	setTimeout(disappear, 500);
}
public function disappear():void
{
	correctimg.setPIEinvisible();
	wrongimg.setPIEinvisible();
}	
public function clearscreen():void
{
	line1.setPIEinvisible();
	line2.setPIEinvisible();
	line3.setPIEinvisible();
	line4.setPIEinvisible();
	line5.setPIEinvisible();
	line6.setPIEinvisible();
	line7.setPIEinvisible();
	line8.setPIEinvisible();
	line9.setPIEinvisible();
	line10.setPIEinvisible();	
	head1.setPIEinvisible();
	head2.setPIEinvisible();	
}	
}

}







