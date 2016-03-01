package
{
import flash.geom.Point;
import pie.graphicsLibrary.*;
import pie.uiElements.*;


public class Experiment
{
/* TestProject Framework Handle */
private var pieHandle:PIE;

/**
 *
 * This section contains Physics Parameters
 *
 */
private var tanLimit:Number;
private var gravity:Number;
private var kineticEnergy:Number;
private var potentialEnergy:Number;
private var thermalEnergy:Number;
private var totalEnergy:Number;
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
private var controlBColor:uint;
private var controlFColor:uint;
private var ceilingColor:uint;
private var tieStringColor:uint;
private var bobColor:uint;
/* Bob Parameters */
private var bobLength:Number;
private var bobMass:Number;
private var bobRadius:Number;
/* Layout Variables */
private var hookX:Number;
private var hookY:Number;

/**
 *
 * This section contains current state variables
 *
 */
/* Bob Position Variables */
private var bobAngle:Number;
private var bobMaxAngle:Number;
private var bobAcceleration:Number;
private var bobVelocity:Number;
private var bobX:Number;
private var bobY:Number;
/* Time Variables */
private var bobPeriod:Number;
private var bobNextTop:Number;
private var currentTime:Number;

/* Observation Table Variables */
private var oTableX:Number;
private var oTableY:Number;
private var oTableRows:Number;
private var oTableColumns:Number;
private var currentObservation:uint;
private var currentEntryColumn:uint;
private var userOscillations:uint;
private var userTotalTime:Number;
private var userPeriod:Number;

/**
 *
 * This section stores the handles of Drawing and UI Objects
 *
 */
private var ceiling:PIErectangle; 
private var tieString:PIEline; 
private var bob:PIEcircle; 
private var hookCircle:PIEtriangle; 

private var stopWatchTool:PIEstopWatch;
private var captureData:PIEobservationTable;

private var lengthSlider:PIEhslider;
private var massSlider:PIEhslider;
/* Radio Buttons for 8 planets and moon */
private var lengthText:PIElabelledInput;
/* Flags to control arrow display */
private var showStopWatch:Boolean;

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
    pieHandle.PIEsetDrawingArea(0.7,0.85);
    this.tanLimit = Math.tan(Math.PI/6);

    /* Set the foreground ande background colours for the three areas */
    /* (Different panels are provided and you can set individually as well) */
    displayBColor = 0XFFFF44;
    displayFColor = 0XAA0000;
    UIpanelBColor = 0X00DD00;
    UIpanelFColor = 0XCCCCCC;
    controlBColor = 0X8888DD;
    controlFColor = 0XCCCCCC;
    pieHandle.PIEsetDisplayColors(displayBColor, displayFColor);
    pieHandle.PIEsetUIpanelColors(UIpanelBColor, UIpanelFColor);

    /* Set the Experiment Details */
    pieHandle.showExperimentName("Pendulum : Measuring Time");
    pieHandle.showDeveloperName("Avinash Awate");

    /* define the position of all the global (static) variables */
    /* Code in a single Function (recommended) for reuse */
    this.resetExperiment();

    /* Create UI Objects */
    this.createUIObjects();

    /* Create Control Objects for Pause/Resume/Reset/speed control */
    pieHandle.PIEcreateResetButton();
    pieHandle.ResetControl.addClickListener(this.resetExperiment);
    pieHandle.PIEcreatePauseButton();
    pieHandle.PIEcreateSpeedButtons();

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
var pText:String;
var gText:String;
var lText:String;

    /* Initialise World Origin and Boundaries */
    this.resetWorld();

    /* Initialise Physics Parameters */
    gravity = 9.81;

    /* Initialise Drawing Objects */
    /* Layout Variables */
    hookX       = worldWidth/4;
    hookY       = 0.05;
    /* Bob Parameters */
    bobLength = 1.0;
    bobAngle = 10 * Math.PI / 180;
    bobMass = 1;
    bobRadius = 0.1;
    bobX = hookX + bobLength * Math.sin(bobAngle);
    bobY = hookY + bobLength * Math.cos(bobAngle);
    bobMaxAngle = bobAngle;
    bobPeriod = 2 * Math.PI * Math.sqrt(bobLength / gravity);

    /* Energy Computations */
    potentialEnergy = bobMass * gravity * (bobLength - (bobY - hookY));
    kineticEnergy   = 0.0;
    thermalEnergy   = 0.0;
    totalEnergy     = potentialEnergy + kineticEnergy + thermalEnergy;

    /**
     *
     * This section contains current state variables
     *
     */
    /* Bob Position Variables */
    bobVelocity = 0.0;
    bobAcceleration = 0.0;
    /* Time Variables */
    currentTime     = 0.0;
    bobPeriod       = 2 * Math.PI * Math.sqrt(bobLength / gravity);
    bobNextTop      = currentTime + (bobPeriod / 2);
    pieHandle.PIEresumeTimer();

    /*Show Text*/ 
    lText = String(bobLength);
    lText = lText.substring(0, (lText.lastIndexOf(".") + 3));
    if (this.lengthText != null) this.lengthText.setInputText(lText); 
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
    worldOriginX = (-worldWidth/2);
    worldOriginY = 0.0;
    pieHandle.PIEsetApplicationBoundaries(worldOriginX,worldOriginY,worldWidth,worldHeight);
}

/**
 *
 * This function is called by the PIE framework to reset the experiment to default values
 * It defines the values of all the global (static) variables
 *
 */
public function nextFrame():void
{
var dt:Number;
var distance:Number;
var bSin:Number;
var bCos:Number;
var velAngle:Number;
var accAngle:Number;

    /* get and set the time variable */
    dt = pieHandle.PIEgetDelay() / 1000;
    currentTime = currentTime + dt;
    if (currentTime > bobNextTop)
    {   /* Simulation has reached end condition. Use exact physics laws to continue */
        /* Without this, the pendulum keeps taking larger and larger swings due to end errors */
        bobAngle = -bobMaxAngle;
        bobMaxAngle = bobAngle;
        bCos = Math.cos(bobAngle);
        bSin = Math.sin(bobAngle);
        bobX = hookX + bobLength * bSin;
        bobY = hookY + bobLength * bCos;
        bobVelocity = 0;
        currentTime = bobNextTop;
        bobNextTop = currentTime + (bobPeriod / 2);
    }
    else
    {
        /* Compute new bob parameters */
        bCos = Math.cos(bobAngle);
        bSin = Math.sin(bobAngle);
        bobAcceleration = -(gravity * bSin);
        distance        = (bobVelocity * dt + 0.5 * bobAcceleration * dt * dt); /* s = ut + 0.5*a*t*t */
        bobX            = bobX + distance * bCos;
        bobY            = bobY - distance * bSin;
        bobVelocity     = bobVelocity + bobAcceleration * dt;
        bobAngle        = Math.atan((bobX - hookX) / (bobY - hookY));
    }
    /* Recompute energy variables */
    potentialEnergy = bobMass * gravity * (bobLength - (bobY - hookY));
    kineticEnergy   =  0.5 * bobMass * bobVelocity * bobVelocity;
    thermalEnergy   = totalEnergy - potentialEnergy - kineticEnergy;

    /* Redraw Bob and String */
    bob.changeLocation(bobX, bobY);
    tieString.changeLine(hookX,hookY,bobX, bobY);

    /* Change Stop Watch Time if visible */
    if (showStopWatch) stopWatchTool.changeTime(pieHandle.PIEgetTime());
}

/**
 *
 * This function adjusts the bob and string position whever the angle and length position has changed
 *
 */
public function adjustBob():void
{
    bobX = hookX + bobLength * Math.sin(bobAngle);
    bobY = hookY + bobLength * Math.cos(bobAngle);
    bob.changeLocation(bobX, bobY);
    tieString.changeLine(hookX,hookY,bobX, bobY);
}

/**
 *
 * This function is called to create the Ui objects
 * It calls the appropriate PIE Framework functions to create the objects
 * It also sets the variables to point to cfallback code
 *
 */
public function createUIObjects():void
{
    /* Call a PIE framework function to create Mass Slider */
    massSlider = new PIEhslider(pieHandle, "change mass", 1.0, 8.0, 2.0,0.0);
    pieHandle.addHSlider(massSlider);
    massSlider.addChangeListener(changeMass);

    /* Call a PIE framework function to create Mass Slider */
    lengthSlider = new PIEhslider(pieHandle,"length",0.5,2.0,1.0,0.0)
    pieHandle.addHSlider(lengthSlider);
    lengthSlider.addChangeListener(changeLength);

    /* Create check boxes for displaying velocity and acceleration */
    this.showStopWatch = true;

    /* Add Length Display Box */
    lengthText = new PIElabelledInput(pieHandle, "Length", String(bobLength), 0, 5, UIpanelBColor);
    lengthText.setDisplayOnly(true);
    pieHandle.addLabelledInput(lengthText);

    /* Add Observation Table */
    oTableX = 10;
    oTableY = 100;
    oTableRows = 3;
    oTableColumns = 4;
    captureData = new PIEobservationTable(pieHandle, oTableX, oTableY, oTableRows, oTableColumns, true, false);
    pieHandle.addDisplayChild(captureData);

    this.initialiseTable();
    // this.manageStudentData();
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
    /* Set Default Colors */
    ceilingColor   = 0XAA0066;
    tieStringColor = 0X00FF00;
    bobColor       = 0X4444AA;

    /* Create String */
    tieString = new PIEline(pieHandle,hookX,hookY,bobX,bobY, tieStringColor,2.0,0.8);
    pieHandle.addDisplayChild(tieString);

    /* Create Ceiling and Hook */
    ceiling = new PIErectangle(pieHandle,(-(worldWidth/4)), 0, worldWidth/2, hookY, ceilingColor);
    ceiling.changeFill(ceilingColor, 0.5);
    pieHandle.addDisplayChild(ceiling);
    hookCircle = new PIEtriangle(pieHandle, new Point(0, hookY), new Point(0.05, (hookY - 0.05)), new Point( -0.05, (hookY - 0.05)), 0xFFFFFF);
    hookCircle.changeFill(0xFFFFFF, 1.0);
    hookCircle.changeBorder(2, 0xFF4444, 1.0);
    pieHandle.addDisplayChild(hookCircle);

    /* Create Bob and make it draggable */
    bob = new PIEcircle(pieHandle, bobX, bobY, bobRadius, bobColor);
    bob.changeBorder(2, 0x0000FF, 1.0);
    pieHandle.addDisplayChild(bob);
    bob.addGrabListener(changeBobColor);
    bob.addDragListener(changeBobPosition);
    bob.addDropListener(fixBobPosition);

    /* Create the stop watch tool */
    stopWatchTool = new PIEstopWatch(pieHandle, 10, 10, 100, 60);
    pieHandle.addDisplayChild(stopWatchTool);
    ((this.showStopWatch == true) ? this.stopWatchTool.setPIEvisible() : this.stopWatchTool.setPIEinvisible());
}

/**
 * Function initialiseTable
 * This method fills table Header and initialises all cells to blank
 * It also enables the first row for writing (highlights and enables for writing)
 * It highlights column 1 (serial Number)
 * It clears all other cells.
 */
public function initialiseTable():void
{
var rIndex:Number;
var cIndex:Number;
var blankRow:Array = new Array(" ", " ", " ", " ");
// var headerRow:Array = new Array("No.", "Oscillations", "Total Time", "Period");
// var sequenceColumn:Array = new Array("No.", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10");

    /* Set Default Colour */
    captureData.setDefaultColor(0x00FFFF);
	captureData.highlightTable(0x00FFFF);
	
    /* Make table blank */
    for (rIndex = 0; rIndex < oTableRows; rIndex++)
        // captureData.setTextRow(rIndex, blankRow);
        for (cIndex = 0; cIndex < oTableColumns; cIndex++)
             captureData.setTextCell(rIndex, cIndex, " ");

    /* Set currentObservation */
    currentObservation = 0;
    currentEntryColumn = 0;
    captureData.highlightCell((currentObservation + 1), (currentEntryColumn + 1), 0xFFFF00);
    
    /* Turn all Rows and Columns Non Editable */
    captureData.setEditableTable(false);

    /* Fill Header Description in 1st Row */
    captureData.setTextCell(0, 0, "No.");
    captureData.setTextCell(0, 1, "Oscillations");
    captureData.setTextCell(0, 2, "Total Time");
    captureData.setTextCell(0, 3, "Period");
    captureData.highlightRow(0, 0xFF0000);
    captureData.highlightColumn(0, 0xFF0000);

    /* Fill Serial Number in 1st Column */
    for (rIndex = 1; rIndex < oTableRows; rIndex++) captureData.setTextCell(rIndex, 0, String(rIndex));
    
    /* Make first Row and First Cell Editable */
    captureData.setEditableCell((currentObservation + 1), (currentEntryColumn + 1), true);
    
    /* Attach Listeners */
    captureData.addChangeListener(checkEnteredText);
    captureData.addCompletionListener(acceptEnteredText);
}

/**
 *
 * This function is called when text in any cell is changed
 * It checks the text entered based on the column
 * It rejects the text if any wrong characters are entered
 * It is also possible to reject characters at textfield level by setting the restrict property of the cell
 * It does not have the full text
 * Full text is available only for the completion listener
 * @param eRow : Row number of changed element
 * @param eColumn : Column number of changed element
 * @param eText : Changed Text
 *
 */
private function checkEnteredText(eRow:uint, eColumn:uint, eText:String):void
{
var trim:RegExp = /^\s+|\s+$/g;

    eText = eText.replace(trim, "");
    if (eText.length > 0)
    {
	    switch (eColumn)
        {
          case 1 :
            /* Check if Oscillations Field is correct */
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
          case 2 :
            /* Check if Total Time Field is correct */
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
          case 3 :
            /* Check if Period Field is correct */
            if (isNaN(Number(eText))) captureData.setTextCell(eRow, eColumn, " ");
            break;
          default :
            break;
		}
    }
}

/**
 *
 * This function is called when text in any cell is completed (cell is exited)
 * It checks the text entered based on the column
 * It rejects the text if any wrong characters are entered
 * It is also possible to reject characters at textfield level by setting the restrict property of the cell
 * The data can be stored in variables or checked against acttual values
 * @param eRow : Row number of changed element
 * @param eColumn : Column number of changed element
 *
 */
private function acceptEnteredText(eRow:uint, eColumn:uint):void
{
var eText:String;
var lInt:uint;
var lNumber:uint;
var validText:Boolean;
var trim:RegExp = /^\s+|\s+$/g;

    eText = captureData.getText(eRow, eColumn);
    eText = eText.replace(trim, "");
    if (eText.length > 0)
    {
        switch (eColumn)
        {
          case 1 :
            /* Check if Oscillations Field is correct */
            lNumber = Number(eText);
            if (isNaN(lNumber)) { validText = false;  captureData.setTextCell(eRow, eColumn, " "); }
            else { validText = true;  userOscillations = uint(lNumber); }
            break;
          case 2 :
            /* Check if Total Time Field is correct */
            lNumber = Number(eText);
            if (isNaN(lNumber)) { validText = false;  captureData.setTextCell(eRow, eColumn, " "); }
            else { validText = true;  userTotalTime = lNumber; }
            break;
          case 3 :
            /* Check if Period Field is correct */
            lNumber = Number(eText);
            if (isNaN(lNumber)) { validText = false;  captureData.setTextCell(eRow, eColumn, " "); }
            else { validText = true;  userPeriod = lNumber; }
            break;
          default :
            break;
        }
        if (validText == true)
        {    /* Change to new cell */
            /* Set current cell non editable */
            captureData.setEditableCell((currentObservation + 1), (currentEntryColumn + 1), false);
            captureData.removeHighlightCell((currentObservation + 1), (currentEntryColumn + 1));
            if (eColumn == 3)
            {    /* Switch to new Row */
                currentObservation = currentObservation + 1;
                currentEntryColumn = 0;
                if (currentObservation >= (oTableRows - 1))
                {    /* Observation Table is over : append a new row */
                    captureData.appendRow();
                    oTableRows++;
                    for (lInt = 0; lInt < oTableColumns; lInt++) { captureData.setTextCell((currentObservation + 1), lInt, " "); }
                    captureData.highlightCell((currentObservation + 1), (currentEntryColumn), 0xFF0000);                
                    captureData.setTextCell((currentObservation + 1), (currentEntryColumn), String(currentObservation + 1));                
                    captureData.setEditableRow((currentObservation + 1), false);
                }
            }
            else
            {   /* Switch to next column */
                currentEntryColumn = currentEntryColumn + 1;
            }
            captureData.setEditableCell((currentObservation + 1), (currentEntryColumn + 1), true);
            captureData.highlightCell((currentObservation + 1), (currentEntryColumn + 1), 0xFFFF00);
		    captureData.setFocusCell((currentObservation + 1), (currentEntryColumn + 1));
        }
    }
}

/**
 *
 * This function handles the change in mass slider
 *
 */
public function changeMass(newMass:Number):void
{
    /* Compute the new radius of the bob */
    bobRadius = bobRadius * Math.pow(newMass/bobMass,0.33333333);
    bobMass = newMass;
    bob.changeSize(bobRadius);
    /* Recompute energy variables */
    potentialEnergy = bobMass * gravity * (bobLength - (bobY - hookY));
    kineticEnergy   =  0.5 * bobMass * bobVelocity * bobVelocity;
    thermalEnergy   = totalEnergy - potentialEnergy - kineticEnergy;
}

/**
 *
 * This function handles the change in length slider
 *
 */
public function changeLength(newLength:Number):void
{
var newPeriod:Number;
var lText:String;

    /* Compute the new position of the bob */
    bobX = hookX + (bobX - hookX) * (newLength / bobLength);
    bobY = hookY + (bobY - hookY) * (newLength / bobLength);

    /* Recompute energy variables */
    totalEnergy     = (totalEnergy - thermalEnergy) * (newLength / bobLength) + thermalEnergy;
    potentialEnergy = potentialEnergy * (newLength / bobLength);
    kineticEnergy   = totalEnergy - potentialEnergy - thermalEnergy;
    bobVelocity     = Math.sqrt(2 * kineticEnergy / bobMass);
    
    newPeriod  = 2 * Math.PI * Math.sqrt(newLength / gravity);
    bobNextTop = currentTime + (newPeriod / 2) * (bobNextTop - currentTime) / (bobPeriod / 2);

    bobLength  = newLength;
    bobPeriod  = newPeriod;

    /* set new position of the bob and tie String */
    bob.changeLocation(bobX,bobY);
    tieString.changeLine(hookX,hookY,bobX,bobY);
    lText = String(bobLength);
    lText = lText.substring(0, (lText.lastIndexOf(".") + 3));
    if (this.lengthText != null) this.lengthText.setInputText(lText);
}

/**
 *
 * This function handles the click on show stopWatch check box
 *
 */
public function handleStopWatch():void
{
    this.showStopWatch = !(this.showStopWatch);
    (this.showStopWatch == true) ? this.stopWatchTool.setPIEvisible() : this.stopWatchTool.setPIEinvisible();
}

/**
 *
 * This function restarts the simulation
 *
 */
public function restartSimulation():void
{
    /* Compute other variables */
    bobMaxAngle = bobAngle;
    bobPeriod = 2 * Math.PI * Math.sqrt(bobLength / gravity);

    /* Energy Computations */
    potentialEnergy = bobMass * gravity * (bobLength - (bobY - hookY));
    kineticEnergy   = 0.0;
    thermalEnergy   = 0.0;
    totalEnergy     = potentialEnergy + kineticEnergy + thermalEnergy;

    /**
     *
     * This section contains current state variables
     *
     */
    /* Bob Position Variables */
    bobVelocity = 0.0;
    bobAcceleration = 0.0;
    bobPeriod       = 2 * Math.PI * Math.sqrt(bobLength / gravity);
    bobNextTop      = currentTime + (bobPeriod / 2);

    /* Restart Simulation */
    if (!pieHandle.isPIEtimerRunning()) pieHandle.PIEtoggleTimer();
    pieHandle.PIEresumeTimer();
}

/**
 *
 * This function stops the simulation
 *
 */
public function stopSimulation():void
{
    /* Stop Simulation */
    if (pieHandle.isPIEtimerRunning()) pieHandle.PIEtoggleTimer();
    pieHandle.PIEresetTimer();
    pieHandle.PIEpauseTimer();
    pieHandle.PIEsetTime(0);
    currentTime = 0;
}

/**
 *
 * This function handles the grab events
 * clickX : X Position where mouse was clicked
 * clickY : Y Position where mouse was clicked
 *
 */
public function changeBobColor(clickX:Number, clickY:Number):void
{
    /* Stop Simulation */
    this.stopSimulation();

    /* Change bob color */
    bob.changeFill(bobColor, 0.5);
}

/**
 *
 * function changeBobPosition(newX:Number, newY:Number, displacementX:Number, displacementY:Number)
 * displacementX : X position of Mouse
 * displacementY : Y position of Mouse
 * displacementX : difference in X between two mouse listener calls
 * displacementY : difference in Y between two mouse listener calls
 * 
 * Handles the drag event
 */
public function changeBobPosition(newX:Number, newY:Number, displacementX:Number, displacementY:Number):void
{
    /* Compute the new angle of the bob */
    newX = newX - hookX;
    newY = newY - hookY;
    if ((newY != 0) && (Math.abs(newX / newY) <= tanLimit))
    {
        /* Compute the new position of the bob */
        bobAngle = Math.atan(newX / newY);
        bobX = hookX + Math.sin(bobAngle) * bobLength;
        bobY = hookY + Math.cos(bobAngle) * bobLength;

        /* set new position of the bob and tie String */
        bob.changeLocation(bobX,bobY);
        tieString.changeLine(hookX,hookY,bobX,bobY);
    }
}

/**
 *
 * function fixBobPosition(newX:Number, newY:Number, displacementX:Number, displacementY:Number)
 * displacementX : X position of Mouse
 * displacementY : Y position of Mouse
 * displacementX : difference in X between two mouse listener calls
 * displacementY : difference in Y between two mouse listener calls
 * 
 * Handles the drop event
 */
public function fixBobPosition(newX:Number, newY:Number, displacementX:Number, displacementY:Number):void
{    
    /* Change Position */
    this.changeBobPosition(newX, newY, displacementX, displacementY);

    /* Change bob color */
    bob.changeFill(bobColor, 1.0);

    /* Restart Simulation */
    this.restartSimulation();
}

}   /* End of Class Experiment */

}
