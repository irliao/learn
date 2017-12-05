package chapter_02;

/**
 * Created by irliao on 12/4/17.
 */

class Exercise {
  // same as importing Function from Java lib
  public interface Function<T, U> {
    U apply(T arg);
  }

  // Function<T, U> returns a function that inputs T-type object and outputs U-type object
  static Function<Integer, Integer> triple = new Function<Integer, Integer>() {
    @Override
    public Integer apply(Integer arg) {
      return arg * 3;
    }
  };

  static Function<Integer, Integer> square = new Function<Integer, Integer>() {
    @Override
    public Integer apply(Integer arg) {
      return arg * arg;
    }
  };

  // Exercise 2.1 - write compose method by using the 2 functions above
  static Function<Integer, Integer> compose(final Function<Integer, Integer> f1,
                                            final Function<Integer, Integer> f2) {
    return new Function<Integer, Integer>() {
      @Override
      public Integer apply(Integer arg) { // arg type is inferred by T
        return f1.apply(f2.apply(arg)); // return type is inferred by U
      }
    };
  }

  // Exercise 2.2 - write compose method using lambdas
  static Function<Integer, Integer> compose1(final Function<Integer, Integer> f1,
                                             final Function<Integer, Integer> f2) {
    // arg's type is inferred by T, where the return type is inferred by U
    return arg -> f1.apply(f2.apply(arg));
  }

  // Exercise 2.3 - write a function to add 2 integers
  // <Integer, <Integer, Integer>> == Integer -> (Integer -> Integer) == Integer -> Integer -> Integer
  static Function<Integer, Function<Integer, Integer>> add = x -> y -> x + y;

  // using inheritance to extend it with shorter identifier
  public interface BinaryOperator extends
                       Function<Integer, Function<Integer, Integer>> {}
  BinaryOperator add1 = x -> y -> x + y;
  BinaryOperator mult = x -> y -> x * y;

  public static void main(String... args) {
    System.out.println(compose(triple, square).apply(3)); // 27
    System.out.println(compose1(triple, square).apply(3)); // 27
    System.out.println(add.apply(1).apply(2)); // 3
  }
}
