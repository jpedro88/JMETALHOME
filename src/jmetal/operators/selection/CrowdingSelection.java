//  BinaryTournament.java
//
//  Author:
//       Antonio J. Nebro <antonio@lcc.uma.es>
//       Juan J. Durillo <durillo@lcc.uma.es>
//
//  Copyright (c) 2011 Antonio J. Nebro, Juan J. Durillo
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

package jmetal.operators.selection;

import jmetal.core.Solution;
import jmetal.core.SolutionSet;
import jmetal.util.JMException;
import jmetal.util.PseudoRandom;
import jmetal.util.comparators.DominanceComparator;
import jmetal.util.comparators.CrowdingDistanceComparator;

import java.util.Comparator;
import java.util.HashMap;






/**
 * This class implements an binary tournament selection operator
 */
public class CrowdingSelection extends Selection {

    /**
     * Stores the <code>Comparator</code> used to compare two
     * solutions
     */
    private Comparator comparator_;

    /**
     * Constructor
     * Creates a new Binary tournament operator using a BinaryTournamentComparator
     */
    public CrowdingSelection(HashMap<String, Object> parameters){
        super(parameters) ;

        //comparator_ = new DominanceComparator();
        comparator_  = new CrowdingDistanceComparator();

    } // BinaryTournament

    /**
     * Performs the operation
     * @param object Object representing a SolutionSet
     * @return the selected solution
     */

    //verificar
    public Object execute(Object object){
        int pos1=0,pos2=0;
        SolutionSet solutionSet = (SolutionSet) object;
        SolutionSet population = (SolutionSet) object;
        Solution solution1, solution2, solution3, solution4;
        solution1 = solutionSet.get(PseudoRandom.randInt(0,solutionSet.size()-1));
        solution2 = solutionSet.get(PseudoRandom.randInt(0,solutionSet.size()-1));
        solution3 = solutionSet.get(PseudoRandom.randInt(0,solutionSet.size()-1));
        solution4 = solutionSet.get(PseudoRandom.randInt(0,solutionSet.size()-1));
        comparator_ = new DominanceComparator();

        Solution[] parents = new Solution[2];
        parents[0] = population.get(pos1);
        parents[1] = population.get(pos2);

        parents[0].setCrowdingDistance(solution1.getCrowdingDistance());
        parents[1].setCrowdingDistance(solution2.getCrowdingDistance());


        return parents;
    } // execute

    @Override
    public Object execute(Object object, double delta) throws JMException {
        // TODO Auto-generated method stub
        return null;
    }
} // BinaryTournament
