import java.io.*;
import java.util.*;

public class DataParser {
	File file;
	String filepath = "C:/Users/JonFrankline/Desktop/cs445data";
	BufferedReader br;
	FileReader fr;
	BufferedWriter bw;
	FileWriter fw;
	String readpath;
	String writepath;

	public DataParser(String readname, String writename){
		readpath = filepath + "/" + readname;
		writepath = filepath + "/" + writename;
	}	

	public void processMovieData(){
		int i = 0;
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("Oopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
				
//				switch(data[0]){
//				case "Title":
				if(data[0].equals("Title")){
					bw.write(data[1]);
					bw.write("\t");
					bw.flush();
					
					line = br.readLine();
					data = line.split("\t");
					
					if(data[0].equals("Year")){
						bw.write(data[1]);
						bw.write("\t");
						bw.flush();
					}
					else{
						bw.write("\t");
						bw.flush();
					}
					
					line = br.readLine();
					data = line.split("\t");
					if(data[0].equals("Running Time")){
						
						line = br.readLine();
						data = line.split("\t");
						
						if(data[0].equals("MPAA Rating")){
							bw.write(data[1]);
							bw.newLine();
							bw.flush();
						}
						else{
							bw.newLine();
							bw.flush();
						}
					}
					else if(data[0].equals("MPAA Rating")){
						bw.write(data[1]);
						bw.newLine();
						bw.flush();
					}
					bw.flush();
				}
//					break;
//				case "Year":
//				else if(data[0].equals("Year")){
//					bw.write(data[1]);
//					bw.flush();
//				}
//				else if(data[0].equals("MPAA Rating")){
//					bw.write(data[1]);
//					
//				}
//					break;
//				}
				continue;
			}
			bw.flush();
			bw.close();
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}

	public void processPeopleData(){
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("Oopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
					
				if(data[0].equals("Actor")){
					bw.write(data[1]);
					bw.newLine();
					bw.flush();
				}
				else if(data[0].equals("Actress")){
					bw.write(data[1]);
					bw.newLine();
					bw.flush();
				}
				else if(data[0].equals("Producers")){
					for(String s : data){
						if(!s.equals("Producers")){
							bw.write(s);
							bw.newLine();
							bw.flush();
						}
					}
				}
				else if(data[0].equals("Directors")){
					for(String s : data){
						if(!s.equals("Directors")){
							bw.write(s);
							bw.newLine();
							bw.flush();
						}
					}
				}
				continue;
			}
			bw.flush();
			bw.close();
			removeDuplicates(writepath);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}
	
	public void processMpaaData(){
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
				bw.write(data[0] + "\t" + data[2]);
				bw.newLine();
				continue;
			}
			bw.flush();
			bw.close();
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}
	
	public void processActorData(){
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
				if(data[0].equals("Actor")){
					bw.write(data[1]);
					bw.newLine();
					bw.flush();
				}
				else if(data[0].equals("Actress")){
					bw.write(data[1]);
					bw.newLine();
					bw.flush();
				}
				continue;
			}
			bw.flush();
			bw.close();
			removeDuplicates(writepath);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}
	
	public void processProducerData(){
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
				if(data[0].equals("Producers")){
					for(String s : data){
						if(!s.equals("Producers")){
							bw.write(s);
							bw.newLine();
							bw.flush();
						}
					}
				}
				continue;
			}
			bw.flush();
			bw.close();
			removeDuplicates(writepath);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}
	
	public void processDirectorData(){
		String line;
		String[] data = new String[50];

		try{
			fr = new FileReader(readpath);
			br = new BufferedReader(fr);
		}
		catch(FileNotFoundException fof){
			System.out.println("Couldn't find the file.");
		}

		try{
			fw = new FileWriter(writepath);
			bw = new BufferedWriter(fw);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}

		try{
			while((line = br.readLine()) != null){
				data = line.split("\t");
				if(data[0].equals("Directors")){
					for(String s : data){
						if(!s.equals("Directors")){
							bw.write(s);
							bw.newLine();
							bw.flush();
						}
					}
				}
				continue;
			}
			bw.flush();
			bw.close();
			removeDuplicates(writepath);
		}
		catch(IOException io){
			System.out.println("woopsie");
		}
	}
	
	public void removeDuplicates(String filename) throws FileNotFoundException, IOException {
	    BufferedReader reader = new BufferedReader(new FileReader(filename));
	    Set<String> lines = new LinkedHashSet<String>(1000000);
	    String line;
	    while ((line = reader.readLine()) != null) {
	        lines.add(line);
	    }
	    reader.close();
	    BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
	    for (String unique : lines) {
	        writer.write(unique);
	        writer.newLine();
	    }
	    writer.close();
	}
}