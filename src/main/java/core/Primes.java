package core;

/**
 * Вычисление простых чисел
 */
public class Primes {
    public static boolean isPrime(long n) {
        for (long i = 2; i * i <= n; i++) {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}
