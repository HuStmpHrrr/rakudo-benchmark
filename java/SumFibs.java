import java.util.ArrayList;
import java.util.Arrays;

public class SumFibs {
    public static ArrayList<Long> fibs() {
        ArrayList<Long> ret = new ArrayList<>(Arrays.asList(1L, 1L));
        int i = 0;
        while (true) {
            long s = ret.get(i) + ret.get(i+1);
            if (s > 4000000) break;
            ret.add(s);
            i++;
        }

        return ret;
    }
   
    public static long sum_them(Iterable<Long> fibs) {
        long sum = 0;
        for(Long fib: fibs)
            if (fib % 2 == 0)
                sum += fib;
        return sum;
    }

    public static void main(String[] args) {
        long begin = System.nanoTime();
        for (int i = 0; i < 5000000; i++)
            sum_them(fibs());
        long est = System.nanoTime() - begin;

        System.out.println(String.format("sum fibs: %.4f seconds / 5000000.", (double)est / 1000_000_000));
    }
}
