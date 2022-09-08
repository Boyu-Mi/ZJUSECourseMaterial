public enum Planet{
    MERCURY (3.303e+23, 2.4397e6),
    VENUS   (4.869e+24, 6.0518e6),
    EARTH   (5.976e+24, 6.37814e6);
    private final double mass;
    private final double radius;
    Planet (double mass, double radius){
        this.mass = mass;
        this.radius = radius;
    }
    public static final double G = 6.67300E-11;
    public double surfaceGravity() {
        return G * mass / (radius * radius);
    }
    public double surfaceWeight(double otherMass){
        return otherMass * surfaceGravity();
    }
    public static void main(String []args){
        double earthWeight = 70.0;
        double mass = earthWeight/EARTH.surfaceGravity();
        for(Planet p : Planet.values()){
            System.out.printf("Your weight on %s is %f%n",
                                p, p.surfaceWeight(mass));
        }
    }
}