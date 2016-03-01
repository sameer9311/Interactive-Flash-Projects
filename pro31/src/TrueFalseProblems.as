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
    experimentName = new String("LIGHT-1");
    developerName  = new String("Sameer Sonawane");

    /* Now create the problem sentence array */
    questionBank = new Vector.<String>();

    /* The problem statements are hardcoded here */
    questionBank.push("1Light travels in straight line.");
    questionBank.push("0The surface of water cannot change the path of light falling on it.");
    questionBank.push("1Any polished surface can act as a mirror.");
    questionBank.push("1Mirror changes the path of light falling on it.");
    questionBank.push("1Objects are visible to us only when light reflected from them reaches our eyes.");
    questionBank.push("1An image formed by a plane mirror is erect and of same size as that of the object.");
    questionBank.push("0The image formed by a plane mirror is at a larger distance from the mirror than the  distance of the object from the mirror.");
    questionBank.push("0In the side mirrors of vehicles, the images appear larger than the objects.");
    questionBank.push("1The image formed by a back of spoon is smaller than the object.");
    questionBank.push("0The image formed by a back of a spoon is not erect.");
    questionBank.push("0The image formed by inner side of a spoon is always erect.");
    questionBank.push("0The curved surface of a spoon cannot act as a mirror.");
    questionBank.push("0The image formed by a plane mirror can be obtained on a screen.");
    questionBank.push("0Plane mirror can produce real images.");
    questionBank.push("1The image formed by a concave mirror can be smaller or larger than the object.");
    questionBank.push("1The image formed by a concave mirror can be real or virtual.");
    questionBank.push("0Doctors use convex mirrors to examine eyes, ears, nose and throat.");
    questionBank.push("1Reflectors in torches and vehicles use concave in shape.");
    questionBank.push("1The mirrors used in scooters are convex mirrors.");
    questionBank.push("1Those lenses which feel thicker in the middle than at the edges are convex lenses");
    questionBank.push("1Those lenses which feel thinner in the middle than at the edges are concave lenses");
    questionBank.push("0It is possible to burn a paper using a concave lens");
    questionBank.push("1Convex lens is also called converging lens whereas concave lens is also called diverging lens.");
    questionBank.push("0Concave lens is used as a magnifying lens.");
    questionBank.push("1Concave lens always forms virtual, erect and smaller image image than the object.");
    questionBank.push("0The angle of reflection is not always equal to the angle of incidence.");
    questionBank.push("1Law of reflection says that angle of incidence is always equal to the angle of reflection.");
    questionBank.push("1For any mirror, the incident ray, the normal at the point of incidence and the reflected ray all lie in the same plane.");
    questionBank.push("0For diffused  an irregular reflection, the law of reflection is not valid.");
    questionBank.push("1Two plane mirrors are used in a periscope.");
    questionBank.push("1The iris controls the amount of light entering into the human eye.");
    questionBank.push("1The size of the pupil is controlled by the iris.");
    questionBank.push("0The cornea is part of the eye which gives it a distinctive colour.");
    questionBank.push("0In human eye, cones are sensitive to dim light.");
    questionBank.push("1In Human eye, cones are sensitive to bright light whereas rods are sensitive to dim light.");
    questionBank.push("1Blind spot is present at the junction of retina and optic nerve.");
    questionBank.push("1If still images  of moving object are flashed on the eye faster than 16 per second, the eye perceives the object as moving.");
    questionBank.push("1The most comfortable distance with which one can read with normal eye is about 25 cm.");
    questionBank.push("0Night blindness is caused due to lack of vitamin B.");
    questionBank.push("0Beautiful patterns are formed in a kaleidoscope due to multiple refractions.");
    questionBank.push("1Splitting of white light into seven colours is due to dispersion.");
    questionBank.push("0For a spherical mirror, the angle of incidence is not equal to the angle of reflection.");
    questionBank.push("0For a spherical mirror, the reflected ray and incident ray donot lie in a single plane.");
    questionBank.push("1A spherical mirror whose reflecting surface is curved inwards toward centre of sphere is called concave mirror.");
    questionBank.push("1A spherical mirror whose reflecting surface is curved outwards i.e away from centre of sphere is called convex mirror.");
    questionBank.push("0The pole of a reflecting surface is same as centre of curvature of the surface.");
	questionBank.push("0The pole of the reflecting surface may not lie on it.");
	questionBank.push("1The center of curvature of a reflecting surface does not lie on its surface.");
	questionBank.push("1The center of curvature of a cocave mirror lies in front of it.");
	questionBank.push("0The center of curvature of a covex mirror lies in front of it.");
	questionBank.push("0For spherical mirrors of small aperture, the radius of curvature is thrice the focal length.");
	questionBank.push("1Principle focus of a spherical mirror lies midway between centre of curvature and pole.");
	questionBank.push("0Concave mirror always forms real and inverted images.");
	questionBank.push("0Concave mirror forms highly enlarged image when the object is kept at infinity.");
	questionBank.push("1Concave mirrors are used in solar furnaces to concentrate sunlight.");
	questionBank.push("1Convex mirror always produces virtual image.");
	questionBank.push("1Convex mirror always produces diminished image.");
	questionBank.push("1Rahul wants to see full length image of a distant object. He should therefore use convex mirror.");
	questionBank.push("0A mirror has focal length 10cm. The radius of curvature thus will be 5cm.");
	questionBank.push("1Magnification of a mirror is defined as the ratio of size of image and size of object.");
	questionBank.push("1Magnification of a mirror is defined as negative ratio of image distance and object distance.");
	questionBank.push("0A negative sign in the value of magnification of a mirror indicates that the image is virtual.");
	questionBank.push("1A negative sign in the value of magnification of a mirror indicates that the image is real.");
	questionBank.push("1A positive sign in the value of magnification of a mirror indicates that the image is virtual.");
	questionBank.push("1In refraction by a glass slab, the emergent ray is parallel to the incident ray.");
	questionBank.push("1Refraction is due to the change of speed of light as it enters from one transparent medium to another.");
	questionBank.push("0The  value of snell's ratio for air and water is same for air and glass, for a given set of angle of incidence.");
	questionBank.push("0An optically denser medium has a greater mass density than the other.");
	questionBank.push("1An imaginary straight line passing through the two centre of curvatures of a lens is called principle axis.");
	questionBank.push("1There are two centre of curvatures for a lens.");
	questionBank.push("1A ray of light passing through the optical centre of a lens suffers no deviation.");
	questionBank.push("0A lens has one principle focus.");
	questionBank.push("0Convex lens always forms real and inverted images.");
	questionBank.push("1Concave lens always forms virtual an erect images.");
	questionBank.push("1According to convention, the focal length of convex lens is taken positive whereas that of concave lens is taken negative.");
	questionBank.push("0The magnification produced by a lens is given by negative ratio of image distance and object distance.");
	questionBank.push("1Concave lens always forms an image on the same side a that of the object.");
	questionBank.push("0Convex lens of shorter focal length bends light rays through small angles.");
	questionBank.push("1The power of a lens is defined as reciprocal of its focal length.");
	questionBank.push("1The SI unit of power of lens is 'dioptre'.");
	questionBank.push("1Power of convex lens is positive whereas power of concave lens is negative.");	
	questionBank.push("1The speed of light varies in different mediums and is largest in vaccum.");
	questionBank.push("0The focal length of a lens is -15cm. Thus, the len is convex.");
	questionBank.push("1A combination of two lenses of power +2.0D and -0.5D is equivalent to a single lens of power +1.5D.");
	questionBank.push("1Arjun has spectacles with power +2.0 D. Therefore he uses convex lens. ");
	questionBank.push("0Anil uses lens of power -2.5D. Thus, the focal length of the lens is 50cm.");	
	
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
