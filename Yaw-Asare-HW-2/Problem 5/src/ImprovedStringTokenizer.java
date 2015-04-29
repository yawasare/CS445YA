package problem5;

import java.util.StringTokenizer;

public class ImprovedStringTokenizer extends StringTokenizer{
	private String string;
	
	public ImprovedStringTokenizer(String str) {
		super(str);
		this.string = str;
	}
	
	public ImprovedStringTokenizer(String str, String delim){
		super(str,delim);
		this.string = str;
	}
	
	public ImprovedStringTokenizer(String str, String delim, boolean returnDelims){
		super(str,delim,returnDelims);
		this.string = str;
	}
	
	public String[] toArray(){
		String[] contents = string.split("\\s");
		return contents;
	}

}
