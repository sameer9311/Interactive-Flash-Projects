package  
{
	
public class TrueFalseProblems 
{
/* TestProject Framework Handle */
private var experimentName:String;                /* Title which appears on top border */
private var developerName:String;                 /* Developer name which appears on top border */

/* Experiment Question Bank and Choice */
private var questionBank:Vector.<String>;         /* Question Bank */

public function TrueFalseProblems() 
{
    /* Initialise Question Bank */
    this.initialiseQuestionBank();
}

/**
 *
 * This function fills the array of True/false problem statements
 * This function also creates all the required vectors
 * Each question is a string
 * The first character of each quaestion string is a digit
 * The true statement has digit 1 while the false statement has digit 0
 * 
 * Important : The problem statements are picked up at random. Therefore statements can be repeated to ensure greater frequency.
 *
 */
public function initialiseQuestionBank():void
{
    /* Set Title and Developer */
    experimentName = new String("MATERIAL-2");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBank = new Vector.<String>();

    /* The problem statements are hardcoded here */
    questionBank.push("0Sunlight and air are examples of exhaustible natural resources.");
	questionBank.push("1Resources which are available in plenty in nature and cannot be exhausted by human activities are called inexhaustible natural resources.");
	questionBank.push("0Forests are example of inexhaustible natural resources.");
	questionBank.push("1Wildlife, minerals, coal, petroleum and natural gas are exhaustible natural resources.");
	questionBank.push("1Coal, natural gas and petroleum are formed from the dead remains of living organisms(fossils).");
	questionBank.push("1When heated in air, coal  burns and mainly produces carbon dioxide gas.");
	questionBank.push("0Under high pressure and low temperature, dead plants burried beneath the soil slowly get converted into coal");
	questionBank.push("1The slow process of conversion  of dead vegetation into coal is called carbonisation.");
	questionBank.push("1Coke is obtained from coal.");
	questionBank.push("0Coke is not a pure form of carbon.");
	questionBank.push("1Ramesh uses a tough, porous and black substance in his steel manufacturing plant.This substance must definitely be coke.");
	questionBank.push("1Naphthalene balls used to repel moths and insects are obtained from coal tar.");
	questionBank.push("0Plastic and paint industries use coke as their raw material.");
	questionBank.push("1Coal tar is a  black thick liquid with unpleasant smell.");
	questionBank.push("1Coal gas is obtained during the processing of coal to get coke.");
	questionBank.push("1Petroleum was formed from the organisms living in the sea.");
	questionBank.push("1High pressure and high temperature in absence of air is necessary for formation of petroleum.");
	questionBank.push("1Petrol is used as a solvent for dry cleaning.");
	questionBank.push("0Natural gas cannot be transported over large distances through pipes.");
	questionBank.push("0Natural gas cannot be compressed under high pressure.");
	questionBank.push("1Paraffin wax obtained from petroleum can be used in candles and ointments.");
	questionBank.push("0Compressed natural gas is not a clean fuel.");
	questionBank.push("0Compressed natural gas cannot be used directly in factories when supplied through pipes.");
	questionBank.push("1PCRA stands for Petroleum Conservation Research Association.");
	questionBank.push("0Fossil fuels are inexhaustible resources.");
	questionBank.push("1Ionic compounds have high melting and boiling points.");
	questionBank.push("0Ionic compounds donot conduct electricity in  solution or molten state.");
	questionBank.push("1Carbon compounds are poor conductors of electricity.");
	questionBank.push("0The forces of attraction in carbon compounds are very strong.");
	questionBank.push("1Bonding in carbon compounds does not give rise to any ions.");
	questionBank.push("1Hydrogen shares its electron with other atoms to attain electronic configuration of helium.");
	questionBank.push("1Methane is widely used as a fuel and a major component in biogas and CNG.");
	questionBank.push("1Carbon atom is tetravalent.");
	questionBank.push("1Bonds which are formed by sharing of electron pairs between two atoms are called covalent bonds.");
	questionBank.push("0In covalent bonded molecules, the intermolecular forces are strong.");
	questionBank.push("1Covalent compounds have low melting and boiling points.");
	questionBank.push("0Covalent compounds are good conductors of electricty.");
	questionBank.push("0Graphite is not formed from carbon atoms.");
	questionBank.push("0Diamond and graphite have similar type of carbon atom bonding."); 
	questionBank.push("1In diamond, each carbon atom is bonded to four other carbon atoms forming a rigid three dimensional structure."); 
	questionBank.push("1In graphite, each carbon atom is bonded to three other carbon atoms in same plane forming hexagonal array. "); 
	questionBank.push("0In graphite, since each carbon atom forms a bond with three other carbon atoms, the valency of the carbon atom is not satisfied. "); 
	questionBank.push("1Graphite is a good conductor of electricity."); 
	questionBank.push("0Since diamond and graphite are both made up of carbon atoms, they have similar physical properties."); 
	questionBank.push("0Since diamond and graphite have different arrangement of carbon atoms in them, they have different chemical properties."); 
	questionBank.push("1Fullerene is a carbon allotrope."); 
	questionBank.push("1Carbon has catenation property at a very large extent like no other element."); 
	questionBank.push("1Catenation is the property of forming large number of bonds with atoms of same type."); 
	questionBank.push("0 The carbon-carbon bond is very strong but not stable."); 
	questionBank.push("1Tetravalency and catenation properties are both present in carbon."); 
	questionBank.push("1Carbon compounds in which the valencies of all atoms are satisfied by single bonds are called saturated compounds."); 
	questionBank.push("0Saturated carbon compounds are very reactive."); 
	questionBank.push("1Compounds of carbon having double or triple bonds between carbon atoms are called unsaturated compounds."); 
	questionBank.push("1Unsaturated carbon compounds are more reactive than saturated compounds."); 
	questionBank.push("0The structure of propane contains four carbon atoms."); 
	questionBank.push("1Structural isomers have identical molecular formula but different structures."); 
	questionBank.push("1Compounds containing only carbon and hydrogen are called hydrocarbons."); 
	questionBank.push("1Saturated hydrocarbons are called alkanes."); 
	questionBank.push("0Unsaturated carbon compounds having one or more triple bonds are called alkenes."); 
	questionBank.push("1Unsaturated carbon compounds having one or more triple bonds are called alkynes."); 
	questionBank.push("1Unsaturated carbon compounds having one or more double bonds are called alkenes."); 
	questionBank.push("0Unsaturated carbon compounds having one or more double bonds are called alkynes."); 
	questionBank.push("1The elemement replacing hydrogen from a hydrocarbon is called heteroatom."); 
	questionBank.push("0Melting and boiling points decrease with increasing molecular mass in carbon compounds."); 
	questionBank.push("1Unsaturated hydrocarbons give yellow flame along with lot of  black smoke during combustion.");
	questionBank.push("0Saturated hydrocarbons donot give a clean flame during combustion."); 
	questionBank.push("1Alkaline potassium permanganate is an oxidising agent."); 
	questionBank.push("1Acidified potassium dichromate is an oxidising agent."); 
	questionBank.push("1Vegetable oils generally have long unsaturated carbon chains while animal fats have saturated carbon chains."); 
	questionBank.push("1Oils containing unsaturated fatty acids should be chosen for cooking"); 
	questionBank.push("1Addition reactions in hydrocarbons take place in the presence of nickel or palladium catalysts."); 
	questionBank.push("1Medicines such as tincture iodine and cough syrups contain ethanol."); 
	questionBank.push("1Ethanol reacts with sodium to give sodium ethoxide. "); 
	questionBank.push("0Heating ethanol at 443K in excess  concentrated sulphuric acid leads to formation of ethene."); 
	questionBank.push("1Ethanoic acid is also called glacial acetic acid."); 
	questionBank.push("0Carboxylic acids are strong acids."); 
	questionBank.push("1In saponification reaction, the end products formed are alcohol and acid."); 
	questionBank.push("0Ethanoic acid reacts with absolute ethanol in presence of base catalyst to produce ester."); 
	questionBank.push("0Ethanoic acid reacts with carbonates and hydrogen carbonates to produce sodium acetate alone."); 
	questionBank.push("1Ethanoic acid reacts with carbonates and hydrogen carbonates to produce sodium acetate along with carbon dioxide and water."); 
	questionBank.push("1The molecules of soap are sodium or potassium salts of long-chain carboxylic acids."); 
	questionBank.push("0During soap formation, the ionic end of the micelle is towards the oil droplet."); 
	questionBank.push("1Soap molecules have two ends- hydrophilic and hydrophobic"); 
	questionBank.push("1The hydrophobic end of the soap molecules dissolves in hydrocarbons."); 
	questionBank.push("0The micelles in soap solution are in the form of suspension."); 
	questionBank.push("1Detergents are generally ammonium or sulphonate salts of long chain carboxylic acids. "); 
	
    
}

/**
 *
 * This function returns question given index
 *
 */
public function getQuestion(qIndex:uint):String
{
    if (qIndex < questionBank.length) { return(questionBank[qIndex]); }
    else  { return(new String("0")); }
}

/**
 *
 * This function returns question bank size
 *
 */
public function getQuestionBankSize():uint
{
    return(questionBank.length);
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
