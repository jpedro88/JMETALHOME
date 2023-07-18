package jmetal.metaheuristics.fdea;

import java.util.HashMap;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.io.*;

import jmetal.core.Algorithm;
import jmetal.core.Operator;
import jmetal.core.Problem;
import jmetal.core.Solution;
import jmetal.core.SolutionSet;
import jmetal.metaheuristics.thetadea.ThetaDEA;
import jmetal.operators.crossover.CrossoverFactory;
import jmetal.operators.mutation.MutationFactory;
import jmetal.operators.selection.SelectionFactory;
import jmetal.problems.Fonseca;
import jmetal.problems.Kursawe;
import jmetal.problems.ProblemFactory;
import jmetal.problems.Schaffer;
import jmetal.problems.DTLZ.DTLZ1;
import jmetal.problems.DTLZ.DTLZ2;
import jmetal.problems.DTLZ.DTLZ3;
import jmetal.problems.DTLZ.DTLZ31;
import jmetal.problems.DTLZ.DTLZ32;
import jmetal.problems.DTLZ.DTLZ33;
import jmetal.problems.DTLZ.DTLZ34;
import jmetal.problems.DTLZ.DTLZ35;
import jmetal.problems.DTLZ.DTLZ36;
import jmetal.problems.DTLZ.DTLZ37;
import jmetal.problems.DTLZ.DTLZ38;
import jmetal.problems.DTLZ.DTLZ4;
import jmetal.problems.DTLZ.DTLZ5;
import jmetal.problems.DTLZ.DTLZ6;
import jmetal.problems.DTLZ.DTLZ7;
import jmetal.problems.MaF.MaF1;
import jmetal.problems.MaF.MaF10;
import jmetal.problems.MaF.MaF11;
import jmetal.problems.MaF.MaF12;
import jmetal.problems.MaF.MaF13;
import jmetal.problems.MaF.MaF2;
import jmetal.problems.MaF.MaF3;
import jmetal.problems.MaF.MaF4;
import jmetal.problems.MaF.MaF5_Concave;
import jmetal.problems.MaF.MaF6;
import jmetal.problems.MaF.MaF7;
import jmetal.problems.MaF.MaF8;
import jmetal.problems.MaF.MaF9;
import jmetal.problems.WFG.WFG1;
import jmetal.problems.WFG.WFG2;
import jmetal.problems.WFG.WFG3;
import jmetal.problems.WFG.WFG4;
import jmetal.problems.WFG.WFG41;
import jmetal.problems.WFG.WFG42;
import jmetal.problems.WFG.WFG43;
import jmetal.problems.WFG.WFG44;
import jmetal.problems.WFG.WFG45;
import jmetal.problems.WFG.WFG46;
import jmetal.problems.WFG.WFG47;
import jmetal.problems.WFG.WFG48;
import jmetal.problems.WFG.WFG5;
import jmetal.problems.WFG.WFG6;
import jmetal.problems.WFG.WFG7;
import jmetal.problems.WFG.WFG8;
import jmetal.problems.WFG.WFG9;
import jmetal.problems.ZDT.ZDT1;
import jmetal.problems.ZDT.ZDT2;
import jmetal.problems.ZDT.ZDT3;
import jmetal.problems.ZDT.ZDT4;
import jmetal.problems.ZDT.ZDT6;
import jmetal.problems.cec2009Competition.UF1;
import jmetal.problems.cec2009Competition.UF2;
import jmetal.problems.cec2009Competition.UF3;
import jmetal.problems.cec2009Competition.UF4;
import jmetal.problems.cec2009Competition.UF5;
import jmetal.problems.cec2009Competition.UF6;
import jmetal.problems.cec2009Competition.UF7;
import jmetal.problems.cec2009Competition.UF8;
import jmetal.problems.cec2009Competition.UF9;
import jmetal.problems.mDTLZ.mDTLZ1;
import jmetal.problems.mDTLZ.mDTLZ2;
import jmetal.problems.mDTLZ.mDTLZ3;
import jmetal.problems.mDTLZ.mDTLZ4;
import jmetal.qualityIndicator.QualityIndicator;
import jmetal.qualityIndicator.fastHypervolume.wfg.wfghvCalculator1;
import jmetal.util.Configuration;
import jmetal.util.JMException;

import jmetal.operators.selection.BinaryTournament;



public class FDEA_main_3obj_modificado{
	public static Logger logger_; // Logger object
	public static FileHandler fileHandler_; // FileHandler object

	/**
	 * @param args
	 *            Command line arguments.
	 * @throws JMException
	 * @throws IOException
	 * @throws SecurityException
	 *             Usage: three options -
	 *             jmetal.metaheuristics.nsgaII.NSGAII_main -
	 *             jmetal.metaheuristics.nsgaII.NSGAII_main problemName -
	 *             jmetal.metaheuristics.nsgaII.NSGAII_main problemName
	 *             paretoFrontFile
	 */
	public static void printGD(String path,double[] GD){
		try {
			/* Open the file */
			FileOutputStream fos   = new FileOutputStream(path)     ;
			OutputStreamWriter osw = new OutputStreamWriter(fos)    ;
			BufferedWriter bw      = new BufferedWriter(osw)        ;
			for (int i = 0; i < GD.length; i++) {
				bw.write(GD[i]+" ");
				bw.newLine();
			}

			/* Close the file */
			bw.close();
		}catch (IOException e) {
			Configuration.logger_.severe("Error acceding to the file");
			e.printStackTrace();
		}
	} // printGD

