package problem4;

import java.util.Random;

public class ImprovedRandom extends Random {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ImprovedRandom(){
		super();
		
	}
	
	public ImprovedRandom(long seed){
		super(seed);
	}
	
	public int nextInt(int bottom, int top){
		if(bottom < top && bottom >= 0 & top >= 0){
			return super.nextInt(top-bottom) + bottom;
		}
		else
			return 0;
	}
	
}
