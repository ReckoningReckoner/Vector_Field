class Charge
{
  private float pos[] = new float[2];
  private float q;
  private float radius = 10;

  public Charge(float x, float y, float q)
  {
    this.pos[0] = x;
    this.pos[1] = y;
    this.q = q;
  }

  public void alternate_charge()
  {
    q *= -1;
  }

  public void set_pos(float x, float y)
  {
    pos[0] = x;
    pos[1] = y;
  }

  public void display()
  {
    noStroke();
    if (q > 0)
      fill(#D31A26);
    else
      fill(#090FAA);

    ellipse(pos[0], pos[1], radius, radius);
  }

  private float get_e_mag(float x, float y)
  {
    float r = (float)(Math.sqrt((Math.pow(pos[0] - x, 2) + Math.pow(pos[1] - y, 2))));
    return q / (float)Math.pow(r, 2);
  }

  public float[] get_e_vector(float x, float y)
  {
    float e[] = new float[2];
    float mag = get_e_mag(x, y);
    e[0] = mag*(pos[0] - x);
    e[1] = mag*(pos[1] - y);

    return e;
  }

  public float[] get_pos()
  {
    float[] copy = {pos[0], pos[1]};
    return copy;
  }

  public float get_radius()
  {
    return radius;
  }

  public float get_q()
  {
    return q;
  }
}