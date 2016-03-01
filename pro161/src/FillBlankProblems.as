package  
{
/**
 * ...
 * @author sameer sonawane
 */

public class FillBlankProblems 
{
/* TestProject Framework Handle */
private var experimentName:String;                /* Title which appears on top border */
private var developerName:String;                 /* Developer name which appears on top border */

/* Experiment Question Bank and Choice */
private var questionBankSize:uint;                /* Number of sentences in problem space (question bank) */
private var questionBank:Vector.<String>;         /* Question Bank */

public function FillBlankProblems() 
{
    /* Initialise Question Bank */
    this.initialiseQuestionBank();
}

/**
 *
 * This function fills the array of fill in the blank problem statements
 * This function also creates all the required vectors
 * Each problem statment is delimited by $$$ substring
 * Each problem statment has upto six blank areas specified by a series of three or more underscores preferably separated by blank
 * Each underscore substring gets a solution index beginning with 0 and increasing upto 5
 * The length of the uderscore string should preferably be sufficient to hold the longest option.
 * The fill in the blank options follow the end $$$ delimiter
 * Each option is separated by a two ## substring
 * The beginning ## substring is followed by solution index to which this option belongs
 * The correct option has the letter C preceding the solution index
 * There can be only one correct option for each fill in the blank area
 * Each problem statement is picked up and divided into blanks and options and presented for drag and drop
 * Example problem statement : "$$$I ____ eating ________.$$$##C0am##0is##0are##C1fruit##1water##1wood##1shirt##"
 * Fill in the blank string "I ____ eating ________."
 * Option for solution index 0 "am" is correct
 * Option for solution index 0 "is" is incorrect
 * Option for solution index 0 "are" is incorrect
 * Option for solution index 1 "fruit" is correct
 * Option for solution index 1 "water" is incorrect
 * Option for solution index 1 "wood" is incorrect
 * Option for solution index 1 "shirt" is incorrect
 * 
 * Important : The problem statements are picked up at random. Therefore statements can be repeated to ensure greater frequency.
 *
 */
public function initialiseQuestionBank():void
{
    /* Set Title and Developer */
    experimentName = new String("Winds , Storms and Cyclones");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBankSize = 25;
    questionBank = new Vector.<String>(questionBankSize);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    questionBank[0] = "$$$When cold water is put on hot can, the pressure of air inside ________ .$$$##C0decreases##0increases##0remains same##";
    questionBank[1] = "$$$Increased wind speed is accompanied by _________ air pressure.$$$##0increased##0no change in##C0reduced##";
    questionBank[2] = "$$$Air moves from _____ pressure region to ______ pressure region .$$$##0low##C0high##C1low##1high##";
    questionBank[3] = "$$$The greater the difference in air pressure, the _______ the air moves.$$$##0slower##C0faster##0no change in speed##";
    questionBank[4] = "$$$Air ________ on heating.$$$##0contracts##C0expands##0has no change in volume##";
    questionBank[5] = "$$$Air _______ on cooling.$$$##0expands##0has no change in volume##C0contracts##";
    questionBank[6] = "$$$Warm air is _________ than cold air.$$$##0heavier##C0lighter##0of same mass##";
    questionBank[7] = "$$$Due to heating of equatorial regions,winds are set in ___________ direction.$$$##0south-north##0west-east##C0north-south##";
    questionBank[8] = "$$$Winds set up in equatorial regions donot move straight due to _________________ .$$$##C0rotation of earth##0revolution of earth##0revolution of moon##";
    questionBank[9] = "$$$Uneven heating of land in Rajasthan causes winds ___________ direction.$$$##0southeast##0west##C0southwest##";
    questionBank[10] = "$$$The centre of a cyclone is called _______ .$$$##0head##C0eye##0neck##";
    questionBank[11] = "$$$The _________ pressure in the cyclone eye lifts the water surface.$$$##0high##C0low##0extreme high##";
    questionBank[12] = "$$$Most of the __________ are weak.$$$##0cyclones##C0tornadoes##0hurricanes##";
    questionBank[13] = "$$$All storms are ______ pressure systems.$$$##0high##0extreme high##C0low##";
    questionBank[14] = "$$$The instrument which measures wind speed is called ___________ .$$$##0barometer##0thermometer##C0anemometer##";
    questionBank[15] = "$$$Cyclone alert is issued ___ hours in advance of any storm.$$$##012##024##C048##";
    questionBank[16] = "$$$Cyclone warning is issued ___ hrs in advance.$$$##C012##024##048##";
    questionBank[17] = "$$$Warm air ________ .$$$##0sinks down##C0rises up##0moves horizontally##";
    questionBank[18] = "$$$Cool air ________ .$$$##0rises up##C0sinks down##0moves horizontally##";
    questionBank[19] = "$$$Moving air is called _____ .$$$##0storm##C0wind##0cyclone##";
    questionBank[20] = "$$$Uneven heating on the _______ is the main cause of wind movements on earth.$$$##0land##0sea##0earth##";
    questionBank[21] = "$$$High speed winds and air pressure difference can cause ________ .$$$##0storms##0tornadoes##C0cyclones##";
    questionBank[22] = "$$$Difference in ____________ in two regions sets up air convection.$$$##0air pressure##0altitude##C0temperature##";
    questionBank[23] = "$$$Warm air rises up and creates a _____  pressure region.$$$##0high##C0low##0no change in pressure##";
    questionBank[24] = "$$$Cool air rises up and creates a  _______  pressure region .$$$##C0high##0low##0no change in pressure##";
    
}

/**
 *
 * This function returns question given index
 *
 */
public function getQuestion(qIndex:uint):String
{
    if (qIndex < questionBankSize) { return(questionBank[qIndex]); }
    else  { return(new String("")); }
}

/**
 *
 * This function returns question bank size
 *
 */
public function getQuestionBankSize():uint
{
    return(questionBankSize);
}

/**
 *
 * This function returns experiment name
 *
 */
public function getExperimentName():String
{
    return(experimentName);
}

/**
 *
 * This function returns developer name
 *
 */
public function getDeveloperName():String
{
    return(developerName);
}

}

}
