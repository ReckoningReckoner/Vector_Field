
ArrayList<Charge> charges = new ArrayList<Charge>();
final float MAG = 5;
final float INCREMENT = 10;
boolean neg_charge;
Charge mouse_charge = new Charge(mouseX, mouseY, 1);

void setup()
{
  size(900, 900);
  charges.add(mouse_charge);
}

void draw()
{
  background(255);
  mouse_charge.set_pos(mouseX, mouseY);
  vector_field_lines();
  display_charges();
  display_text();
}

void mousePressed()
{
  float charge = 1;
  if (neg_charge) charge *= -1;

  charges.add( new Charge(mouseX, mouseY, charge));
}

void keyPressed()
{
  if (neg_charge)
    neg_charge = false;
  else
    neg_charge = true;

  mouse_charge.alternate_charge();
}


void vector_field_lines()
{
  for (float y = 0; y < height; y += INCREMENT)
  {
    for (float x = 0; x < width; x += INCREMENT)
    {

      float vec_sum[] = new Sum_Field().get_vector_sum(charges, x, y);
      stroke(0); 
      strokeWeight(1);
      line(x, y, x+MAG*vec_sum[0], y+MAG*vec_sum[1]);
    }
  }
}

void display_charges()
{
  for (Charge c : charges)
  {
    individual_field_lines(c);
    c.display();
  }
}

void individual_field_lines(Charge c)
{
  float line_to_charge_ratio = 8;//arbitrary value
  float q = abs( line_to_charge_ratio*c.get_q() );
  float radius = c.get_radius();
  float theta = (float)(2*Math.PI/q);
  float starting_points[][] = new float[(int)q][2];

  for (int i = 0; i < (int)q; i++)
  {
    float init[] = {(float)(radius*Math.cos(i*theta)), (float)(radius*Math.sin(i*theta))};
    float pos[] = c.get_pos();
    Vector.add(pos, init); 
    starting_points[i] = pos;
  }

  for (float[] s : starting_points)
    display_individual_field_lines(s, 0, c);
}


public void display_individual_field_lines(float pos[], int counter, Charge c)
{
  float mag = 1.5;

  for (int i = 0; i < width; i++)
  {

    for (Charge charge : charges)
    {
      float dist[] = {-pos[0], -pos[1]};
      Vector.add(dist, charge.get_pos());

      if (charge != c && Vector.magnitude(dist) < charge.get_radius())
        return; // helps speed things up
    }

    float vec_sum[] = new Sum_Field().get_vector_sum(charges, pos[0], pos[1]);

    if (c.get_q() > 0)
      for (int j = 0; j < 2; j ++)
        vec_sum[j] *= -1;

    stroke(#A109AA); 
    strokeWeight(2);
    point( pos[0], pos[1]);

    pos[0] += mag*vec_sum[0];
    pos[1] += mag*vec_sum[1];
  }
}


void display_text()
{
  if (neg_charge)
  {
    fill(#090FAA);
    text("negative", 10, 10);
  } else {
    fill(#D31A26);
    text("positive", 10, 10);
  }
}