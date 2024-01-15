import java.math.BigInteger;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BigInteger a = new BigInteger(scanner.next());
        BigInteger b = new BigInteger(scanner.next());

        BigInteger result = gcd(a, b);
        System.out.println(result);
    }

    public static BigInteger gcd(BigInteger a, BigInteger b) {
        if (b.equals(BigInteger.ZERO)) {
            return a;
        } else {
            return gcd(b, a.remainder(b));
        }
    }
    public static long gcd(long a , long b){
        if( b == 0)
            return a;
        else
            return gcd(b,a % b);
    }



    public static double sqrt(double x){
        return sqrtIteration(1,x);
    }

    public static double sqrtIteration(double guess , double x){
        double improveGuess = improve(guess,x);
        if(goodEnough(guess , improveGuess))
            return guess;
        else
            return sqrtIteration(improveGuess,x);
    }

    public static boolean goodEnough(double guess , double improveGuess){
        return  (Math.abs(improveGuess - guess)/guess < 0.00000000001);
    }
    public static double improve(double guess , double x){
        return average(guess,(x/guess));
    }

    public static double average(double x , double y){
        return (x+y)/2;
    }

}