package
{
import mx.skins.halo.DateChooserYearArrowSkin;
import flash.geom.Point;
import pie.graphicsLibrary.*;
import pie.uiElements.*;
import opticsLibrary.*;

public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;

/**
 *
 * This section contains Physics Parameters
 *
 */
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
private var UIpanelBColor:uint;
private var UIpanelFColor:uint;
private var lensColor:uint;
private var arrowColor:uint;
private var sourceOColor:uint;
private var imageOColor:uint;
/* Bob Parameters */
/* Layout Variables */

/**
 *
 * This section contains current state variables
 *
 */
/* Position Variables */
private var mainLensX:Number;
private var mainLensH:Number;
private var mainLensR:Number;
private var sourceOX:Number;
private var sourceOH:Number;
private var imageOX:Number;
private var imageOH:Number;
private var focalLength:Number;
private var dSequence:uint;

/**
 *
 * This section stores the handles of Drawing and UI Objects
 *
 */
private var mainLens:PIElens; 
private var sourceO:PIEthickArrow; 
private var imageO:PIEthickArrow; 
/* ray Objects */
private var parallelRayS:PIEarrow;
private var parallelRayI:PIEarrow;
private var centerRayS:PIEarrow;
private var centerRayI:PIEarrow;
private var focusRayS:PIEarrow;
private var focusRayI:PIEarrow;

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
    /* We will reserve 100% width and 100%height for the drawing area */
    pieHandle.PIEsetDrawingArea(1.0,1.0);

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0XFFFF44;
    displayFColor = 0XAA0000;
    UIpanelBColor = 0X00DD00;
    UIpanelFColor = 0XCCCCCC;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
    pieHandle.PIEsetUIpanelColors(UIpanelBColor, UIpanelFColor);

    /* Set the Experiment Details */
    pieHandle.showExperimentName("Interactive Lens");
    pieHandle.showDeveloperName("Avinash Awate");

    /* Initialise World Origin and Boundaries */
    this.resetWorld();

    /* define the position of all the global (static) variables */
    /* Code in a single Function (recommended) for reuse */
    this.resetExperiment();

    /* The PIE framework provides default pause/play/reset buttons in the bottom panel */
    /* If you need any more experiment control button such as next frame etc., call the function code here */
    /* Create Experiment Objects */
    createExperimentObjects();
}

/**
 *
 * This function is called by the PIE framework to reset the experiment to default values
 * It defines the values of all the global (static) variables
 *
 */
public function resetExperiment():void
{
    /* Initialise Physics Parameters */
    mainLensX = 0.0;
    mainLensH = 40.0;
    mainLensR = 60.0;
    focalLength = 30.0
    sourceOX   = -70.0;
    sourceOH   = -15.0;
    if ((sourceOX - mainLensX) > 0) this.focalLength = -this.focalLength;
    this.calculateImagePosition();
    this.calculateRayPositions();
}

public function calculateImagePosition():void
{
    imageOX    = mainLensX + (focalLength * (sourceOX - mainLensX)) / (focalLength + (sourceOX - mainLensX));
    imageOH    = (imageOX - mainLensX) * sourceOH / (sourceOX - mainLensX);
    if (imageO != null)
    {
        if (imageO.isPIEvisible() && (Math.abs(imageOX) > (worldWidth / 2))) imageO.setPIEinvisible();
        else if (!imageO.isPIEvisible() && (Math.abs(imageOX) <= (worldWidth / 2))) imageO.setPIEvisible();
        if (Math.abs(this.imageOH) <= (worldHeight / 2))
        {    /* Draw Parallel Rays */
            imageO.changeArrow(imageOX, 0, imageOX, imageOH); imageO.setPIEvisible();
        }
        else
        {
            imageO.setPIEinvisible();
        }
    }
}

