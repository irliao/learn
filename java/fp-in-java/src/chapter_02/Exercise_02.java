package chapter_02;

class Exercise_02 {
  // same as importing Function from Java lib
  interface Function<T, U> {
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

  // Exercise_02 2.1 - write compose method by using the 2 functions above
  static Function<Integer, Integer> compose(final Function<Integer, Integer> f1,
                                            final Function<Integer, Integer> f2) {
    return new Function<Integer, Integer>() {
      @Override
      public Integer apply(Integer arg) { // arg type is inferred by T
        return f1.apply(f2.apply(arg)); // return type is inferred by U
      }
    };
  }

  // Exercise_02 2.2 - write compose method using lambdas
  static Function<Integer, Integer> compose1(final Function<Integer, Integer> f1,
                                             final Function<Integer, Integer> f2) {
    // arg's type is inferred by T, where the return type is inferred by U
    return arg -> f1.apply(f2.apply(arg));
  }

  // Exercise_02 2.3 - write a function to add 2 integers
  // <Integer, <Integer, Integer>> == Integer -> (Integer -> Integer) == Integer -> Integer -> Integer
  static Function<Integer, Function<Integer, Integer>> add = x -> y -> x + y;

  // using inheritance to extend it with shorter identifier
  interface BinaryOperator extends Function<Integer, Function<Integer, Integer>> {}
  static BinaryOperator add1 = x -> y -> x + y;
  static BinaryOperator mult = x -> y -> x * y;

  // Exercise_02 2.4 - write a function to compose square and triple
  // ((Integer -> Integer) -> ((Integer -> Integer) -> (Integer -> Integer)))
  // (x, (y, z))
  static Function<Function<Integer, Integer>, // (x
           Function<Function<Integer, Integer>, // (y
                    Function<Integer, Integer>>>  // z))
      compose2 = x -> y -> z -> x.apply(y.apply(z));

  public static void main(String... args) {
    System.out.println(compose(triple, square).apply(3)); // 27
    System.out.println(compose1(triple, square).apply(3)); // 27

    System.out.println(add.apply(1).apply(2)); // 3
    System.out.println(add1.apply(1).apply(2)); // 3

    // apply from right/inner to left/outer call
    System.out.println(compose2.apply(square).apply(triple).apply(2)); // 36

  }
}
