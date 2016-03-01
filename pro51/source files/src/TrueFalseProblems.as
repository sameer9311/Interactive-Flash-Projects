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
    experimentName = new String("MATERIAL-5");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBank = new Vector.<String>();

    /* The problem statements are hardcoded here */
    questionBank.push("0Lustre and hardness are chemical properties of metals.");
	questionBank.push("0Malleability is a property of metals due to which they can be drawn into wires.");
	questionBank.push("1Malleability is a property of metals due to which they can be cast into sheets.");
	questionBank.push("0Sulphur and coal are good conductors of electricity.");
	questionBank.push("1The property of metal by which it can be drawn into wires is called ductility.");
	questionBank.push("0The property of metal by which it can be cast into sheets is called ductility.");
	questionBank.push("0All metals are sonorous.");
    questionBank.push("0Phosphorous, diamond and graphite are metals.");
	questionBank.push("1During the combustion of magnessium ribbon in air, oxide formation takes place. ");
	questionBank.push("0The rust formed on the surface of iron is acidic in nature. ");
	questionBank.push("0The rust formed on the surface of copper vessel is red in colour.");
	questionBank.push("1The green coating on the surface of a  moist copper vessel is mixture of copper hydroxide and copper carbonate.");
	questionBank.push("1The ash formed due to combustion of magnessium ribbon is basic in nature.");
	questionBank.push("1Metallic oxides are basic in nature.");	
	questionBank.push("0When sulphur dioxide dissolves in water, sulphuric acid is formed.");
	questionBank.push("1When sulphur dioxide dissolves in water, sulphurous acid is formed.");
	questionBank.push("1Non-metallic oxides are acidic in nature.");
	questionBank.push("0Non-metallic oxides are basic in nature.");
	questionBank.push("0Metallic oxides are acidic in nature");
	questionBank.push("0Since non-metals are very reactive in air, they react with water vigorously.");
	questionBank.push("1To prevent  contact of phosphorous with atmospheric oxygen, it is stored in water.");
	questionBank.push("0To prevent  contact of sodium with atmospheric oxygen, it is stored in water.");
	questionBank.push("1To prevent  contact of sodium with atmospheric oxygen, it is stored in kerosene.");
	questionBank.push("0To prevent  contact of phosphorous with atmospheric oxygen, it is stored in kerosene.");
	questionBank.push("0Non-metals react with acids to produce hydrogen gas with pop sound.");
	questionBank.push("1Metals react with acids to produce hydrogen gas with pop sound.");
	questionBank.push("0Copper reacts with dilute hydrochloric acid violently to produce hydrogen gas.");
	questionBank.push("1Metals react with sodium hydroxide to produce hydrogen gas.");
	questionBank.push("1Zinc is more reactive than iron and copper.");
	questionBank.push("1When copper fillings are put into a solution of iron sulphate, no reaction occurs.");
	questionBank.push("1Zinc granules added in copper sulphate solution displace copper fillings from it hence the blue colour of the solution disappears.");
	questionBank.push("1Iron is more reactive than copper.");
	questionBank.push("1More reactive metals displace less reactive metals from their compounds in aqueous solutions");
	questionBank.push("0Metals donot react with bases to produce hydrogen gas.");
	questionBank.push("1Gold is the most ductile metal.");
	questionBank.push("1Silver and copper are best conductors of heat.");
	questionBank.push("1Lead and mercury are poor conductors of heat.");
	questionBank.push("0Bromine and mercury are liquid metals.");
	questionBank.push("1Gallium and caesium have very high melting points.");
	questionBank.push("0Iodine is a metal but it is non-lustrous.");
	questionBank.push("1when copper is heated in air, it combines with oxygen to form copper(II) oxide, a black oxide."); 
	questionBank.push("1Metal oxides which react with both acids as well as bases to produce salts and water are known as amphoteric oxides."); 
	questionBank.push("1Aluminium oxide is an amphoteric oxide."); 
	questionBank.push("1When aluminium oxide reacts with sodium hydroxide, sodium aluminate is formed."); 
	questionBank.push("0Most metal oxides are soluble in water. "); 
	questionBank.push("1Silver and gold do not react with oxygen even at high temperatures."); 
	questionBank.push("1During anodising, a clean aluminium article is made the anode and is electrolysed with dilute sulphuric acid"); 
	questionBank.push("0During anodising, a clean aluminium article is made the anode and is electrolysed with dilute hydrocholoric acid"); 
	questionBank.push("0During anodising, a clean aluminium article is made the cathode and is electrolysed with dilute sulphuric acid"); 
	questionBank.push("1The aluminium oxide layer formed on the surface of aluminium articles protects it from further rusting."); 
	questionBank.push("0All metals react with water to form metal oxide and hydrogen gas."); 
	questionBank.push("0Calcium reacts with water violently that the hydrogen evolved immediately catches fire due to heat produced. "); 
	questionBank.push("1When calcium and magnesium react with water, they start floating on the surface of the water."); 
	questionBank.push("1Metals react with acids to give a salt and hydrogen gas."); 
	questionBank.push("0Hydrogen gas is evolved when metals react with nitric acid."); 
	questionBank.push("1Nitric acid is a strong oxidising agent."); 
	questionBank.push("1Magnesium (Mg) and manganese (Mn) react with very dilute nitric acid to evolve hydrogen gas."); 
	questionBank.push("0Copper reacts with dilute hydrochloric acid to produce hydrogen gas."); 
	questionBank.push("1Aqua regia is a freshly prepared mixture of concentrated hydrochloric acid and concentrated nitric acid in the ratio of 3:1"); 
	questionBank.push("0Aqua regia is a freshly prepared mixture of concentrated nitric acid and concentrated hydrochloric acid in the ratio of 3:1"); 
	questionBank.push("1Lead displaces copper from copper sulphate solution."); 
	questionBank.push("0Copper displaces iron from ferrous sulphate solution. "); 
	questionBank.push("1The compounds formed by the transfer of electrons from a metal to a non-metal are known as ionic compounds or electrovalent compounds."); 
	questionBank.push("0In NaCl the cation is Na and the anion is Cl."); 
	questionBank.push("1Ionic compounds are generally brittle and break into pieces when pressure is applied."); 
	questionBank.push("0Ionic compounds have low melting and boiling points."); 
	questionBank.push("0Ionic compounds are extremely soluble in  solvents such as kerosene and petrol."); 
	questionBank.push("1Ionic compounds donot conduct electricity in solid state but conduct in molten state."); 
	questionBank.push("0All minerals are ores."); 
	questionBank.push("1All ores are minerals."); 
	questionBank.push("1Gold, silver, platinum and copper are found in nature in the free state."); 
	questionBank.push("1Metals in the middle of the activity series are extracted using reduction with carbon."); 
	questionBank.push("1Metals at the bottom of the activity series are found in free state in nature."); 
	questionBank.push("1Cinnabar is an ore of mercury."); 
	questionBank.push("1The oxides of metals at the bottom of the activity series can be reduced by heating only.");
	questionBank.push("1Copper and mercury can be extracted from their oxides ores by heating.");
	questionBank.push("1It is easier to extract a metal from its oxide, as compared to its sulphides and carbonates.");
	questionBank.push("0The sulphide ores are converted into oxides by heating strongly in the absence of air.");
	questionBank.push("1Roasting is the process of converting sulphide ores into oxides by heating strongly in excess air.");
	questionBank.push("0The carbonate ores are changed into oxides by heating strongly in excess air.");
	questionBank.push("1Calcination is the process of converting carbonate ores into oxides in presence of limited air.");
	questionBank.push("0Roasting process is used to convert  metal carbonates into metal oxides. ");
	questionBank.push("0Calcination process is used to convert metal sulphides into metal oxides.");
	questionBank.push("1Metal oxides of metals in the middle of the activity series are reduced to corresponding metals using carbon.");
	questionBank.push("1 When manganese dioxide is heated with aluminium powder, large amount of heat is given out.");
	questionBank.push("0Thermit reaction is an endothermic reaction.");
	questionBank.push("1Iron produced after thermit reaction is in molten form.");
	questionBank.push("1Thermit reaction is used for joining railway tracks.");
	questionBank.push("0Carbon can reduce the oxides of sodium, magnesium, calcium, aluminium to the respective metals");
	questionBank.push("1During electrolysis of molten chlorides of metals at the top of activity series, metal is deposited at the cathode whereas chlorine is released at the anode.");
	questionBank.push("1Aluminium is obtained by electrolytic reduction of aluminium oxide.");
	questionBank.push("0In electrolytic refining, metal  to be purified is made as cathode whereas pure metal is kept as anode.");
	questionBank.push("0In electrolytic refining, the insoluble impurities get settled down at the bottom of cathode.");
	questionBank.push("1Silver reacts with sulphur in the air to form a black coating of silver sulphide.");
	questionBank.push("0Copper reacts with moist carbon dioxide in air to form a green coating of copper sulphide.");
	questionBank.push("1Galvanisation is a method of protecting steel and iron from rusting by coating them with a thin layer of zinc.");
	questionBank.push("0Alloying cannot be used to protect metals from rusting.");
	questionBank.push("1In an alloy if one of the elements is mercury, it is called amalgam.");	
	questionBank.push("1Solder is an alloy of tin and lead.");
	questionBank.push("1Brass is an alloy of copper and zinc.");
	questionBank.push("1Bronze is an alloy of copper and tin.");
	questionBank.push("0The electrical conductivity and melting point of an alloy is greater than that of pure metals.");
	
		
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