	public static void main(String args[]) throws JMException, ClassNotFoundException, SecurityException, IOException{
		// Logger object and file to store log messages


		logger_ = Configuration.logger_;
		fileHandler_ = new FileHandler("NSGAIII_main.log");
		logger_.addHandler(fileHandler_);

		//	for(int fun=13;fun<=39;fun++){
		int runtimes=1;
		double[] IGDarray=new double[runtimes];
		double[] HVarray = new double[runtimes];
		long Execution_time=0;

		Problem problem = null; // The problem to solve
		Algorithm algorithm; // The algorithm to use
		Operator crossover; // Crossover operator\

		Operator mutation; // Mutation operator
		Operator selection; //Selection operator

		HashMap parameters; // Operator parameters

		Solution referencePoint;

		//QualityIndicator //indicators;// Object to get quality //indicators
		//	//indicators = null;


		if(args.length != 2){
			System.out.println( "usage: FDEA_main <problem, obj Number>" );
			System.exit(1);
		}else {
			int objectiveNumber = Integer.parseInt(args[1]);
			int WFGK=0;
			WFGK = 2*(objectiveNumber-1);

			if (args[0].equals("dtlz1")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				problem = new DTLZ1("Real", objectiveNumber+5-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz2")) {
				System.out.println("Entrou");
				problem = new DTLZ2("Real", objectiveNumber+5-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz3")) {
				System.out.println("Entrou");
				problem = new DTLZ3("Real", objectiveNumber+10-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz4")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				problem = new DTLZ4("Real", objectiveNumber+10-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz5")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				problem = new DTLZ5("Real", objectiveNumber+10-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz6")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				problem = new DTLZ6("Real", objectiveNumber+10-1, objectiveNumber);
			}
			else if (args[0].equals("dtlz7")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				problem = new DTLZ7("Real", objectiveNumber+20-1, objectiveNumber);
			}
			else if (args[0].equals("wfg1")) {
				//problem = new DTLZ1("Real",10,2);

				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG1("Real",WFGK,20,objectiveNumber);
			}
			else if (args[0].equals("wfg2")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG2("Real",WFGK,20,objectiveNumber);

			}
			else if (args[0].equals("wfg3")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG3("Real",WFGK,20,objectiveNumber);
			}
			else if (args[0].equals("wfg4")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG4("Real",WFGK,20, objectiveNumber);
			}
			else if (args[0].equals("wfg5")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG5("Real",WFGK,20, objectiveNumber);
			}
			else if (args[0].equals("wfg6")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG6("Real",WFGK,20,objectiveNumber);
			}
			else if (args[0].equals("wfg7")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG7("Real",WFGK,20,objectiveNumber);
			}
			else if (args[0].equals("wfg8")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG8("Real",WFGK,20,objectiveNumber);
			}
			else if (args[0].equals("wfg9")) {
				//problem = new DTLZ1("Real",10,2);
				System.out.println("Entrou");
				System.out.println("WFGK:"+WFGK);
				problem = new WFG9("Real",WFGK,20,objectiveNumber);
			}

		}

		algorithm = new FDEA(problem);



		//algorithm = new NHaEA_Max(problem);

		algorithm.setInputParameter("maxGenerations", 500);
		algorithm.setInputParameter("populationSize", 120);
		algorithm.setInputParameter("T", 12);
		algorithm.setInputParameter("div1", 14);
		algorithm.setInputParameter("div2", 0);

		// Mutation and Crossover for Real codification
		parameters = new HashMap();
		parameters.put("probability", 1.0);
		parameters.put("distributionIndex", 20.0);
		crossover = CrossoverFactory.getCrossoverOperator("SBXCrossover",
				parameters);



		parameters = new HashMap();
		parameters.put("probability", 1.0 / problem.getNumberOfVariables());
		parameters.put("distributionIndex", 20.0);
		mutation = MutationFactory.getMutationOperator("PolynomialMutation",
				parameters);

		parameters = null;

		/*Seleção*/


		selection = SelectionFactory.getSelectionOperator("RandomSelection",
				parameters);
//		selection = SelectionFactory.getSelectionOperator("BinaryTournament2",
//						parameters);






		// Add the operators to the algorithm
		algorithm.addOperator("crossover", crossover);
		algorithm.addOperator("mutation", mutation);
		algorithm.addOperator("selection", selection);
		var teste=10;
		for(int i=0;i<=teste;i++){
			long initTime = System.currentTimeMillis();
			SolutionSet population = algorithm.execute();
			Execution_time+=(System.currentTimeMillis() - initTime);
			population.printObjectivesToFile("FDEA_"+problem.getNumberOfObjectives()+"Obj_"+problem.getName()+"_run"+ (i+1)  + "Modificado.txt");
        /*if(fun>=29 && fun<=30){
			population.printVariablesToFile("NHaEA_Min_Variables_"+problem.getNumberOfObjectives()+"Obj_"+problem.getName()+"run_"+ (i+1)  + ".txt");
		}*/
			//IGDarray[i]=indicators.getIGD1(population);
			wfghvCalculator1 wfg = new wfghvCalculator1(population);
			HVarray[i] = wfg.calculatewfghv();
		}
		//printGD("FDEA_"+problem.getNumberOfObjectives()+"Obj_"+problem.getName()+"_IGD.txt",IGDarray);
		//printGD("FDEA_"+problem.getNumberOfObjectives()+"Obj_"+problem.getName()+"_HV.txt",HVarray);
		double sumIGD=0;
		double sumHV=0.0;
		for(int i=0;i<runtimes;i++){
			sumIGD+=IGDarray[i];
			sumHV+=HVarray[i];
		}
		logger_.info("Total execution time: " + Execution_time + "ms");
		System.out.println("avrIGD-fun= "+sumIGD/runtimes);
		System.out.println("avrHV-fun= "+sumHV/runtimes);
//	 }//for-fun
	}//main
}
