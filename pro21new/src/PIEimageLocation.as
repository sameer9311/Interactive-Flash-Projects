package  
{
/**
 * 
 * For every image to be used, the following syntax needs to be followed
 * 
 * [Embed(source = 'absolute or relative path of the file')]
 * public static const _name_to_be_used:Class; 
 * 
 * For cases there is only one or two images, 
 * this class can also be omitted and the above two lines can be directly 
 * used in the Experiment.as. 
 * 
 */
public class PIEimageLocation
{		
[Embed(source = 'Images/nextbutton.jpg')]
public static const nxtImgPtr:Class; 

[Embed(source = 'Images/backbutton.jpg')]
public static const bkImgPtr:Class; 

[Embed(source = 'Images/resetbutton.jpg')]
public static const rstImgPtr:Class; 

[Embed(source = 'Images/quizbutton.jpg')]
public static const qzImgPtr:Class; 

[Embed(source = 'Images/weimage.jpg')]
public static const weImgPtr:Class; 

[Embed(source = 'Images/youimage.jpg')]
public static const youImgPtr:Class;

[Embed(source = 'Images/iimage.jpg')]
public static const iImgPtr:Class;

[Embed(source = 'Images/sheimage.jpg')]
public static const sheImgPtr:Class;

[Embed(source = 'Images/heimage.jpg')]
public static const heImgPtr:Class;

[Embed(source = 'Images/theyimage.jpg')]
public static const theyImgPtr:Class;

[Embed(source = 'Images/itimage.jpg')]
public static const itImgPtr:Class;

[Embed(source = 'Images/sayimage.png')]
public static const sayImgPtr:Class;

[Embed(source = 'Images/correctimage.jpg')]
public static const corImgPtr:Class;

[Embed(source = 'Images/wrongimage.jpg')]
public static const wrngImgPtr:Class;

} /* End of Image Class */

}