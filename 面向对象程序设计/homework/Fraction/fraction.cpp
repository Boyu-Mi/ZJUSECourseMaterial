#include "fraction.h"
fraction::fraction(): numerator(0), denominator(1) {}
fraction::fraction(int numerator, int denominator) {
    if(denominator == 0){
        cout << "the denominator cannot be 0!" << endl;
        this->numerator = numerator;
        this->denominator = 1;
    }
    else{
        this->numerator = numerator;
        this->denominator = denominator;
    }
    this->Simplify();
}

fraction::fraction(const fraction & f) : numerator(f.numerator), denominator(f.denominator){}

fraction::fraction(string decimal) {
    int len = decimal.size();
    int dot_pos = decimal.find(".");
    if(dot_pos == decimal.npos)// an integer
        dot_pos = -1;
    decimal.erase(dot_pos, 1);
    numerator = atof(decimal.c_str());
    // the denominator is pow(10, len - dot_pos - 1)
    int fac = 1;
    for(int i = 0; i < len - dot_pos - 1; i++){
        fac *= 10;
    }
    denominator = fac;
    if(decimal[0] == '-'){
        this->numerator = -numerator;
    }
    this->Simplify();
}

int fraction::GreatCommonDivisor(int n, int d) {
    if(n < 0)
        n = -n;
    if(d < 0)
        d = -d;
    if(n > d)
        return GreatCommonDivisor(d, n);
    if(d % n == 0)
        return n;
    return GreatCommonDivisor(d % n, n);
}

void fraction::Simplify() {
    int gcd = GreatCommonDivisor(numerator, denominator);
    if(gcd > 1) {
        numerator /= gcd;
        denominator /= gcd;
    }
}

fraction fraction::operator+(const fraction& f) const{
    return fraction(numerator * f.denominator + f.numerator * denominator, denominator * f.denominator);
}
fraction fraction::operator-(const fraction& f) const{
    return fraction(numerator * f.denominator - f.numerator * denominator, denominator * f.denominator);
}
fraction fraction::operator*(const fraction& f) const{
    return fraction(numerator * f.numerator, denominator * f.denominator);
}
fraction fraction::operator/(const fraction& f) const{
    return fraction(numerator * f.denominator, denominator * f.numerator);
}
bool fraction::operator<(const fraction& f) const{
    return (numerator * f.denominator - f.numerator * denominator) * (denominator * f.denominator) < 0;
}
bool fraction::operator>(const fraction& f) const{
    return !((*this < f) || (*this == f));
}
bool fraction::operator>=(const fraction& f) const{
    return !(*this < f);
}
bool fraction::operator<=(const fraction& f) const{
    return !(*this > f);
}
bool fraction::operator==(const fraction& f) const{
    return (numerator * f.denominator == f.numerator * denominator);
}
bool fraction::operator!=(const fraction& f) const{
    return !(*this == f);
}

fraction::operator double () {
    return double(numerator) / double(denominator);
}

string fraction::fraction_to_string(){
    if(numerator == 0)
        return "0";
    string sym = "";
    if(numerator < 0 && denominator > 0 || numerator > 0 && denominator < 0)
        sym += "-";
    if(denominator == 1)
        return sym + to_string(abs(numerator));
    else
        return sym + to_string(abs(numerator)) + "/" + to_string(abs(denominator));
}