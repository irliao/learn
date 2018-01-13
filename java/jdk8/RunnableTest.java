// Runnable Lambda

// Lambda expressions follows this format: (args) -> return
// (int x, int y) -> x + y
// () -> 42
// (String s) -> { System.out.println(s); }

public class RunnableTest {
  public static void main(String[] args) {
    System.out.println("=== RunnableTest ===");

    // Anonymous Runnable
    Runnable r1 = new Runnable() {
      @Override
      public void run() {
        System.out.println("Hello world one!");
      }
    };

    // Lambda Runnnable
    // like case above, no parameters is passed and returned
    Runnable r2 = () -> System.out.println("Hello world two!");

    // Testing
    r1.run();
    r2.run();
  }
}
