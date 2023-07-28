import java.lang.Math;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Arrays;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;



public class wcx {
	public static void main(String[] args) throws IOException{

		if(args.length != 1){
			System.out.println("uso: wilcoxon resultados");
			System.exit(1);
		}
	
		FileReader fr = new FileReader(args[0]);
		BufferedReader br = new BufferedReader(fr);
		ArrayList<double[]> dados = new ArrayList<double[]>();

		String linha = br.readLine();
		while (linha != null) {
			String[] objs = linha.split("\\s");
			if(objs.length==0)
				objs = linha.split("\t");
			if ( objs.length>0 && (objs.length != 1 || !(objs[0].equals(""))) && !objs[0].equals("#") ) {
				double[] d = new double[objs.length];
				for (int i = 0; i < objs.length; i++) {
					d[i] = Double.parseDouble(objs[i].replace(",","."));
				}
				dados.add(d);
			} else {
				if(dados.size() > 0)
					operacoes(dados);
				dados.clear();
			}
			linha = br.readLine();
		}
		if(dados.size() > 0)
			operacoes(dados);	
	}
	
	public static void operacoes(ArrayList<double[]> dados) {
		String saida="";
		String sets="";
		int melhorIndice=-1;
		double[] medias=calcularMedias(dados);
		
		for(int a=1;a<dados.get(0).length;a++){ //percorre as colunas (resultados dos algoritmos a comparar)
			//conjunto 0
			saida+="conj"+0+"<-c(";
			sets+="conj"+0+",";
			for(int j=0;j<dados.size();j++){ //percorre linha a linha
				saida+=dados.get(j)[0]+",";
			}
			saida=(saida.substring(0,saida.length()-1));
			saida+=");";
		
			//outros conjuntos
			saida+="conj"+a+"<-c(";
			sets+="conj"+a+",";
			for(int j=0;j<dados.size();j++){ //percorre linha a linha
				saida+=dados.get(j)[a]+",";
			}
			saida=(saida.substring(0,saida.length()-1));
			saida+=");";
			
			if(medias[0] > medias[a])
				melhorIndice=a;
			else
				melhorIndice=0;				
			
			System.out.println();
		//	System.out.print("Comp: 1->"+(a+1)+" melhor: "+(melhorIndice+1)+" --> ");
			//saida+="require(pgirmess);";
			sets=(sets.substring(0,sets.length()-1));
			saida+="wilcox.test("+sets+",paired=TRUE);";
			//System.out.println(saida);
			execute(saida, (a+1), melhorIndice+1);
			
			melhorIndice=-1;
			saida=sets="";
		}
		System.out.println();
	}
	static double[] calcularMedias(ArrayList<double[]> dados){
		double[] medias = new double[dados.get(0).length];
		Arrays.fill(medias,0);
		for(int i=0;i<dados.get(0).length;i++){
			for(int j=0;j<dados.size();j++){
				medias[i]+=dados.get(j)[i];
			}
			medias[i]/=dados.size();
		}
		return medias;
	}
	public static void execute(String saida, int atual, int melhor){
		Process p;
		try {
			p = Runtime.getRuntime().exec("./wilcoxonAux.sh "+saida+" "+atual+" "+melhor);
			//System.out.println("./wilcoxonAux.sh "+saida+" "+melhor);
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = reader.readLine();
			while (line != null) {
				System.out.print(line);
				line = reader.readLine();
			}
		}catch (Exception e){	e.printStackTrace();}
		//System.out.println();
	}
}
