package problem4;

import static org.junit.Assert.*;

import org.junit.Test;

public class ImprovedRandomTest {

	@Test
	public void testNextIntInt() {
		ImprovedRandom random  = new ImprovedRandom();
		int total = 0;
		
		for(int i = 1; i < 21;i++){
			int number = random.nextInt(0,1);
			total += i;
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number == 0);
		}
		
		for(int i = 1; i < 21;i++){
			int number = random.nextInt(0,2);
			total += i;
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number >= 0 && number < 2);
		}
		
		for(int i = 1; i < 21;i++){
			total += i;
			int number = random.nextInt(-80,-160);
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number == 0);
		}
		
		for(int i = 1; i < 21;i++){
			total += i;
			int number = random.nextInt(0,0);
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number == 0);
		}
		
		for(int i = 1; i < 51;i++){
			total += i;
			int number = random.nextInt(0,20);
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number >= 0 && number < 20);
		}
		
		for(int i = 1; i < 51;i++){
			total += i;
			int number = random.nextInt(0,20);
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number >= 0 && number < 20);
		}
		
		for(int i = 1; i < 21;i++){
			total += i;
			int number = random.nextInt(50,20);
			assertTrue("nextInt(bottom,top) should handle correct ranges " +total, number==0);
		}
	}

}
