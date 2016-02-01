import java.lang.Math;
import java.util.ArrayList;

class Vector 
{

  public static float[] null_vector()
  {
    return new float[2];
  }

  //returns magnitude of a vector
  public static float magnitude(float[] vec)
  {
    return (float) (Math.sqrt(Math.pow(vec[0], 2) + Math.pow(vec[1], 2))) ;
  }

  // modifies current vector to unit vector
  public static void to_unit(float vec[])
  {
    float mag = magnitude(vec);
    vec[0] /= mag;
    vec[1] /= mag;
  }

  public static void add(float vec1[], float vec2[])
  {
    vec1[0] += vec2[0];
    vec1[1] += vec2[1];
  }
  
}