import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

class Solution {
    public int solution(int[] number) {
        int answer = 0;

        List<Integer> list = Arrays.stream(number).boxed().collect(Collectors.toList());
        List<Set<Integer>> list2 = new ArrayList<>();

        for(int i = 0; i < list.size(); i++){
            for(int j = 0; j < list.size(); j++){
                if(i==j){continue;}
                int temp = list.get(i) + list.get(j);

                List<Integer> tempList = getIndex(list, -temp);
                for(int ii = 0; ii < tempList.size(); ii++) {
                    int result = tempList.get(ii);
                    
                    if(result!=-1&&result!=i&&result!=j){
                        Set<Integer> set = new HashSet<>();
                        set.add(i);
                        set.add(j);
                        set.add(result);
                        if(check(list2, set)) {
                            list2.add(set);
                            answer++;
                        }
                    }
                }
            }
        }

        System.out.println(list2);
        return answer;
    }
    private List<Integer> getIndex(List<Integer> list, int n) {
        List<Integer> result = new ArrayList<>();
        for(int m : list) {
            if(m==n) {
                result.add(m);
            }
        }
        
        return result;
    }

    private boolean check(List<Set<Integer>> list2, Set<Integer> set) {

        for(Set<Integer> s : list2) {
            if(set.equals(s))return false;
        }

        return true;
    }

}