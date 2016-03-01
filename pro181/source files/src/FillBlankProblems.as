package  
{
/**
 * ...
 * @author Avinash Awate, Archis Awate
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
    experimentName = new String("Improvement in Food Resources");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBankSize = 25;
    questionBank = new Vector.<String>(questionBankSize);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    questionBank[0] = "$$$Green revolution led to increased ______________ production.$$$##C0foodgrain##0milk##0animal husbandry##";
    questionBank[1] = "$$$Wheat, millets, rice and other cereals provide _______________ .$$$##0proteins##0vitamins##C0carbohydrates##";
    questionBank[2] = "$$$Pulses like gram and pea provide ____________ .$$$##0viatamins##C0proteins##0carbohydrates##";
    questionBank[3] = "$$$Oil seeds like soyabean and groundnuts provide ___________ .$$$##0proteins##C0fats##0carbohydrates##";
    questionBank[4] = "$$$Vegetables provide us __________ .$$$##0proteins##C0vitamins##0carbohydrates##";
    questionBank[5] = "$$$Kharif crops grow in ________ season.$$$##0summer##0winter##C0rainy##";
    questionBank[6] = "$$$Rabi crops grow in ________ season.$$$##0summer##0rainy##C0winter##";
    questionBank[7] = "$$$Cotton grows in __________ season.$$$##0winter##0summer##C0rainy##";
    questionBank[8] = "$$$Wheat grows in __________ season.$$$##C0winter##0summer##0rainy##";
    questionBank[9] = "$$$Hybridisation is crossing between genetically __________ plants.$$$##0similar##C0dissimilar##0same##";
    questionBank[10] = "$$$___________ and profuse branching are desirable characters for fodder crops.$$$##0shortness##C0tallness##0wideness##";
    questionBank[11] = "$$$Hydrogen required for plant growth is taken through _______ .$$$##0air##C0water##0soil##";
    questionBank[12] = "$$$Macronutrients required for plant growth is provided by _______ .$$$##0air##C0soil##0water##";
    questionBank[13] = "$$$_____ macronutrients are required by plants.$$$##05##C06##07##";
    questionBank[14] = "$$$_____ micronutrients are required by plants.$$$##05##06##C07##";
    questionBank[15] = "$$$Manures increase soil _________ .$$$##0porosity##0salinity##C0fertility##";
    questionBank[16] = "$$$Nitrogen, phosphorous and potassium are provided by _________ .$$$##C0fertilizers##0manures##0pesticides##";
    questionBank[17] = "$$$Excess use of fertilzers lead to _______ pollution.$$$##0soil##0air##C0water##";
    questionBank[18] = "$$$Mixed cropping is growing two or more crops simultaneously on the ________ piece of land.$$$##0different##C0same##0consecutive##";
    questionBank[19] = "$$$In __________ cropping two or more crops are grown in definite pattern.$$$##0mixed##C0inter##0simultaneous##";
    questionBank[20] = "$$$Growing different crops on a piece of land in a pre-planned succession is _____________ .$$$##0mixed cropping##C0crop rotation##0inter cropping##";
    questionBank[21] = "$$$__________ shows larger lactation period.$$$##0Red sindhi##0sahiwal##C0Jersey##";
    questionBank[22] = "$$$Broiler chickens are fed with ________ rich supplementary feed for good growth rate.$$$##0vitamin##0carbohydrate##C0protein##";
    questionBank[23] = "$$$Mariculture is rearing  cultures of ____________.$$$##0bees##0silkworm##C0fishes##";
    questionBank[24] = "$$$The _________ bees have high honey collection capacity.$$$##C0italian##0indian##0french##";
    
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
