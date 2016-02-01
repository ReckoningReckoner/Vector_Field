// finds the vector sum of any point in a field given all other charges
class Sum_Field
{

  public float[] get_vector_sum(ArrayList<Charge> charges, float x, float y)
  {
    float vec_sum[] = Vector.null_vector();

    for (Charge c : charges)
    {
      float v[] = c.get_e_vector(x, y);
      Vector.add(vec_sum, v);
    }

    Vector.to_unit(vec_sum);

    return vec_sum;
  }
}