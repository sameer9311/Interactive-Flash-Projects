package  
{
import PIE;

/**
 * ...
 * @author Sameer Sonawane
 */

public class MatchColumnProblems 
{
/* Interface with Experiment Object */
private var experimentName:String;                /* Title */
private var developerName:String;                 /* Developer Name */
private var maxDisplay:uint;                      /* Maximum number of elements to be selected for display */

/* Experiment Question Bank and Choice */
private var numberOfProperties:uint;              /* Number of properties/sentences in problem space (question bank) */
private var numberOfTerms:uint;                   /* Number of terms/sentences in problem space (question bank) */
public  var problemProperties:Vector.<String>;    /* Set of Properties (can be one to many to terms) */
public  var problemTerms:Vector.<String>;         /* Set of Terms (can be many to one to properties) */
public  var termProperty:Vector.<uint>;           /* Index of matching property for the term */

public function MatchColumnProblems(nDisplay:uint) 
{
    /* Initialise Interface */
    experimentName = new String("Human eye and the Colourful World");
    developerName  = new String("Sameer Sonawane");
    maxDisplay     = nDisplay;

    /* Initialise Question Bank */
    this.initialiseQuestionBank();
}

public function getMaxDisplay():uint
{
    return(maxDisplay);
}

public function getMaxProperties():uint
{
    return(numberOfProperties);
}

public function getMaxTerms():uint
{
    return(numberOfTerms);
}

public function getExperimentName():String
{
    return(experimentName);
}

public function getDeveloperName():String
{
    return(developerName);
}

/**
 *
 * This function fills the three arrays (properties, terms and matches) of fill in the blank problem statements
 * This function also creates all the required vectors
 * Each problem consists of two columns (the term column and the property column)
 * It is presumed that number of terms can potentially exceed properties (manyOne mode)
 * It is also possible that there is a one to one correspondence between term and property (oneOne mode)
 * If the number of properties exceed 10, properties are picked up at random (randomPick state: generally in oneOne mode)
 * If the number of properties is less than 11, all properties are picked up (allPick state)
 * Once the properties for display are selected, the terms are selected
 * The alogorithm for seletion of terms depends on the mode and the state
 *
 */
public function initialiseQuestionBank():void
{
    /* Now create the problem Properties array */
    numberOfProperties = 42;
    problemProperties = new Vector.<String>(numberOfProperties);

    /* Create properties Strings : past perfect, past, past continuous, present perfect, present, present continuous, future perfect, future, future continuous */
    problemProperties[0] = "retina";
    problemProperties[1] = "cornea";
    problemProperties[2] = "spherical";
    problemProperties[3] = "2.3 cm";
    problemProperties[4] = "outer surface of cornea";
    problemProperties[5] = "iris";
    problemProperties[6] = "pupil";
    problemProperties[7] = "real and inverted";
    problemProperties[8] = "light sensitive cells";
	problemProperties[9] = "optic nerves";
	problemProperties[10] = "ciliary muscles";
	problemProperties[11] = "focal length";
	problemProperties[12] = "accommodation";
	problemProperties[13] = "25 cm";
	problemProperties[14] = "infinity";
	problemProperties[15] = "cataract";
	problemProperties[16] = "150 degrees";
	problemProperties[17] = "180 degrees";
	problemProperties[18] = "near sightedness";
	problemProperties[19] = "distant objects";
	problemProperties[20] = "nearer than infinity";
	problemProperties[21] = "in front of retina";
	problemProperties[22] = "excessive curvature of eyeball";
	problemProperties[23] = "myopia";
	problemProperties[24] = "concave lens";
	problemProperties[25] = "far sightedness";
	problemProperties[26] = "nerby objects";
	problemProperties[27] = "farther away from 25cm";
	problemProperties[28] = "behind the retina";
	problemProperties[29] = "long focal length of the eye lens";
	problemProperties[30] = "hypermetropia";
	problemProperties[31] = "convex lens";
	problemProperties[32] = "presbyopia";
	problemProperties[33] = "angle of prism";
	problemProperties[34] = "angle of deviation";
	problemProperties[35] = "dispersion";
	problemProperties[36] = "white light";
	problemProperties[37] = "atmospheric refraction";
	problemProperties[38] = "2 minutes";
	problemProperties[39] = "Tyndall effect";
	problemProperties[40] = "shorter wavelengths";
	problemProperties[41] = "scattering of light";	
	

    /* Now create the problem terms and term properties array */
    numberOfTerms = 43;
    problemTerms  = new Vector.<String>(numberOfTerms);
    termProperty  = new Vector.<uint>(numberOfTerms);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    problemTerms[0]  = "Light sensitive screen of the eye";              termProperty[0]  = 0;
    problemTerms[1]  = "Light enters the eye through";                            termProperty[1]  = 1;
    problemTerms[2]  = "Shape of the eyeball";                   termProperty[2]  = 2;
    problemTerms[3]  = "Diameter of the eyeball";              termProperty[3]  = 3;
    problemTerms[4]  = "Refraction of light rays entering the eye occurs at";                          termProperty[4]  = 4;
    problemTerms[5]  = "Structure just behind the cornea";                       termProperty[5]  = 5;
    problemTerms[6]  = "Iris controls the size of";      termProperty[6]  = 6;
    problemTerms[7]  = "Nature of the object formed on the retina";                       termProperty[7]  = 7;
    problemTerms[8]  = "The retina has enormous number of";                  termProperty[8]  = 8;
    problemTerms[9]  = "Electric signals by light sensitive cells are sent to brain via";       termProperty[9]  = 9;
    problemTerms[10] = "Curvature of the eye lens can be modified by";                   termProperty[10] = 10;
    problemTerms[11] = "The change in curvature of eye lens changes the";              termProperty[11] = 11;
    problemTerms[12] = "Ability of the eye lens to adjust its focal length";      termProperty[12] = 12;
    problemTerms[13] = "Near point of the human eye";                   termProperty[13] = 13;
    problemTerms[14] = "Far point of the human eye";                   termProperty[14] = 14;
    problemTerms[15] = "The crystalline lens becomes milky and cloudy.";  termProperty[15] = 15;
    problemTerms[16] = "Horizontal field of view of human eye with one eye";             termProperty[16] = 16;
    problemTerms[17] = "Horizontal field of view of human eye with two eyes";        termProperty[17] = 17;
    problemTerms[18] = "Myopia is also known as";            termProperty[18] = 18;
    problemTerms[19] = "Person with myopia cannot see";                termProperty[19] = 19;
    problemTerms[20] = "Person with myopia has far point";         termProperty[20] = 20;
    problemTerms[21] = "In mypopic eye, the image of distant objects is formed";          termProperty[21] = 21;
    problemTerms[22] = "Myopia arises due to";              termProperty[22] = 22;
    problemTerms[23] = "Elogation of the eyeball causes";       termProperty[23] = 23;
    problemTerms[24] = "Myopia can be corrected by using";   termProperty[24] = 24;
    problemTerms[25] = "Hypermetropia is also known as";        termProperty[25] = 25;
    problemTerms[26] = "Person with hypermetropia cannot see";			termProperty[26] = 26;
    problemTerms[27] = "Person with hypermetropia has near point";      termProperty[27] = 27;
    problemTerms[28] = "In hypermetropia eye, the image of nearby objects is formed";                termProperty[28] = 28;
    problemTerms[29] = "Hypermetropia arises due to";           termProperty[29] = 29;
    problemTerms[30] = "Decrement of size of the eyeball causes";     termProperty[30] = 30;
    problemTerms[31] = "Hypermetropia can be corrected by using";                 termProperty[31] = 31;
    problemTerms[32] = "Defect in which old people cannot see nearby objects";          termProperty[32] = 32;
    problemTerms[33] = "The angle between two lateral faces of the prism";    termProperty[33] = 33;
    problemTerms[34] = "Angle between incident and emergent ray in prism";                     termProperty[34] = 34;
    problemTerms[35] = "The splitting of light into its component colours";       termProperty[35] = 35;
    problemTerms[36] = "Light that gives a spectrum similar to that of sunlight";              termProperty[36] = 36;
    problemTerms[37] = "Twinkling of stars is due to phenomenon of";               termProperty[37] = 37;
    problemTerms[38] = "Time difference between actual sunset and the apparent sunset";                    termProperty[38] = 38;
    problemTerms[39] = "The phenomenon of scattering of light by the colloidal particles";              termProperty[39] = 39;
    problemTerms[40] = "The molecules of air and other fine particles in the atmosphere scatter";             termProperty[40] = 40;
    problemTerms[41] = "The blue colour of sky is caused due to";                    termProperty[41] = 41;
    problemTerms[42] = "The redddening of sky at sunrise at sunset is caused due to";  termProperty[42] = 41;
	
}

}   /* End of Class MatchColumnProblems */

}   /* End of Package */
