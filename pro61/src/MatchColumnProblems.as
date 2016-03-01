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
    experimentName = new String("Carbon and its Compounds");
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
    numberOfProperties = 68;
    problemProperties = new Vector.<String>(numberOfProperties);

    /* Create properties Strings : past perfect, past, past continuous, present perfect, present, present continuous, future perfect, future, future continuous */
    problemProperties[0] = "0.02%";
    problemProperties[1] = "0.03%";
    problemProperties[2] = "carbon compounds ";
    problemProperties[3] = "6";
    problemProperties[4] = "4";
    problemProperties[5] = "17";
    problemProperties[6] = "double bond";
    problemProperties[7] = "Nitrogen atom";
    problemProperties[8] = "Methane";
	problemProperties[9] = "Covalent compounds";
	problemProperties[10] = "Allotropes of carbon";
	problemProperties[11] = "Rigid 3-D";
	problemProperties[12] = "Hexagonal array";
	problemProperties[13] = "Diamond";
	problemProperties[14] = "Graphite";
	problemProperties[15] = "Allotrope of carbon";
	problemProperties[16] = "Catenation";
	problemProperties[17] = "Saturated compounds";
	problemProperties[18] = "Unsaturated compounds";
	problemProperties[19] = "Silicon";
	problemProperties[20] = "5";
	problemProperties[21] = "Structural isomers";
	problemProperties[22] = "Ring structure";
	problemProperties[23] = "Hydrocarbons";
	problemProperties[24] = "Alkanes";
	problemProperties[25] = "Alkynes";
	problemProperties[26] = "Alkenes";
	problemProperties[27] = "Heteroatom";
	problemProperties[28] = "14";
	problemProperties[29] = "-ol";
	problemProperties[30] = "-al";
	problemProperties[31] = "-one";
	problemProperties[32] = "clean blue";
	problemProperties[33] = "yellow";
	problemProperties[34] = "Carbon dioxide, water";
	problemProperties[35] = "Nitrogen and Sulphur";
	problemProperties[36] = "Biomass";
	problemProperties[37] = "Oxidising agent";
	problemProperties[38] = "Nickel";
	problemProperties[39] = "Addition reaction";
	problemProperties[40] = "Vegetable oils";
	problemProperties[41] = "Sunlight";
	problemProperties[42] = "Ethanol";
	problemProperties[43] = "Medicine of ethanol";
	problemProperties[44] = "Hydrogen";
	problemProperties[45] = "Concentrared sulphuric acid";
	problemProperties[46] = "Methanal";
	problemProperties[47] = "denatured alcohol";
	problemProperties[48] = "acetic acid";
	problemProperties[49] = "Vinegar";
	problemProperties[50] = "Ethanoic acid";
	problemProperties[51] = "Ester";
	problemProperties[52] = "Acid and alcohol";
	problemProperties[53] = "Saponification";
	problemProperties[54] = "Sodium ethanoate and water";
	problemProperties[55] = "Salt, carbon dioxide and water";
	problemProperties[56] = "Soap molecules";
	problemProperties[57] = "Micelles";
	problemProperties[58] = "Colloid";
	problemProperties[59] = "dissolves in hydrocarbons";
	problemProperties[60] = "dissolves in water";
	problemProperties[61] = "Calcium and magnesium salts";
	problemProperties[62] = "Detergents";
	problemProperties[63] = "Three";
	problemProperties[64] = "C-14";
	problemProperties[65] = "Benzene";
	problemProperties[66] = "C-60";
	problemProperties[67] = "Functional groups";	
	

    /* Now create the problem terms and term properties array */
    numberOfTerms = 71;
    problemTerms  = new Vector.<String>(numberOfTerms);
    termProperty  = new Vector.<uint>(numberOfTerms);

    /* The problem statements are hardcoded here */
    /* In this special case, they could have been generated through a loop */
    problemTerms[0]  = "Concentration of carbon in earth's crust";					    	       termProperty[0]  = 0;
    problemTerms[1]  = "Concentration of carbondioxide in atmosphere";                  	           termProperty[1]  = 1;
    problemTerms[2]  = "Weak forces of attraction";                   termProperty[2]  = 2;
    problemTerms[3]  = "Atomic number of carbon";              termProperty[3]  = 3;
    problemTerms[4]  = "Number of valence electrons in carbon";                          termProperty[4]  = 4;
    problemTerms[5]  = "Atomic number of chlorine";                       termProperty[5]  = 5;
    problemTerms[6]  = "Bonding in oxygen molecule";      termProperty[6]  = 6;
    problemTerms[7]  = "Three shared pairs of electrons";                       termProperty[7]  = 7;
    problemTerms[8]  = "Major component of CNG";                  termProperty[8]  = 8;
    problemTerms[9]  = "Poor conductors of electricity";       termProperty[9]  = 9;
    problemTerms[10] = "Diamond and graphite";                   termProperty[10] = 10;
    problemTerms[11] = "Structure of diamond";              termProperty[11] = 11;
    problemTerms[12] = "Structure of graphite";      termProperty[12] = 12;
    problemTerms[13] = "Hardest substance";                   termProperty[13] = 13;
    problemTerms[14] = "Good conductor of electricity";                   termProperty[14] = 14;
    problemTerms[15] = "Fullerene";  termProperty[15] = 15;
    problemTerms[16] = "Ability to form bonds with carbon";             termProperty[16] = 16;
    problemTerms[17] = "Single bond between carbon atoms";        termProperty[17] = 17;
    problemTerms[18] = "Double and triple bond between carbon atoms";            termProperty[18] = 18;
    problemTerms[19] = "Element having catenation property besides carbon";                termProperty[19] = 19;
    problemTerms[20] = "Number of carbon atoms in pentyne";         termProperty[20] = 20;
    problemTerms[21] = "Same molecular formula but different structures";          termProperty[21] = 21;
    problemTerms[22] = "Structure of cyclohexane";              termProperty[22] = 22;
    problemTerms[23] = "Compounds having only carbon and hydrogen";       termProperty[23] = 23;
    problemTerms[24] = "Saturated hydrocarbons";   termProperty[24] = 24;
    problemTerms[25] = "Unsaturated hydrocarbons with triple bonds";           termProperty[25] = 25;
    problemTerms[26] = "Unsaturated hydocarbons with double bonds";   termProperty[26] = 26;
    problemTerms[27] = "Element replacing hydrogen atom";      termProperty[27] = 27;
    problemTerms[28] = "Number of hydrogen atoms in hexane";                termProperty[28] = 28;
    problemTerms[29] = "Suffix for alcohols";           termProperty[29] = 29;
    problemTerms[30] = "Suffix for aldehydes ";     termProperty[30] = 30;
    problemTerms[31] = "Suffix for ketones";                 termProperty[31] = 31;
    problemTerms[32] = "Flame colour of saturated hydrocarbons";          termProperty[32] = 32;
    problemTerms[33] = "Flame colour of unsaturated hydrocarbons";    termProperty[33] = 33;
    problemTerms[34] = "Products formed by combustion of hydrocarbons";                     termProperty[34] = 34;
    problemTerms[35] = "Constituents of petroleum and coal";       termProperty[35] = 35;
    problemTerms[36] = "Coal and petroleum are formed due to";              termProperty[36] = 36;
    problemTerms[37] = "Alkaline potassium permanganate";               termProperty[37] = 37;
    problemTerms[38] = "Catalyst in addition reaction";                    termProperty[38] = 38;
    problemTerms[39] = "Hydrogenation of vegetable oils";              termProperty[39] = 39;
    problemTerms[40] = "Long unsaturated carbon chains";             termProperty[40] = 40;
    problemTerms[41] = "Catalyst of substitution reaction";                    termProperty[41] = 41;
    problemTerms[42] = "Active ingredient of all alcoholic drinks";              termProperty[42] = 42;
    problemTerms[43] = "Tincture iodiine";         termProperty[43] = 43;
    problemTerms[44] = "Gas evovled by reaction of alcohols and sodium";              termProperty[44] = 44;
    problemTerms[45] = "Dehydrating agent";              termProperty[45] = 45;
    problemTerms[46] = "Form of methanol in liver";          termProperty[46] = 46;
    problemTerms[47] = "Poisonous mixture of ethanol and methanol";                 termProperty[47] = 47;
    problemTerms[48] = "Common name of ethanoic acid";             termProperty[48] = 48;
    problemTerms[49] = "5-8% solution of acetic acid in water";              termProperty[49] = 49;
    problemTerms[50] = "Glacial acetic acid";                   termProperty[50] = 50;
    problemTerms[51] = "Compound formed by reaction of acid and alcohol";     termProperty[51] = 51;
    problemTerms[52] = "Product of reaction of ester in presence of acid";        termProperty[52] = 52;
    problemTerms[53] = "Reaction used in preparation of soap";               termProperty[53] = 53;
    problemTerms[54] = "Products formed by reaction of carboxylic acid acid and base";              termProperty[54] = 54;
    problemTerms[55] = "Products formed by reaction of carboxylic acid acid and carbonates";              termProperty[55] = 55;
    problemTerms[56] = "sodium or potassium salts of long-chain carboxylic acids";                   termProperty[56] = 56;
    problemTerms[57] = "Structures of soap molecules in water";                termProperty[57] = 57;
    problemTerms[58] = "Form of micelles in solution";               termProperty[58] = 58;
    problemTerms[59] = "Hydrophobic end of soap molecules";                   termProperty[59] = 59;
    problemTerms[60] = "Hydrophilic end of soap molecules";         termProperty[60] = 60;
    problemTerms[61] = "Constituents of scum after washing with water";       termProperty[61] = 61;
    problemTerms[62] = "Ammonium or sulphonate salts of long chain carboxylic acids";                 termProperty[62] = 62;
    problemTerms[63] = "Constituents of shampoos";           termProperty[63] = 62;
    problemTerms[64] = "Products used to clean clothes";         termProperty[64] = 62;
    problemTerms[65] = "Number of isotopes of carbon";                   termProperty[65] = 63;
    problemTerms[66] = "Radioactive isotope of carbon";            termProperty[66] = 64;
    problemTerms[67] = "Cyclic form of carbon molecules";             termProperty[67] = 65;
    problemTerms[68] = "Example of fullerene allotrope";                termProperty[68] = 66;
    problemTerms[69] = "Specific group of atoms which give characteristic properties to carbon molecules";      termProperty[69] = 67;    
    problemTerms[70] = "Number of covalent bonds in methane";                termProperty[70] = 4;
    
}

}   /* End of Class MatchColumnProblems */

}   /* End of Package */
