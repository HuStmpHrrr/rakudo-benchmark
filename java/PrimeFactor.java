import java.util.*;

public class PrimeFactor {
	public static class Candidates implements Iterable<Long> {
		public Iterator<Long> iterator() {
			return new CIterator();
		}

		public class CIterator implements Iterator<Long> {
			private boolean first = true;
			private long val = 3L;

			public boolean hasNext() { return true; }

			public Long next() {
				if (first) {
					first = false;
					return 2L;
				}
				long v = val;
				val += 2;
				return v;
			}

			public void remove() { throw new UnsupportedOperationException(); }
		}
	}

	public static long lpf(long n) {
		for(Long i: new Candidates())
			while (n % i == 0) {
				n /= i;
				if (i > n) return i;
			}
		return -1L;
	}

	public static void main(String[] args) {
        long begin = System.nanoTime();
        for (int i = 0; i < 50000; i++)
            lpf(600851475143L);
        long est = System.nanoTime() - begin;

        System.out.println(String.format("prime factor: %.4f seconds / 50000.", (double)est / 1000_000_000));
	}
}
