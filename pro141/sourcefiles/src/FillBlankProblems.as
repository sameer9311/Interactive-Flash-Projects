package  
{
/**
 * ...
 * @author Sameer Sonawane
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
    experimentName = new String("Garbage in, Garbage out");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBankSize = 25;
    questionBank = new Vector.<String>(questionBankSize);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    questionBank[0] = "$$$Collected garbage is taken to a low lying open area called ____________ .$$$##C0landfill##0dumping yard##0garbage dump##";
    questionBank[1] = "$$$The garbage bins used to collect recyclable materials are coloured _____ .$$$##0red##0green##C0blue##";
    questionBank[2] = "$$$The garbage bins used to collect kitchen wastes are coloured _____ .$$$##0red##C0green##0blue##";
    questionBank[3] = "$$The method of preparing compost with the help of redworm is called ____________ .$$$##0am eating##C0is eating##0are eating##";
    questionBank[4] = "$$$Husk, dried leaves, parts of plants can be used as __________ .$$$##0manure##C0compost##0fertilizers##";
    questionBank[5] = "$$$Wastes of leaves, husk and parts of plants are usually _________ .$$$##0buried##0landfilled##C0burnt##";
    questionBank[6] = "$$$Red worms are used in  ______________ .$$$##0landfilling##0composting##C0vermicomposting##";
    questionBank[7] = "$$$Burning of dead leaves and plant wastes causes ________________ .$$$##C0air pollution##0water pollution##0soil pollution##";
    questionBank[8] = "$$$Vermicomposting can be used on a large scale in ___________ .$$$##C0farms##0villages##0cities##";
    questionBank[9] = "$$$Landfill area is later converted to ______________ .$$$##0construction site##0forests##C0park##";
    questionBank[10] = "$$$The garbage in the landfill area is covered with _________ .$$$##0wood##C0soil##0water##";
    questionBank[11] = "$$$Compost making areas are ________________ landfills.$$$##0far from##C0near from##0at same place of##";
    questionBank[12] = "$$$The garbage which rots forms _______ for plants .$$$##0fertilizers##C0manures##0pesticides##";
    questionBank[13] = "$$$The rotting and conversion of some materials into manure is called ____________ .$$$##0vermicomposting##0landfilling##C0composting##";
    questionBank[14] = "$$$Redworms are used for ________________ .$$$##0composting##0landfilling##C0vermicomposting##";
    questionBank[15] = "$$$ ________ quantity of water should be used for vermicomposting .$$$##0Excess##0zero##C0less##";
    questionBank[16] = "$$$Redworms have structure called 'gizzard' instead of ________ .$$$##C0teeth##0legs##0eyes##";
    questionBank[17] = "$$$Redworms donot survive in _________ surroundings.$$$##0humid##0dry##C0hot##";
    questionBank[18] = "$$$Redworms need ________  around them for survival.$$$##0soil##C0moisture##0air##";
    questionBank[19] = "$$$The government has laid strict rules for recycling ________ .$$$##0paper##C0plastic##0glass##";
    questionBank[20] = "$$$________ thrown on roads causes choking of drains..$$$##0paper##C0plastic##0glass##";
    questionBank[21] = "$$$During rainy season, _______ causes water spilling on roads.$$$##0paper##0glass##C0plastic##";
    questionBank[22] = "$$$Stray animals die due to swallowing of ________ .$$$##0paper##0vegetable wastes##C0plastic##";
    questionBank[23] = "$$$_______  bags should not be used to store food items.$$$##0paper##0cloth##C0plasic##";
    questionBank[24] = "$$$____________ can be used to deal with kitchen waste usefully.$$$##C0vermicomposting##0composting##0landfilling##";
   
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
