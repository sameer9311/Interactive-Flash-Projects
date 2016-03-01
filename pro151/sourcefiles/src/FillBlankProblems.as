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
    experimentName = new String("Weather, Climate and Adaptations of Animals to Climate");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBankSize = 25;
    questionBank = new Vector.<String>(questionBankSize);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    questionBank[0] = "$$$Humidity is measure of moisture in  _____ .$$$##C0air##0soil##0sand##";
    questionBank[1] = "$$$Rainfall is measured by an instrument called ___________ .$$$##0barometer##0tachometer##C0raingauge##";
    questionBank[2] = "$$$The weather of a place changes ___________ .$$$##0yearly##C0daily##0monthly##";
    questionBank[3] = "$$$All changes in the weather are caused by  _____ .$$$##0moon##C0sun##0earth##";
    questionBank[4] = "$$$Temperature is measured using _____________ .$$$##0barometer##C0thermometer##0raingauge##";
    questionBank[5] = "$$Climate of a place changes ____________________ .$$$##0daily##0monthly##C0after several years##";
    questionBank[6] = "$$$In polar regions, sun doesnot set for _____________ .$$$##01 month##0 12 months##C0 6 months##";
    questionBank[7] = "$$$In polar regions, sun doesnot rise for ____________ .$$$##01 month##0 12 months##C0 6 months##";
    questionBank[8] = "$$$On warm days, a polar bear goes for _________ .$$$##C0swimming##0walk##0hibernation##";
    questionBank[9] = "$$$Penguins are found in _______ regions.$$$##0tropical##0equatorial##C0polar##";
    questionBank[10] = "$$$Red eyed frog has developed ______________ to climb trees.$$$##0legs##C0sticky pads##0claws##";
    questionBank[11] = "$$$Monkeys have developed ___________ to live on trees.$$$##0legs##C0tail##0sticky pads##";
    questionBank[12] = "$$$Toucan bird has a special adaption to get _________ .$$$##0water##C0food##0shelter##";
    questionBank[13] = "$$$__________ animals have sensitive hearing, sharp eyesight and thick skin.$$$##0polar##0equatorial##C0tropical##";
    questionBank[14] = "$$$Silver white mane is a special feature of ___________________ .$$$##0Toucan##0red eyed frog##C0lion-tailed macaque##";
    questionBank[15] = "$$$Lion-tailed macaque is found mostly in __________ regions.$$$##0polar##0equatorial##C0tropical##";
    questionBank[16] = "$$$_____ help the elephant to keep cool in hot humid climate of rainforests.$$$##C0ears##0trunk##0tusks##";
    questionBank[17] = "$$$Maximum temperature of a day generally occurs in ____________ .$$$##0morning##0night##C0afternoon##";
    questionBank[18] = "$$$Minimumm temperature generally occurs in ___________ .$$$##0afternoon##C0morning##0evening##";
    questionBank[19] = "$$$Animals in _________ region possess the property of camouflage.$$$##0polar##C0tropical##0equatorial##";
    questionBank[20] = "$$$animals in _________ region need to migrate.$$$##0tropical##C0polar##0equatorial##";
    questionBank[21] = "$$$_______ regions of earth possess extreme climatic conditions.$$$##0tropical##0equatorial##C0polar##";
    questionBank[22] = "$$$Animals in _______ regions have thick skin.$$$##0tropical##0equatorial##C0polar##";
    questionBank[23] = "$$$Toucan bird is found in _______ region.$$$##0polar##0equatorial##C0tropical##";
    questionBank[24] = "$$$Red eyed frog is found in _______ region.$$$##C0tropical##0polar##0equatorial##";
   
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
