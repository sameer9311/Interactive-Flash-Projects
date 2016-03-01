package
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import mx.controls.Button;
import pie.graphicsLibrary.*;
import pie.uiElements.*;


public class Experiment extends Sprite
{
/* TestProject Framework Handle */
private var pieHandle:PIE;
private var firstSprite:Sprite = new Sprite();
private var buthandle:PIEbutton;


private var displayBColor:uint;
private var displayFColor:uint;
private var UIpanelBColor:uint;
private var UIpanelFColor:uint;
private var controlBColor:uint;
private var controlFColor:uint;
private var t1:PIElabel;
private var t2:PIElabel;
private var t3:PIElabel;
private var t4:PIElabel;
private var t5:PIElabel;
private var t6:PIElabel;
private var t7:PIElabel;
private var PIEaspectRatio:Number;
private var worldOriginX:Number;
private var worldOriginY:Number;
private var worldWidth:Number;
private var worldHeight:Number;
private var currentTime:Number;
private var b1:PIEbutton;
private var nextButton:PIEradioButton;
private var doneButton:PIEradioButton;
private var magnetImage:PIEimage;
private var img3:PIEimage;
private var img4:PIEimage;
private var img5:PIEimage;
private var img6:PIEimage;
private var img7:PIEimage;
private var img8:PIEimage;
private var img9:PIEimage;
private var img10:PIEimage;
private var img11:PIEimage;
private var oTableX:Number;
private var oTableY:Number;
private var oTableRows:Number;
private var oTableColumns:Number;
private var currentObservation:uint;
private var currentEntryColumn:uint;
public var flag:Boolean;
public var cond:Boolean;
private var captureData:PIEobservationTable;
private var score:uint;
    

public function Experiment(pie:PIE)
{
    /* Store handle of PIE Framework */
    pieHandle = pie;

    /* Call a PIE framework function to set the dimensions of the drawing area, right panel and bottom panel */
    /* We will reserve 90% width and 90%height for the drawing area */
    pieHandle.PIEsetDrawingArea(0.90,0.90);
   

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0X0D0D0D;
    displayFColor = 0XBFBFBF;
    UIpanelBColor = 0X347CBB;
    UIpanelFColor = 0XCCCCCC;
    controlBColor = 0X8888DD;
    controlFColor = 0XCCCCCC;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
    pieHandle.PIEsetUIpanelColors(UIpanelBColor, UIpanelFColor); 

    /* Set the Experiment Details */
    pieHandle.showExperimentName("Balancing of Chemical Reactions ");
    pieHandle.showDeveloperName("Sameer Sonawane");

	
	
	this.resetWorld();
	this.introduction();
	
	nextButton = new PIEradioButton(pieHandle, "gravity", "Next", 0.0);
	nextButton.addClickListener(slide2);
	pieHandle.addRadioButton(nextButton);
	
	doneButton = new PIEradioButton(pieHandle, "gravity", "Done", 0.0);
	
	
}
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
public function introduction():void
{
	//pieHandle.PIEsetDelay(100);
	currentTime=0.0
	t1 = new PIElabel(pieHandle, "Law of conservation of mass states that mass can  neither be \n created  nor destroyed in a chemical reaction.", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 10;
	t1.y = 40;
	t1.visible = true;
	
	//this.nextFrame();
	//pieHandle.PIEgetDelay();
	
	t2 = new  PIElabel(pieHandle, "Hence the total mass of the elements present in the products  \n of a chemical reaction has to be equal to the total mass \n of the elements present in the reactants.", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 160;
	t2.visible = true;
	
	//this.nextFrame();
	//pieHandle.PIEgetDelay();
	
	t3 = new PIElabel(pieHandle, "Thus, the number of atoms of each element remains the \n same, before and after a chemical reaction.", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t3);
	t3.x = 10;
	t3.y = 340;
	t3.visible = true;
	
	//buthandle = new PIEbutton(pieHandle, "Next");
	//buthandle.addClickListener(slide2);	
}
public function nextFrame():void
{
	
	
}
public function slide2(gValue:Number):void
{
	t1.visible = false;
	t2.visible = false;
	t3.visible = false;
	
	t4 = new PIElabel(pieHandle, "Example of Balanced Reactions:", 40, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t4);	
	t4.x = 10;
	t4.y = 40;
	t4.visible = true;
	
	t5 = new PIElabel(pieHandle, "Zn + H2SO4 → ZnSO4 + H2", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t5);
	t5.x = 150;
	t5.y = 100;
	t5.visible = true;
	
	magnetImage = new PIEimage(pieHandle, 0.4, 0.8, 2.2, 2.2 , PIEimageLocation.magnetImgPtr);
	pieHandle.addDisplayChild(magnetImage);
	//imagee2.setPIEborder(false);
	//this.imagee2.setPIEvisible();
	
	t6 = new PIElabel(pieHandle, "As the number of atoms of each element is the same on both \n sides of the arrow, it is a balanced chemical equation.", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t6);
	t6.x = 10;
	t6.y = 400;
	t6.visible = true;
	
	
	nextButton.addClickListener(slide3);
	
	
}	

public function slide3(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t6.visible = false;
	magnetImage.setPIEinvisible();
	
	t1 = new PIElabel(pieHandle, "How to balance a reaction?", 40, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t1);	
	t1.x = 10;
	t1.y = 40;
	t1.visible = true;
	
	t2 = new  PIElabel(pieHandle, "Let us try to balance the following chemical equation –", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 120;
	t2.visible = true;
	
	t5 = new PIElabel(pieHandle, "Fe + H2O → Fe3O4 + H2", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t5);
	t5.x = 150;
	t5.y = 180;
	t5.visible = true;
	
	t6 = new PIElabel(pieHandle, "Step I: To balance a chemical equation, first draw boxes \n around each formula. Do not change anything inside \n the boxes while balancing the equation.", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t6);
	t6.x = 10;
	t6.y = 240;
	t6.visible = true;
	
	img3 = new PIEimage(pieHandle, 0.5, 1.6, 2, 2 , PIEimageLocation.imag3Ptr);
	pieHandle.addDisplayChild(img3);
	
	nextButton.addClickListener(slide4);
	
	
	
}

public function slide4(gvalue:Number):void
{
	t1.visible = false;
	t2.visible = false;
	t5.visible = false;
	t6.visible = false;
	img3.setPIEinvisible();
	
	t1 = new  PIElabel(pieHandle, "Step II: List the number of atoms of different elements  \n present  in the unbalanced equation : ", 25, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 10;
	t1.y = 40;
	t1.visible = true;
	
	img4 = new PIEimage(pieHandle, 0.5, 0.8, 2.1, 2.1 , PIEimageLocation.imag4Ptr);
	pieHandle.addDisplayChild(img4);
	
	nextButton.addClickListener(slide5);
	
	
	
}

public function slide5(gvalue:Number):void
{
	t1.visible = false;
	img4.setPIEinvisible();
	
	t2 = new  PIElabel(pieHandle, "Step III: It is often convenient to start balancing with the \n compound that contains the maximum number  of atoms. It \n  may be a reactant or a product. In that compound, select  \n the element which has  the maximum number of atoms. Using  \n these criteria, we select Fe3O4 and the element oxygen in it. \n There are four oxygen atoms on the RHS and only one \n on the LHS.\n To balance Oxygen atoms-", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 40;
	t2.visible = true;
	
	img5 = new PIEimage(pieHandle, 0.5, 1.1, 2.2, 2.2 , PIEimageLocation.imag5Ptr);
	pieHandle.addDisplayChild(img5);
	
	t3 = new PIElabel(pieHandle, "To equalise the number of atoms, it must be remembered that we \n cannot alter the formulae of the compounds or  \n elements involved in the reactions. For example, to balance oxygen \n atoms we can put coefficient ‘4’ as 4 H2O and not H2O4 or (H2O)4", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t3);
	t3.x = 10;
	t3.y = 380;
	t3.visible = true;
	
	nextButton.addClickListener(slide6);
	
}

public function slide6(gvalue: Number):void
{
	t2.visible = false;
	img5.setPIEinvisible();
	t3.visible = false;
	
	t4 = new PIElabel(pieHandle, "Now the partly balanced equation becomes –", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t4);	
	t4.x = 10;
	t4.y = 40;
	t4.visible = true;
	
	img6 = new PIEimage(pieHandle, 0.5, 0.3, 2.2, 2.1 , PIEimageLocation.imag6Ptr);
	pieHandle.addDisplayChild(img6);
	
	t5 = new PIElabel(pieHandle, "Step IV: Fe and H atoms are still not balanced. Pick any of these elements to \n proceed further. Let us balance hydrogen atoms in the partly balanced \n equation. To equalise the number of H atoms, make the number \n of molecules of hydrogen as four on the RHS.", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t5);
	t5.x = 10;
	t5.y = 150;
	t5.visible = true;
	
	img7 = new PIEimage(pieHandle, 0.5, 1.2, 2, 2 , PIEimageLocation.imag7Ptr);	
	pieHandle.addDisplayChild(img7);
	
	t6 = new PIElabel(pieHandle, "The partly balnced equation would be –", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t6);
	t6.x = 10;
	t6.y = 360;
	t6.visible = true;
	
	img8 = new PIEimage(pieHandle, 0.5, 1.8, 2.3, 2.2 , PIEimageLocation.imag8Ptr);
	pieHandle.addDisplayChild(img8);
	
	nextButton.addClickListener(slide7);
	
	
}	

public function slide7(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t6.visible = false;
	img6.setPIEinvisible();
	img7.setPIEinvisible();
	img8.setPIEinvisible();
	
	t1 = new  PIElabel(pieHandle, "Step V: Examine the above equation and pick up the third element \n which is not balanced. You find  that only one element is left to be balanced, \n that is, iron.", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t1);
	t1.x = 10;
	t1.y = 40;
	t1.visible = true;
	
	img9 = new PIEimage(pieHandle, 0.5, 0.6, 2.3, 2.2 , PIEimageLocation.imag9Ptr);
	pieHandle.addDisplayChild(img9);
	
	t2 = new  PIElabel(pieHandle, "To equalise Fe, we take three atoms of Fe on the LHS.\n\n Step VI: Finally, to check the correctness of the balanced equation, \n we count atoms of each element on both sides of the equation.", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 250;
	t2.visible = true;
	
	img10 = new PIEimage(pieHandle, 0.5, 1.6, 2, 2 , PIEimageLocation.imag10Ptr);
	pieHandle.addDisplayChild(img10);
	
	t3 = new  PIElabel(pieHandle, "The numbers of atoms of elements on both sides of Equation are equal. \n  This equation is now balanced. This method of  balancing chemical \n equations is called hit-and-trial method as we  make trials \n to balance the equation by using the smallest  whole  number coefficient.", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t3);
	t3.x = 10;
	t3.y = 420;
	t3.visible = true;
	
	nextButton.addClickListener(slide8);
}

public function slide8(gvalue:Number):void
{
	t1.visible = false;
	t2.visible = false;
	t3.visible = false;
	img9.setPIEinvisible();
	img10.setPIEinvisible();
	
	t4 = new  PIElabel(pieHandle, "Step VII: Writing Symbols of Physical States:", 30, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t4);
	t4.x = 10;
	t4.y = 40;
	t4.visible = true;
	
	t5 = new  PIElabel(pieHandle, "To make a chemical equation more informative, the physical \n states of the reactants and products are mentioned along with their  \n chemical formulae. The gaseous, liquid, aqueous and solid states of \n reactants and products are represented by the notations (g), (l), (aq) and (s), \n respectively. The word aqueous (aq) is written if the reactant or product  \n is present as a solution in water.\n\n The balanced Equation becomes-", 20, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t5);
	t5.x = 10;
	t5.y = 120;
	t5.visible = true;
	
	img11 = new PIEimage(pieHandle, 0.5, 1.6, 2, 2 , PIEimageLocation.imag11Ptr);
	pieHandle.addDisplayChild(img11);
	
	nextButton.addClickListener(slide9);
	
}

public function slide9(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	img11.setPIEinvisible();
	
	pieHandle.addRadioButton(doneButton);
	
	t6 = new PIElabel(pieHandle, "Exercises :", 40, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t6);
	t6.x = 10;
	t6.y = 10;
	t6.visible = true;
	
	t1 = new  PIElabel(pieHandle, "Balance the following reactions ", 20, displayBColor, 0XFF7E0B);
	pieHandle.addDisplayChild(t1);
	t1.x = 10;
	t1.y = 100;
	t1.visible = true;
	
	t2 = new  PIElabel(pieHandle, "  Mg  +  O2  →  MgO ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 100;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 3;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);
	
	

    this.initialiseTable1();
	
	
}

public function initialiseTable1():void
{
	var rIndex:Number;
    var cIndex:Number;
	score = 0;
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "   Mg   ");
    captureData.setTextCell(0, 1, "   O2   ");
    captureData.setTextCell(0, 2, "   MgO   ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText1);
	
	doneButton.addClickListener(flagFunction1);	
	
	
	
	nextButton.addClickListener(slide10);
	
}

public function flagFunction1(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                  ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   1   ");
    captureData.setTextCell(1, 2, "   2   ");
		
		
	}
}	

private function checkEnteredText1(eRow:uint, eColumn:uint, eText:String ):void
{
var trim:RegExp = /^\s+|\s+$/g;

    eText = eText.replace(trim, "");
	
	
	
    if (eText.length > 0)
    {
	    switch (eColumn)
        {
          case 0 :
            
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
          case 1 :
           
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
          case 2 :
            
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
		
		   case 3 :
           
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;	
          default :
            break;
		}
    }
	
		
}

private function acceptEnteredText1(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 1, 2 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}

public function slide10(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	
	t2 = new  PIElabel(pieHandle, "  CH4 + O2 → CO2 + H2O   ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 100;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable2();
}
public function initialiseTable2():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "   CH4   ");
    captureData.setTextCell(0, 1, "   O2   ");
    captureData.setTextCell(0, 2, "   CO2   ");
	captureData.setTextCell(0, 3, "   H2O   ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText2);
	
	doneButton.addClickListener(flagFunction2);	
	nextButton.addClickListener(slide11);
	
}
private function acceptEnteredText2(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(1, 2, 1, 2 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction2(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                       ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   1   ");
    captureData.setTextCell(1, 1, "   2   ");
    captureData.setTextCell(1, 2, "   1   ");
	captureData.setTextCell(1, 3, "   2   ");	
		
	}
}	

public function slide11(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	t2 = new  PIElabel(pieHandle, " H2SO4 + Fe → Fe2(SO4)3 + H2   ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable3();
}
public function initialiseTable3():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "   H2SO4   ");
    captureData.setTextCell(0, 1, "   Fe   ");
    captureData.setTextCell(0, 2, "   Fe2(SO4)3   ");
	captureData.setTextCell(0, 3, "   H2   ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText3);
	
	doneButton.addClickListener(flagFunction3);	
	nextButton.addClickListener(slide12);
	
}
private function acceptEnteredText3(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(3, 2, 1, 3 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction3(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                    ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   3   ");
    captureData.setTextCell(1, 1, "   2   ");
    captureData.setTextCell(1, 2, "   1   ");
	captureData.setTextCell(1, 3, "   3   ");	
		
	}
}	
public function slide12(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " Na + H2O → NaOH + H2   ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 100;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable4();
}
public function initialiseTable4():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     Na     ");
    captureData.setTextCell(0, 1, "     H2O      ");
    captureData.setTextCell(0, 2, "     NaOH     ");
	captureData.setTextCell(0, 3, "     H2       ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText4);
	
	doneButton.addClickListener(flagFunction4);	
	nextButton.addClickListener(slide13);
	
}
private function acceptEnteredText4(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 2, 2, 1 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction4(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                     ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   2   ");
    captureData.setTextCell(1, 2, "   2   ");
	captureData.setTextCell(1, 3, "   1   ");	
		
	}
}
public function slide13(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " C3H8 + O2 →  H2O + CO2  ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 100;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable5();
}

public function initialiseTable5():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     C3H8     ");
    captureData.setTextCell(0, 1, "     O2       ");
    captureData.setTextCell(0, 2, "     H2O      ");
	captureData.setTextCell(0, 3, "     CO2      ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText5);
	
	doneButton.addClickListener(flagFunction5);	
	nextButton.addClickListener(slide14);
	
}
private function acceptEnteredText5(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(1, 5, 4, 3 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction5(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                  ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   1   ");
    captureData.setTextCell(1, 1, "   5   ");
    captureData.setTextCell(1, 2, "   4   ");
	captureData.setTextCell(1, 3, "   3   ");	
		
	}
}
public function slide14(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " HNO3 + Ca(OH)2 →  Ca(NO3)2 + H2O  ", 35, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable6();
}
public function initialiseTable6():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     HNO3     ");
    captureData.setTextCell(0, 1, "    Ca(OH)2   ");
    captureData.setTextCell(0, 2, "    Ca(NO3)2  ");
	captureData.setTextCell(0, 3, "     H2O      ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText6);
	
	doneButton.addClickListener(flagFunction6);	
	nextButton.addClickListener(slide15);
	
}
private function acceptEnteredText6(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 1, 1, 2 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction6(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                    ", 30, displayBColor,0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   1   ");
    captureData.setTextCell(1, 2, "   1   ");
	captureData.setTextCell(1, 3, "   2   ");	
		
	}
}
public function slide15(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " NaCl + AgNO3 →  AgCl + NaNO3  ", 40, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable7();
}
public function initialiseTable7():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     NaCl       ");
    captureData.setTextCell(0, 1, "     AgNO3      ");
    captureData.setTextCell(0, 2, "     AgCl       ");
	captureData.setTextCell(0, 3, "     NaNo3      ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText7);
	
	doneButton.addClickListener(flagFunction7);	
	nextButton.addClickListener(slide16);
	
}
private function acceptEnteredText7(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(1, 1, 1, 1 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction7(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                   ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   1   ");
    captureData.setTextCell(1, 1, "   1   ");
    captureData.setTextCell(1, 2, "   1   ");
	captureData.setTextCell(1, 3, "   1   ");	
		
	}
}
public function slide16(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " NaOH + H2SO4 →  Na2SO4 + H2O  ", 35, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable8();
}
public function initialiseTable8():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     NaOH        ");
    captureData.setTextCell(0, 1, "     H2SO4       ");
    captureData.setTextCell(0, 2, "     Na2SO4      ");
	captureData.setTextCell(0, 3, "     H2O         ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText8);
	
	doneButton.addClickListener(flagFunction8);	
	nextButton.addClickListener(slide17);
	
}
private function acceptEnteredText8(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 1, 1, 2 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction8(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                   ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   1   ");
    captureData.setTextCell(1, 2, "   1   ");
	captureData.setTextCell(1, 3, "   2   ");	
		
	}
}
public function slide17(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " C6H5COOH + O2 →  CO2 + H2O  ", 35, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 150;
	t2.visible = true;
	
	oTableX = 220;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable9();
}
public function initialiseTable9():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "     C6H5COOH    ");
    captureData.setTextCell(0, 1, "        O2       ");
    captureData.setTextCell(0, 2, "        CO2      ");
	captureData.setTextCell(0, 3, "      H2O         ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText9);
	
	doneButton.addClickListener(flagFunction9);	
	nextButton.addClickListener(slide18);
	
}
private function acceptEnteredText9(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 15, 14, 6 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction9(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                            ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   15  ");
    captureData.setTextCell(1, 2, "   14  ");
	captureData.setTextCell(1, 3, "   6   ");	
		
	}
}
public function slide18(gvalue:Number):void
{
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	
	t2 = new  PIElabel(pieHandle, " KMnO4 + HCl  →  KCl + MnCl2 + H2O + Cl2  ", 31, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 10;
	t2.y = 160;
	t2.visible = true;
	
	oTableX = 160;
    oTableY = 220;
    oTableRows = 2;
    oTableColumns = 6;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);
	//captureData.setTextHeightTable(200);

    this.initialiseTable10();
}
public function initialiseTable10():void
{
	var rIndex:Number;
    var cIndex:Number;
	
	flag = true;
	cond = false;
	
	 //var headerRow:Array = new Array("Mg", "O2", "MgO");
	 
	 captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
	for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");
			 
	currentObservation = 0;
    currentEntryColumn = 0;
    //captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFFFF00);
	
	captureData.setEditableTable(true);
	
	captureData.setTextCell(0, 0, "         KMnO4    ");
    captureData.setTextCell(0, 1, "         HCl      ");
    captureData.setTextCell(0, 2, "         KCl     ");
	captureData.setTextCell(0, 3, "         MnCl2   ");
	captureData.setTextCell(0, 4, "         H2O     ");
	captureData.setTextCell(0, 5, "         Cl2     ");
    captureData.highlightRow(0, 0x0FFFF00);
    //captureData.highlightColumn(0, 0xFF0000);
	
	captureData.setEditableCell((currentObservation + 1), (currentEntryColumn), true);
	
	captureData.addChangeListener(checkEnteredText1);
	captureData.addCompletionListener(acceptEnteredText10);
	
	doneButton.addClickListener(flagFunction10);	
	nextButton.addClickListener(slide19);
	
}
private function acceptEnteredText10(eRow:uint, eColumn:uint):void
{		
	var cIndex:Number;
	var eText:String;
	var lNumber:uint;
	
	var trim:RegExp = /^\s+|\s+$/g;
	var solution:Array = new Array(2, 16, 2, 2, 8, 5 );	
	
	eText = captureData.getText(1,eColumn);
	eText = eText.replace(trim, ""); 
	lNumber = Number(eText);
	if ( solution[eColumn] == lNumber)
	{
		if (eColumn == oTableColumns - 1)
		{
			cond = true;
		}
	}
	else
	{
	flag = false;
	}	
	
}
public function flagFunction10(gvalue:Number):void
{
	if (flag==true && cond==true )
	{
		t4 = new  PIElabel(pieHandle, "Correct Answer!!                                                              ", 30, displayBColor, 0X55961E);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		score = score + 1;
			
	t7 = new  PIElabel(pieHandle, "Your current Score:  "+score, 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	}
	else
	{
		t5 = new  PIElabel(pieHandle, "Wrong Answer!! Correct answer is shown above:", 30, displayBColor, 0X990033);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
		
	captureData.setTextCell(1, 0, "   2   ");
    captureData.setTextCell(1, 1, "   16  ");
    captureData.setTextCell(1, 2, "   2  ");
	captureData.setTextCell(1, 3, "   2   ");
	captureData.setTextCell(1, 4, "   8   ");
	captureData.setTextCell(1, 5, "   5   ");
		
	}
}
public function slide19(gvalue:Number):void
{
	var num:uint;
	t4.visible = false;
	t5.visible = false;
	t2.visible = false;
	t6.visible = false;
	t1.visible = false;
	t3.visible = false;
	t2.visible = false;
	
	
	t2 = new  PIElabel(pieHandle, "  You Scored   "+ score+"  Out  of  10", 35, displayBColor, displayFColor);
	pieHandle.addDisplayChild(t2);
	t2.x = 100;
	t2.y = 150;
	t2.visible = true;
	
				
	t7 = new  PIElabel(pieHandle, "                                        ", 25, displayBColor, controlFColor);
	pieHandle.addDisplayChild(t7);
	t7.x = 300;
	t7.y = 450;
	t7.visible = true;
	
	if (score > 8)
	{
	t1 = new  PIElabel(pieHandle, "Keep    it    UP  !!      " ,65, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t1);
	t1.x = 100;
	t1.y = 220;
	t1.visible = true;
	}
	else if (score > 5)
	{
		t1 = new  PIElabel(pieHandle, "     Well Done !!      " ,65, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t1);
	t1.x = 100;
	t1.y = 220;
	t1.visible = true;
	}
	else
	{
		t1 = new  PIElabel(pieHandle, "    Practice!!!                 " ,65, displayBColor, 0XFFFF00);
	pieHandle.addDisplayChild(t1);
	t1.x = 100;
	t1.y = 220;
	t1.visible = true;
	}
	
	t5 = new  PIElabel(pieHandle, "                                                                           ", 30, displayBColor, displayFColor);
		pieHandle.addDisplayChild(t5);
		t5.x = 10;
		t5.y = 300;
		t5.visible = true;
	
	doneButton.addClickListener(endfunction);
}
public function endfunction(gvalue:Number):void
{ 
	t4 = new  PIElabel(pieHandle, "                                                                            ", 30, displayBColor, displayFColor);
		pieHandle.addDisplayChild(t4);
		t4.x = 10;
		t4.y = 300;
		t4.visible = true;
		
}	
	
}
}
	
	
	
	

    
