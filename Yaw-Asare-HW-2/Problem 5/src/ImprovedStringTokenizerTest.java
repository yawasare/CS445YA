package problem5;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.JUnitCore;

public class ImprovedStringTokenizerTest {

	public static void main(String[] args) throws Exception {                    
	       JUnitCore.main(
	         "junitTest.ImprovedStringTokenizerTest");            
	}
	
	
	@Test
	public void testToArray() {
		ImprovedStringTokenizer tokenizer = 
				new ImprovedStringTokenizer("The quick brown fox jumps over the lazy dog");
		String[] testArray = tokenizer.toArray();
		
		assertEquals("Improved tokenizer should return array with correct number of elements",tokenizer.countTokens(),testArray.length);
		
		assertEquals("Improved tokenizer should return correct String array 1",
				testArray[testArray.length-1],"dog");
		
		assertEquals("Improved tokener should return correct String array 2",
				testArray[4],"jumps");
		
		assertEquals("Improved tokener should return correct String array 3",
				testArray[0],"The");
				
		
		assertEquals("Improved tokenizer should perform the same as string tokenizer 1","The",tokenizer.nextElement());
		assertEquals("Improved tokenizer should perform the same as string tokenizer 2","quick",tokenizer.nextElement());
	
		tokenizer = 
				new ImprovedStringTokenizer("  \n  ");
		testArray = tokenizer.toArray();
		
		assertEquals("Improved tokenizer should handle blank space",0,tokenizer.countTokens());
		assertEquals("Improved tokenizer should handle blank space 2",testArray.length,tokenizer.countTokens());
	}

}