public function calculateRayPositions():void
{
    if ((this.mainLensH / 2) > Math.abs(this.sourceOH))
    {    /* Draw Parallel Rays */
        if (parallelRayS != null) { parallelRayS.changeArrow(sourceOX, sourceOH, mainLensX, sourceOH); parallelRayS.setPIEvisible(); }
        if (parallelRayI != null) { parallelRayI.changeArrow(mainLensX, sourceOH, imageOX, imageOH); parallelRayI.setPIEvisible(); }
    }
    else
    {
        if (parallelRayS != null) parallelRayS.setPIEinvisible();
        if (parallelRayI != null) parallelRayI.setPIEinvisible();
    }
    /* Draw Center Rays */
    if (centerRayS != null) { centerRayS.changeArrow(sourceOX, sourceOH, mainLensX, 0); centerRayS.setPIEvisible(); }
    if (centerRayI != null) { centerRayI.changeArrow(mainLensX, 0, imageOX, imageOH); centerRayI.setPIEvisible(); }
    if ((this.mainLensH / 2) > Math.abs(this.imageOH))
    {    /* Draw Focus Rays */
        if (focusRayS != null) { focusRayS.changeArrow(sourceOX, sourceOH, mainLensX, imageOH); focusRayS.setPIEvisible(); }
        if (focusRayI != null) { focusRayI.changeArrow(mainLensX, imageOH, imageOX, imageOH); focusRayI.setPIEvisible(); }
    }
    else
    {
        if (focusRayS != null) focusRayS.setPIEinvisible();
        if (focusRayI != null) focusRayI.setPIEinvisible();
    }
}

/*
 * This function resets the world boundaries and adjusts display to match the world boundaries
 */
public function resetWorld():void
{
    /* get the PIE drawing area aspect ratio (width/height) to model the dimensions of our experiment area */
    PIEaspectRatio = pieHandle.PIEgetDrawingAspectRatio();

    /* Initialise World Origin and Boundaries */
    worldWidth   = 150;                            /* 250 centimeters Width */
    worldHeight  = worldWidth / PIEaspectRatio;   /* match world aspect ratio to PIE aspect ratio */
    worldOriginX = (-worldWidth/2);               /* Origin at center */
    worldOriginY = (-worldHeight/2);
    pieHandle.PIEsetApplicationBoundaries(worldOriginX,worldOriginY,worldWidth,worldHeight);
}

/**
 *
 * This function is called by the PIE framework after every system Timer Iterrupt
 *
 */
public function nextFrame():void
{
}

/**
 *
 * This function is called to create the experiment objects
 * It calls the appropriate constructors to create drawing objects
 * It also sets callback variables to point to callback code
 *
 */
