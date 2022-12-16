import android.os.Build;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class Main {
  private static void patch() {
    try {
      Field modifiersField = Field.class.getDeclaredField("modifiers");
      modifiersField.setAccessible(true);

      Field sdkIntField = Build.VERSION.class.getDeclaredField("SDK_INT");
      sdkIntField.setAccessible(true);

      modifiersField.setInt(sdkIntField, sdkIntField.getModifiers() & ~Modifier.FINAL);
      sdkIntField.set(Build.VERSION.SDK_INT, 16);
    }
    catch(Exception e) {
      System.out.println("Error: " + e.getMessage());
    }
  }

  public static void main(String args[]) {
    patch();

    System.out.println("running Android SDK: " + Build.VERSION.SDK_INT);
  }
}
