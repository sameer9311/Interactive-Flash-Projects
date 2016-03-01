package
{
import flash.geom.Point;
import pie.graphicsLibrary.*;
import pie.uiElements.*;
import flash.utils.*;

public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;

private var t1:PIElabel;
private var t2:PIElabel;
private var t3:PIElabel;
private var mytimer:Timer; 
private var mydelay:Number = 30;
private var currentTime:Number = 0.0;

private var PIEaspectRatio:Number;
private var worldOriginX:Number;
private var worldOriginY:Number;
private var worldWidth:Number;
private var worldHeight:Number;


/* Display Parameters */
private var displayBColor:uint;
private var displayFColor:uint;
private var UIpanelBColor:uint;
private var UIpanelFColor:uint;

/* Display Images */
private var nextimage:PIEimage;
private var backimage:PIEimage;
private var doneimage:PIEimage;
private var weimage:PIEimage;
private var youimage:PIEimage;
private var iimage:PIEimage;
private var sheimage:PIEimage;
private var heimage:PIEimage;
private var you2image:PIEimage;
private var theyimage:PIEimage;
private var ques1:PIEimage;
private var ques2:PIEimage;
private var ques3:PIEimage;
private var ques4:PIEimage;
private var ques5:PIEimage;
private var ques6:PIEimage;
private var ques7:PIEimage;
private var ques8:PIEimage;
private var ques9:PIEimage;
private var ques10:PIEimage;
private var ans1:PIEimage;
private var ans2:PIEimage;
private var ans3:PIEimage;
private var ans4:PIEimage;
private var ans5:PIEimage;
private var ans6:PIEimage;
private var ans7:PIEimage;
private var answerimage:PIEimage;

public function Experiment(pie:PIE)
{
    /* Store handle of PIE Framework */
    pieHandle = pie;    
    pieHandle.PIEsetDrawingArea(1.0,1.0);

    /* Set the foreground and background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X000000;
    displayFColor = 0XBFBFBF;
    UIpanelBColor = 0X00DD00;
    UIpanelFColor = 0XCCCCCC;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
    pieHandle.PIEsetUIpanelColors(UIpanelBColor, UIpanelFColor);

    /* Set the Experiment Details */
    pieHandle.showExperimentName("Pronouns");
    pieHandle.showDeveloperName("Sameer Sonawane");
	
	//mytimer = new Timer(1000, 1);
	//pieHandle.PIEsetDelay(1000);
    
    this.resetWorld();   
    this.resetExperiment();
	
	
    /* Create Control Objects for Pause/Resume/Reset/speed control */
    //pieHandle.PIEcreateResetButton();
    //pieHandle.ResetControl.addClickListener(this.resetExperiment);
    //pieHandle.PIEcreatePauseButton();
    //pieHandle.PIEcreateSpeedButtons();

    /* The PIE framework provides default pause/play/reset buttons in the bottom panel */
    /* If you need any more experiment control button such as next frame etc., call the function code here */
    /* Create Experiment Objects */
	//this.nextFrame();
	//slide1();
    setTimeout(slide1, 2000);
}


public function resetExperiment():void
{
    /* Initialise Physics Parameters */
    //pieHandle.PIEresumeTimer();
}

public function resetWorld():void
{
    /* get the PIE drawing area aspect ratio (width/height) to model the dimensions of our experiment area */
    PIEaspectRatio = pieHandle.PIEgetDrawingAspectRatio();

    /* Initialise World Origin and Boundaries */
    worldWidth   = 250;                           /* 250 centimeters Width */
    worldHeight  = worldWidth / PIEaspectRatio;   /* match world aspect ratio to PIE aspect ratio */
    worldOriginX = 0;               /* Origin at center */
    worldOriginY = 0;
    pieHandle.PIEsetApplicationBoundaries(worldOriginX,worldOriginY,worldWidth,worldHeight);
}

/**
 *
 * This function is called by the PIE framework after every system Timer Iterrupt
 *
 */
public function nextFrame():void
{	/*currentTime = 0.0;
	var dt:Number;
	dt = pieHandle.PIEgetDelay() / 1000;
    currentTime = currentTime + dt;
	
	while ( currentTime < mydelay )
	{
		t3 = new PIElabel(pieHandle, "i am in nextframe " + currentTime, 25, displayBColor, 0X347CB8 );
		pieHandle.addDisplayChild(t3);
		t3.x = 200;
		t3.y = 350;
		t3.visible = true;	
		currentTime = currentTime + dt;
	}
	*/
}


public function slide1():void
{
	//setTimeout(nextFrame, 2000);
	//pieHandle.PIEgetDelay();		
	
	t1 = new PIElabel(pieHandle, "PRONOUNS ", 55, displayBColor,  0X347CB8 );
	pieHandle.addDisplayChild(t1);
	t1.x = 200;
	t1.y = 230;
	t1.visible = true;	
	
	//mytimer.addEventListener(pieHandle.timer slide2);
	//mytimer.start();		
	//this.nextFrame();	
	
	setTimeout(slide2, 2000);	
	//pieHandle.PIEgetDelay();	
	
	
	
}
public function slide2():void
{
	nextimage = new PIEimage(pieHandle, 200, 160, 40, 40, PIEimageLocation.nxtImgPtr);
	pieHandle.addDisplayChild(nextimage);
	nextimage.setPIEborder(false);
	nextimage.setPIEvisible();
	
	backimage = new PIEimage(pieHandle, 20, 160, 40, 40, PIEimageLocation.bkImgPtr);
	pieHandle.addDisplayChild(backimage);
	backimage.setPIEborder(false);
	backimage.setPIEvisible();
	
	t1.visible = false;
	
	t1 = new PIElabel(pieHandle, "EXAMPLES :", 30, displayBColor,  0XE1DC28);
	pieHandle.addDisplayChild(t1);
	t1.x = 30;
	t1.y = 30;
	t1.visible = true;
	
	weimage = new PIEimage(pieHandle, 20, 40, 100, 100, PIEimageLocation.Img2Ptr);
	pieHandle.addDisplayChild(weimage);
	weimage.setPIEborder(false);
	weimage.setPIEvisible();
	
	youimage = new PIEimage(pieHandle, 150, 40 , 100, 100, PIEimageLocation.Img3Ptr);
	pieHandle.addDisplayChild(youimage);
	youimage.setPIEborder(false);
	youimage.setPIEvisible();
	
	//setTimeout(slide3, 4000);
	nextimage.addClickListener(slide3);
	backimage.addClickListener(backslide2);
}
public function backslide2():void
{
	t1.visible = false;
	weimage.setPIEinvisible();
	youimage.setPIEinvisible();
	slide1();
	backimage.setPIEinvisible();
	nextimage.setPIEinvisible();
}	
public function slide3():void
{
	weimage.setPIEinvisible();
	youimage.setPIEinvisible();
		
	iimage = new PIEimage(pieHandle, 95, 40, 100, 100, PIEimageLocation.Img4Ptr);
	pieHandle.addDisplayChild(iimage);
	iimage.setPIEborder(false);
	iimage.setPIEvisible();	
	
	//setTimeout(slide4, 4000);
	nextimage.addClickListener(slide4);
	backimage.addClickListener(backslide3);
}	
public function backslide3():void
{
	iimage.setPIEinvisible();
	slide2();
}	
public function slide4():void
{
	iimage.setPIEinvisible();
	
	sheimage = new PIEimage(pieHandle, 25, 40 , 100, 100, PIEimageLocation.Img5Ptr);
	pieHandle.addDisplayChild(sheimage);
	sheimage.setPIEborder(false);
	sheimage.setPIEvisible();
	
	heimage = new PIEimage(pieHandle, 150, 40, 100, 100, PIEimageLocation.Img6Ptr);
	pieHandle.addDisplayChild(heimage);
	heimage.setPIEborder(false);
	heimage.setPIEvisible();
	
	//setTimeout(slide5, 4000);
	nextimage.addClickListener(slide5);
	backimage.addClickListener(backslide4);
}	
public function backslide4():void
{
	sheimage.setPIEinvisible();
	heimage.setPIEinvisible();
	slide3();
}	
public function slide5():void
{
	sheimage.setPIEinvisible();
	heimage.setPIEinvisible();
	
	theyimage = new PIEimage(pieHandle, 25, 40 , 100, 100, PIEimageLocation.Img8Ptr);
	pieHandle.addDisplayChild(theyimage);
	theyimage.setPIEborder(false);
	theyimage.setPIEvisible();
	
	you2image = new PIEimage(pieHandle, 150, 40 , 100, 100, PIEimageLocation.Img7Ptr);
	pieHandle.addDisplayChild(you2image);
	you2image.setPIEborder(false);
	you2image.setPIEvisible();
	
	//setTimeout(slide6, 4000);
	nextimage.addClickListener(slide6);
	backimage.addClickListener(backslide5);
}	
public function backslide5():void
{
	theyimage.setPIEinvisible();
	you2image.setPIEinvisible();
	slide4();
}	
public function slide6():void
{
	theyimage.setPIEinvisible();
	you2image.setPIEinvisible();
	t1.visible = false;
	
	t1 = new PIElabel(pieHandle, "EXERCISES :", 30, displayBColor,  0XE1DC28);
	pieHandle.addDisplayChild(t1);
	t1.x = 30;
	t1.y = 30;
	t1.visible = true;
	
	ques1 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q1ImgPtr);
	pieHandle.addDisplayChild(ques1);
	ques1.setPIEborder(false);
	ques1.setPIEvisible();	
	
	ans1 = new PIEimage(pieHandle, 130, 40 , 40, 40, PIEimageLocation.a1ImgPtr);
	pieHandle.addDisplayChild(ans1);
	ans1.setPIEborder(false);
	ans1.setPIEvisible();
	
	ans2 = new PIEimage(pieHandle, 200, 50 , 40, 40, PIEimageLocation.a2ImgPtr);
	pieHandle.addDisplayChild(ans2);
	ans2.setPIEborder(false);
	ans2.setPIEvisible();
	
	ans3 = new PIEimage(pieHandle, 130, 60 , 40, 40, PIEimageLocation.a3ImgPtr);
	pieHandle.addDisplayChild(ans3);
	ans3.setPIEborder(false);
	ans3.setPIEvisible();
	
	ans4 = new PIEimage(pieHandle, 200, 70 , 40, 40, PIEimageLocation.a4ImgPtr);
	pieHandle.addDisplayChild(ans4);
	ans4.setPIEborder(false);
	ans4.setPIEvisible();
	
	ans5 = new PIEimage(pieHandle, 130, 80 , 40, 40, PIEimageLocation.a5ImgPtr);
	pieHandle.addDisplayChild(ans5);
	ans5.setPIEborder(false);
	ans5.setPIEvisible();
	
	ans6 = new PIEimage(pieHandle, 200, 90 , 40, 40, PIEimageLocation.a6ImgPtr);
	pieHandle.addDisplayChild(ans6);
	ans6.setPIEborder(false);
	ans6.setPIEvisible();
	
	ans7 = new PIEimage(pieHandle, 130, 100 , 40, 40, PIEimageLocation.a7ImgPtr);
	pieHandle.addDisplayChild(ans7);
	ans7.setPIEborder(false);
	ans7.setPIEvisible();
	
	ans1.addClickListener(correctanswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	
	nextimage.addClickListener(slide7);
	backimage.addClickListener(backslide6);
		
}	
public function backslide6():void
{
	ans1.setPIEinvisible();
	ans2.setPIEinvisible();
	ans3.setPIEinvisible();
	ans4.setPIEinvisible();
	ans5.setPIEinvisible();
	ans6.setPIEinvisible();
	ans7.setPIEinvisible();
	ques1.setPIEinvisible();
	slide5();
	
}
public function slide7():void
{
	ques1.setPIEinvisible();
	
	ques2 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q2ImgPtr);
	pieHandle.addDisplayChild(ques2);
	ques2.setPIEborder(false);
	ques2.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(correctanswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide8);
	backimage.addClickListener(backslide7);
}	
public function backslide7():void
{
	ques2.setPIEinvisible();
	slide6();
}	
public function slide8():void
{
	ques2.setPIEinvisible();
	
	ques3 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q3ImgPtr);
	pieHandle.addDisplayChild(ques3);
	ques3.setPIEborder(false);
	ques3.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(correctanswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide9);
	backimage.addClickListener(backslide8);
}
public function backslide8():void
{
	ques3.setPIEinvisible();
	slide7();
}	
public function slide9():void
{
	ques3.setPIEinvisible();
	
	ques4 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q4ImgPtr);
	pieHandle.addDisplayChild(ques4);
	ques4.setPIEborder(false);
	ques4.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(correctanswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide10);
	backimage.addClickListener(backslide9);
}
public function backslide9():void
{
	ques4.setPIEinvisible();
	slide8();
}
public function slide10():void
{
	ques4.setPIEinvisible();
	
	ques5 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q5ImgPtr);
	pieHandle.addDisplayChild(ques5);
	ques5.setPIEborder(false);
	ques5.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(correctanswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide11);
	backimage.addClickListener(backslide10);
}
public function backslide10():void
{
	ques5.setPIEinvisible();
	slide9();
}
public function slide11():void
{
	ques5.setPIEinvisible();
	
	ques6 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q6ImgPtr);
	pieHandle.addDisplayChild(ques6);
	ques6.setPIEborder(false);
	ques6.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(correctanswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide12);
	backimage.addClickListener(backslide11);
}
public function backslide11():void
{
	ques6.setPIEinvisible();
	slide10();
}
public function slide12():void
{
	ques6.setPIEinvisible();
	
	ques7 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q7ImgPtr);
	pieHandle.addDisplayChild(ques7);
	ques7.setPIEborder(false);
	ques7.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(correctanswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide13);
	backimage.addClickListener(backslide12);
}
public function backslide12():void
{
	ques7.setPIEinvisible();
	slide11();
}
public function slide13():void
{
	ques7.setPIEinvisible();
	
	ques8 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q8ImgPtr);
	pieHandle.addDisplayChild(ques8);
	ques8.setPIEborder(false);
	ques8.setPIEvisible();
	
	ans1.addClickListener(correctanswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide14);
	backimage.addClickListener(backslide13);
}
public function backslide13():void
{
	ques8.setPIEinvisible();
	slide12();
}
public function slide14():void
{
	ques8.setPIEinvisible();
	
	ques9 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q9ImgPtr);
	pieHandle.addDisplayChild(ques9);
	ques9.setPIEborder(false);
	ques9.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(correctanswer);
	ans7.addClickListener(wronganswer);
	
	nextimage.addClickListener(slide15);
	backimage.addClickListener(backslide14);
}
public function backslide14():void
{
	ques9.setPIEinvisible();
	slide13();
}
public function slide15():void
{
	ques9.setPIEinvisible();
	
	ques10 = new PIEimage(pieHandle, 20, 40 , 80, 80, PIEimageLocation.q10ImgPtr);
	pieHandle.addDisplayChild(ques10);
	ques10.setPIEborder(false);
	ques10.setPIEvisible();
	
	ans1.addClickListener(wronganswer);
	ans2.addClickListener(wronganswer);
	ans3.addClickListener(wronganswer);
	ans4.addClickListener(wronganswer);
	ans5.addClickListener(wronganswer);
	ans6.addClickListener(wronganswer);
	ans7.addClickListener(correctanswer);
	
	nextimage.addClickListener(slide16);
	backimage.addClickListener(backslide15);
}
public function backslide15():void
{
	ques10.setPIEinvisible();
	slide14();
}
public function slide16():void
{
	t1.visible = false;
	nextimage.setPIEinvisible();
	backimage.setPIEinvisible();
	ques10.setPIEinvisible();
	ans1.setPIEinvisible();
	ans2.setPIEinvisible();
	ans3.setPIEinvisible();
	ans4.setPIEinvisible();
	ans5.setPIEinvisible();
	ans6.setPIEinvisible();
	ans7.setPIEinvisible();
	
}	
public function correctanswer():void
{
	answerimage = new PIEimage(pieHandle, 110, 145, 30, 30, PIEimageLocation.cansImgPtr);
	pieHandle.addDisplayChild(answerimage);
	answerimage.setPIEborder(false);
	answerimage.setPIEvisible();
	
	setTimeout(eraseimage, 500);
}	
public function wronganswer():void
{
	answerimage = new PIEimage(pieHandle, 110, 145, 30, 30, PIEimageLocation.wansImgPtr);
	pieHandle.addDisplayChild(answerimage);
	answerimage.setPIEborder(false);
	answerimage.setPIEvisible();
	
	setTimeout(eraseimage, 500);
}	
public function eraseimage():void
{
	answerimage.setPIEinvisible();
}	
}   /* End of Class experiment */

}

