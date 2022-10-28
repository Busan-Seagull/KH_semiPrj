import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Solution {
    public int solution(int[] ingredient) {
        int answer = 0;
        
        int[] temp = {1,2,3,4};
        List<Integer> templist = Arrays.stream(temp).boxed().collect(Collectors.toList());
        
        List<Integer> list = Arrays.stream(ingredient).boxed().collect(Collectors.toList());
        while(true){
            int[] arr = getOne(list);
            if(arr!=null) {
                answer++;
                for(int i = arr[0]; i <= arr[1]; i++) {
                    list.remove(templist);
                }
            }else {
                break;
            }
        }
        
        return answer;
    }
    
    private int[] getOne(List<Integer> arr) {
        
        int count = 1;
        int start = 0;
        int end = 0;
        
        int[] result = null;
        
        for(int i = 0; i < arr.size(); i++) {
            int n = arr.get(i);
            if(n==1) {
                if(count==3) {
                    end = i;
                    
                    result = new int[] {start, end};
                    
                    return result;
                }
                start = i;                    
            }
            
            if(n==count) {
                count++;
            }else {
                count = 1;
            }
        }
        
        return result;
    }
}