private function createExperimentObjects():void
{
var centerLine:PIEline;

    /* Set Default Colors */
    lensColor    = 0x888888;
    arrowColor   = 0xAA0000;
    sourceOColor = 0x00FF00;
    imageOColor  = 0x0000FF;

    centerLine = new PIEline(pieHandle, -(worldWidth / 2), 0, worldWidth / 2, 0, 0x000000, 1, 1.0);
    pieHandle.addDisplayChild(centerLine);
    /* Create Lens */
    mainLens = new PIElens(pieHandle, mainLensX, 0, mainLensH, mainLensR, mainLensR, lensColor);
    mainLens.changeFill(lensColor,0.3);
    mainLens.addStretchListeners(handleStretchBegin, handleStretchEnd);
    mainLens.addDragListeners(handleLensGrab, handleLensDrag, handleLensDrop);
    pieHandle.addDisplayChild(mainLens);

    /* Create Source and Image */
    sourceO = new PIEthickArrow(pieHandle, sourceOX, 0, sourceOX, sourceOH, arrowColor, 1.0);
    pieHandle.addDisplayChild(sourceO);
    imageO = new PIEthickArrow(pieHandle, imageOX, 0, imageOX, imageOH, arrowColor, 1.0);
    pieHandle.addDisplayChild(imageO);

    /* Create Rays */
    parallelRayS = new PIEarrow(pieHandle, sourceOX, sourceOH, mainLensX, sourceOH, sourceOColor);
    parallelRayS.changeBorder(2, sourceOColor, 1.0);
    pieHandle.addDisplayChild(parallelRayS);

    parallelRayI = new PIEarrow(pieHandle, mainLensX, sourceOH, imageOX, imageOH, imageOColor);
    parallelRayI.changeBorder(2, imageOColor, 1.0);
    pieHandle.addDisplayChild(parallelRayI);

    centerRayS = new PIEarrow(pieHandle, sourceOX, sourceOH, mainLensX, 0, sourceOColor);
    centerRayS.changeBorder(2, sourceOColor, 1.0);
    pieHandle.addDisplayChild(centerRayS);

    centerRayI = new PIEarrow(pieHandle, mainLensX, 0, imageOX, imageOH, imageOColor);
    centerRayI.changeBorder(2, imageOColor, 1.0);
    pieHandle.addDisplayChild(centerRayI);

    focusRayS = new PIEarrow(pieHandle, sourceOX, sourceOH, mainLensX, imageOH, sourceOColor);
    focusRayS.changeBorder(2, sourceOColor, 1.0);
    pieHandle.addDisplayChild(focusRayS);

    focusRayI = new PIEarrow(pieHandle, mainLensX, imageOH, imageOX, imageOH, imageOColor);
    if (Math.abs(imageOH) > (mainLensH / 2))
    {
        focusRayS.setPIEinvisible();
        focusRayI.setPIEinvisible();
    }
    focusRayI.changeBorder(2, imageOColor, 1.0);
    pieHandle.addDisplayChild(focusRayI);
}

/**
 *
 * This function handles the Lens Grab event
 * clickX : X Position where mouse was clicked
 * clickY : Y Position where mouse was clicked
 *
 */
public function handleLensGrab(clickX:Number, clickY:Number):void
{
}

/**
 *
 * This function handles the Lens Drag event
 * newX : X position of Mouse
 * newY : Y position of Mouse
 * displacementX : difference in X between two mouse listener calls
 * displacementY : difference in Y between two mouse listener calls
 *
 */
public function handleLensDrag(newX:Number, newY:Number, displacementX:Number, displacementY:Number):void
{
    if ((sourceOX - mainLensX) * (sourceOX - newX) < 0) this.focalLength = -this.focalLength;
    this.mainLensX = newX;
    this.calculateImagePosition();
    this.calculateRayPositions();
}

/**
 *
 * This function handles the Lens Drop event
 * newX : X position of Mouse
 * newY : Y position of Mouse
 * displacementX : difference in X between two mouse listener calls
 * displacementY : difference in Y between two mouse listener calls
 *
 */
public function handleLensDrop(newX:Number, newY:Number, displacementX:Number, displacementY:Number):void
{
    if ((sourceOX - mainLensX) * (sourceOX - newX) < 0) this.focalLength = -this.focalLength;
    this.mainLensX = newX;
    this.calculateImagePosition();
    this.calculateRayPositions();
}

/**
 *
 * This function handles the stretch begin event
 * clickX : X Position where mouse was clicked
 * clickY : Y Position where mouse was clicked
 *
 */
public function handleStretchBegin(clickX:Number, clickY:Number):void
{
}

/**
 *
 * This function handles the stretch end event
 * newX : X position of Mouse
 * newY : Y position of Mouse
 * displacementX : difference in X between two mouse listener calls
 * displacementY : difference in Y between two mouse listener calls
 *
 */
public function handleStretchEnd(newX:Number, newY:Number, displacementX:Number, displacementY:Number):void
{
    this.focalLength = this.mainLens.getFocalLength();
    if ((sourceOX - mainLensX) > 0) this.focalLength = -this.focalLength;
    this.calculateImagePosition();
    this.calculateRayPositions();
}

}   /* End of Class experiment */

}
