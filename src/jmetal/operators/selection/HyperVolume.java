//  HyperVolume.java
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
public class HyperVolume extends Selection {

    /**
     * Stores the <code>Comparator</code> used to compare two
     * solutions
     */
    private Comparator comparator_;

    /**
     * Constructor
     * Creates a new Binary tournament operator using a BinaryTournamentComparator
     */
    public HyperVolume(HashMap<String, Object> parameters){
        super(parameters) ;

        //comparator_ = new DominanceComparator();
        comparator_  = new CrowdingDistanceComparator();

    } // HiperVolume

    /**
     * Performs the operation
     * @param object Object representing a SolutionSet
     * @return the selected solution
     */

    //verificar
    public Object execute(Object object) {
        SolutionSet solutionSet = (SolutionSet) object;
        Solution[] parents = new Solution[2];

        for (int i = 0; i < 2; i++) {
            int index1 = PseudoRandom.randInt(0, solutionSet.size() - 1);
            int index2 = PseudoRandom.randInt(0, solutionSet.size() - 1);

            Solution solution1 = solutionSet.get(index1);
            Solution solution2 = solutionSet.get(index2);

            // Pega a solução com maior distância de aglomeração
            if (solution1.getCrowdingDistance() > solution2.getCrowdingDistance()) {
                parents[i] = solution1;
            } else {
                parents[i] = solution2;
            }
        }

        return parents;
    } // execute


    @Override
    public Object execute(Object object, double delta) throws JMException {
        // TODO Auto-generated method stub
        return null;
    }
} // HiperVolume
