import java.lang.Math;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Arrays;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class wilcoxon {
	static int numExec=30;
	public static void main(String[] args) throws IOException{

		ArrayList<double[]> resultados = new ArrayList<double[]>();
		if(args.length == 0){
			System.out.println("uso: friedman <arquivo com as metricas>");
			System.exit(1);
		}
		
		for(int files=0;files<args.length;files++){

			FileReader fr = new FileReader(args[files]);
			BufferedReader br = new BufferedReader(fr);
			ArrayList<double[]> dados = new ArrayList<double[]>();

			String linha = br.readLine();
			int numeroLinha=0;
			while (linha != null) {
				String[] objs = linha.split("\\s");
				double[] d = new double[objs.length];
				if(objs.length==0)
					objs = linha.split("\t");
				if ((objs.length != 1 || !(objs[0].equals(""))) && !objs[0].equals("#") ) {
					d[numeroLinha]=Double.parseDouble(objs[0].replace(",","."));
					numeroLinha++;
				} else {
					if(numeroLinha>0)
						dados.add(d.clone());
					numeroLinha=0;
				}
				linha = br.readLine();
			}
			if(numeroLinha>0)
				dados.add(d);

			if(dados.size() > 0){
				arquivos.add(dados);
				resultados.add(calcularMedia(dados));
			}
		}
		operacoes(arquivos, resultados);
	}
	public static void execute(String saida, int melhor){
		Process p;
		try {
			p = Runtime.getRuntime().exec("./wilcoxonAux.sh "+saida+" "+melhor);
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
	public static void operacoes(ArrayList<ArrayList<double[]>> arquivos, ArrayList<double[]> medias){
		String saida="";
		String sets="";
		
		for(int i=0;i<arquivos.get(0).size();i++){ //percorre os conjuntos dentro dos arquivos (uma divisao pra cada fronteira (2,3,5,10,15 e 20 objetivos))
			int melhorIndice=-1;

		
		
			for(int a=1;a<arquivos.size();a++){ //percorre o conteúdo dos arquivos
				saida="";
				sets="";
				
				saida+="conj"+i+""+0+"<-c(";
				sets+="conj"+i+""+0+",";
				for(int j=0;j<arquivos.get(0).get(i).length;j++){ //percorre linha a linha
					saida+=arquivos.get(0).get(i)[j]+",";
				}
				saida=(saida.substring(0,saida.length()-1));
				saida+=");";
				
				saida+="conj"+i+""+a+"<-c(";
				sets+="conj"+i+""+a+",";
				for(int j=0;j<arquivos.get(a).get(i).length;j++){ //percorre linha a linha
					saida+=arquivos.get(a).get(i)[j]+",";
				}
				
				
				//if(melhorValor > medias.get(a)[i]){
				if(medias.get(0)[i] > medias.get(a)[i])
					melhorIndice=a;
				else
					melhorIndice=0;
				System.out.println("\nM"+(a+1)+": "+medias.get(a)[i]);
					
				//saida.charAt(saida.length())=')';
				saida=(saida.substring(0,saida.length()-1));
				saida+=");";
				
				System.out.println();
				System.out.print("Comp: 1->"+(a+1)+" melhor: "+(melhorIndice+1)+" --> ");
				//saida+="require(pgirmess);";
				sets=(sets.substring(0,sets.length()-1));
				saida+="wilcox.test("+sets+",paired=TRUE);";
				//System.out.println(saida);
				execute(saida, melhorIndice+1);
				
			}
			System.out.println();
			
			
			

			
			//saida+="AR1<-cbind("+sets+");";
			//saida+="result<-friedman.test(AR1);";
			//saida+="m<-data.frame(result$statistic,result$p.value);";
			//saida+="pos_teste<-friedmanmc(AR1);";
			//saida+="print(pos_teste);";
			
			//System.out.println(saida);
			//execute(saida, combinacoes, melhorIndice+1);
			melhorIndice=-1;
			saida=sets="";
		}

		//	System.out.println(calcularMedia(dados)[i]);
		//System.out.println();
	}

	public static double[] calcularMedia(ArrayList<double[]> dados){
		double soma=0;
		double[] resultados= new double[dados.size()];
		for(int i=0;i<dados.size();i++){
			for(int j=0;j<dados.get(i).length;j++){
				soma+=dados.get(i)[j];
			}
			resultados[i]=soma/numExec;
			soma=0;
		}
		return resultados;
	}
}
