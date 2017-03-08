// Runnable Lambda
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
    Runnable r2 = () -> System.out.println("Hello world two!");

    // Testing
    r1.run();
    r2.run();
  }
}
