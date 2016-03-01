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
    experimentName = new String("Chemical Reactions and Equations");
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
    numberOfProperties = 39;
    problemProperties = new Vector.<String>(numberOfProperties);

    /* Create properties Strings : past perfect, past, past continuous, present perfect, present, present continuous, future perfect, future, future continuous */
    problemProperties[0] = "white";
    problemProperties[1] = "magnesium oxide";
    problemProperties[2] = "magnessium and oxygen";
    problemProperties[3] = "balanced reactions";
    problemProperties[4] = "aqueous (aq)";
    problemProperties[5] = "exothermic reaction";
    problemProperties[6] = "slaked lime";
    problemProperties[7] = "combination reaction";
    problemProperties[8] = "calcium carbonate";
	problemProperties[9] = "burning of coal";
	problemProperties[10] = "respiration";
	problemProperties[11] = "glucose";
	problemProperties[12] = "decompositon reaction";
	problemProperties[13] = "ferric oxide";
	problemProperties[14] = "lime or quick lime";
	problemProperties[15] = "cement";
	problemProperties[16] = "thermal decomposition";
	problemProperties[17] = "heating of lead nitrate";
	problemProperties[18] = "nitrogen dioxide";
	problemProperties[19] = "grey";
	problemProperties[20] = "silver and chlorine";
	problemProperties[21] = "black and white photography";
	problemProperties[22] = "endothermic reactions";
	problemProperties[23] = "brownish";
	problemProperties[24] = "precipitation reaction";
	problemProperties[25] = "white";
	problemProperties[26] = "barium sulphate";
	problemProperties[27] = "double displacement reactions";
	problemProperties[28] = "hydrogen";
	problemProperties[29] = "copper oxide";
	problemProperties[30] = "oxidation reaction";
	problemProperties[31] = "reduction reaction";
	problemProperties[32] = "corrosion";
	problemProperties[33] = "antioxidants";
	problemProperties[34] = "nitrogen";
	problemProperties[35] = "displacement reactions";
	problemProperties[36] = "insoluble salts";	
	problemProperties[37] = "sulphur dioxide and sulphur trioxide";
	problemProperties[38] = "nitrogen dioxide and oxygen";
	

    /* Now create the problem terms and term properties array */
    numberOfTerms = 44;
    problemTerms  = new Vector.<String>(numberOfTerms);
    termProperty  = new Vector.<uint>(numberOfTerms);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    problemTerms[0]  = "Flame colour when magnessium ribbon burns";              termProperty[0]  = 0;
    problemTerms[1]  = "White powder formed after burning magnessium ribbon";                            termProperty[1]  = 1;
    problemTerms[2]  = "Reactants of magnessium ribbon burning in air";                   termProperty[2]  = 2;
    problemTerms[3]  = "Number of atoms of each element same on both sides of reaction";              termProperty[3]  = 3;
    problemTerms[4]  = "Reactant or product is present as a solution in water";                          termProperty[4]  = 4;
    problemTerms[5]  = "Reaction of calcium oxide with water";                       termProperty[5]  = 5;
    problemTerms[6]  = "Product of reaction of quick lime with water";      termProperty[6]  = 6;
    problemTerms[7]  = "Reaction in which a single product is formed from two or more reactants";                       termProperty[7]  = 7;
    problemTerms[8]  = "Product formed after white washing of walls by slaked lime";                  termProperty[8]  = 8;
    problemTerms[9]  = "Example of combination reaction";       termProperty[9]  = 9;
    problemTerms[10] = "Example of exothermic reaction";                   termProperty[10] = 10;
    problemTerms[11] = "Major reactant of respiration reaction";              termProperty[11] = 11;
    problemTerms[12] = "Single reactant breaks down to give simpler products";      termProperty[12] = 12;
    problemTerms[13] = "Major product formed after burning ferrous sulphate crystals";                   termProperty[13] = 13;
    problemTerms[14] = "Calcium oxide is also known as";                   termProperty[14] = 14;
    problemTerms[15] = "Calcium oxide is used in the production of";  termProperty[15] = 15;
    problemTerms[16] = "Decomposition reaction carried out by heating";             termProperty[16] = 16;
    problemTerms[17] = "Example of thermal decomposition reaction";        termProperty[17] = 17;
    problemTerms[18] = "Brown fumes formed due to heating of lead nitrate";            termProperty[18] = 18;
    problemTerms[19] = "Colour of siver chloride in sunlight";                termProperty[19] = 19;
    problemTerms[20] = "Products formed due to action of sunlight on siver chloride";         termProperty[20] = 20;
    problemTerms[21] = "Reaction of silver bromide in presence of sunlight";          termProperty[21] = 21;
    problemTerms[22] = "Reactions in which energy is absorbed";              termProperty[22] = 22;
    problemTerms[23] = "Colour of iron nails after keeping in copper sulphate";       termProperty[23] = 23;
    problemTerms[24] = "Reaction that produces a precipitate";   termProperty[24] = 24;
    problemTerms[25] = "Colour of precipitate in reaction of sodium sulphate and barium chloride";        termProperty[25] = 25;
    problemTerms[26] = "precipitate in reaction of sodium sulphate and barium chloride";			termProperty[26] = 26;
    problemTerms[27] = "Reactions in which there is an exchange of ions between the reactants";      termProperty[27] = 27;
    problemTerms[28] = "Reactant oxidised during reaction of hydrogen and copper oxide ";                termProperty[28] = 28;
    problemTerms[29] = "Reactant reduced during reaction of hydrogen and copper oxide";           termProperty[29] = 29;
    problemTerms[30] = "Substance gains oxygen or loses hydrogen during a reaction";     termProperty[30] = 30;
    problemTerms[31] = "Substance gains hydrogen or loses oxygen during a reaction";                 termProperty[31] = 31;
    problemTerms[32] = "Black coating on silver articles";          termProperty[32] = 32;
    problemTerms[33] = "Green coating on copper articles";    termProperty[33] = 32;
    problemTerms[34] = "Substances added to foods containing fats and oil";                     termProperty[34] = 33;
    problemTerms[35] = "Gas added in chip packets to prevent oxidation";       termProperty[35] = 34;
    problemTerms[36] = "Reactions in which a reactant displaces other from its compound";              termProperty[36] = 35;
    problemTerms[37] = "Precipatation reactions always produce";               termProperty[37] = 36;
    problemTerms[38] = "Formation of water from hydrogen and oxygen";                    termProperty[38] = 7;
    problemTerms[39] = "Burning of natural gas";              termProperty[39] = 5;
    problemTerms[40] = "Decomposition of vegetable matter into compost";             termProperty[40] = 5;
    problemTerms[41] = "Gases formed by heating of ferrous sulphate";                    termProperty[41] = 37;
    problemTerms[42] = "Gases formed by heating of lead nitrate";                    termProperty[42] = 38;
	problemTerms[43] = "Reaction of copper sulphate and zinc";                    termProperty[43] = 35;
	
}

}   /* End of Class MatchColumnProblems */

}   /* End of Package */
