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
    experimentName = new String("Motion and Measurement of Distance");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBankSize = 25;
    questionBank = new Vector.<String>(questionBankSize);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    questionBank[0] = "$$$Measurement is comparison of _________ quantity with _______ quantity.$$$##C0unknown##0known##0fixed##1unknown##C1fixed##1large";
    questionBank[1] = "$$$Fixed quantity used in measurement is called _______ .$$$##0vector##0scalar##C0unit##";
    questionBank[2] = "$$$The distance between elbow and finger tips is called _______ .$$$##C0cubit##0handspan##0foot##";
    questionBank[3] = "$$$In ancient India small length was measured in _________ .$$$##0yard##C0angul##0foot##";
    questionBank[4] = "$$$French created a standard unit of measurement called the ____________________ .$$$##0unit system##C0metric system##0standard system##";
    questionBank[5] = "$$$The SI unit of length is ______________ .$$$##0centimeter##0kilometer##C0meter##";
    questionBank[6] = "$$$Each meter is divided into ______  centimeters.$$$##0 10##0 1000##C0 100##";
    questionBank[7] = "$$$Each centimeter is divided into _____ millimeters .$$$##0 100##0 1000##C0 10##";
    questionBank[8] = "$$$Each kilometer is divided into _______ meters .$$$##C0 1000##0 100##0 10##";
    questionBank[9] = "$$$An object placed between 1 cm and 14 cm has length  _______ .$$$##015 cm##014 cm##C0 13 cm##";
    questionBank[10] = "$$$Length of curved surface can be measured with _______ .$$$##0 scale##C0 thread##0 standard scale##";
    questionBank[11] = "$$$In ________________ motion, objects move in straight line.$$$##0 circular##C0 rectilinear##0 periodic##";
    questionBank[12] = "$$$The motion of blades of fan is example of __________  motion.$$$##0rectilinear##C0circular##0periodic##";
    questionBank[13] = "$$$In _________ motion, object repeats its motion after some time.$$$##0circular##0rectilinear##C0periodic##";
    questionBank[14] = "$$$The motion of pendulum is an example of _________  motion.$$$##0circular##0rectilinear##C0periodic##";
    questionBank[15] = "$$$The motion of needle in sewing machine is _________ motion.$$$##0circular##0rectilinear##C0periodic##";
    questionBank[16] = "$$$The motion of ball on ground is __________________ .$$$##C0rectlinear and rotational##0rectilinear and periodic##0rotational and periodic##";
    questionBank[17] = "$$$Motion in a straight line is called ___________ motion.$$$##0periodic##0rotational##C0rectilinear##";
    questionBank[18] = "$$$Seven kilometers is _____ meters.$$$##0 700##C0 7000##0 70##";
    questionBank[19] = "$$$Motion of wheel of bicycle is ________ .$$$##0rectilinear##C0rotational##0periodic##";
    questionBank[20] = "$$$Motion of child on swing is _________ .$$$##0rectilinear##C0periodic##0rotational##";
    questionBank[21] = "$$$One meter is equal to _____ millimeters.$$$##0100##010##C01000##";
    questionBank[22] = "$$$Height of person is 1.65 m  i.e _____ cm .$$$##01650##016.5##C0165##";
    questionBank[23] = "$$$Distance between school and home is 1.3 km  i.e ______ meters.$$$##013##0130##C01300##";
    questionBank[24] = "$$$The motion of minute hand in a clock is _________________________ .$$$##0periodic##0circular##C0periodic and rotational##";
    
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
