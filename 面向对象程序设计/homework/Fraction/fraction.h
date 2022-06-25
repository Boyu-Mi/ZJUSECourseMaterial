#ifndef _FRACTION_H
#define _FRACTION_H
#include <iostream>
#include <string>
#include <cstdlib>
#include <cmath>
using namespace std;
class fraction{
private:
    int denominator;
    int numerator;
    int GreatCommonDivisor(int n, int d);
    void Simplify();
public:
    fraction();//default Ctor
    fraction(int numerator, int denominator = 1);//Ctor
    fraction(const fraction & f);// copy Ctor
    //    conversion from a finite decimal string like: 1.414
    fraction(string decimal);
    //    inserter and extractor for streams
    friend ostream& operator<<(ostream &out, const fraction& f){
        if(f.numerator == 0)
            out << "0";
        else {
            if(f.numerator < 0 && f.denominator > 0 || f.numerator > 0 && f.denominator < 0)
                out << "-";
            if(f.denominator == 1)
                out << abs(f.numerator);
            else
                out << abs(f.numerator) << " / " << abs(f.denominator);
        }

        return out;
    }
    friend istream& operator>>(istream &in, fraction& f){
        in >> f.numerator >> f.denominator;
        f.Simplify();
        return in;
    }
    //    arithmetical operators: + - * /
    fraction operator+(const fraction& f) const;
    fraction operator-(const fraction& f) const;
    fraction operator*(const fraction& f) const;
    fraction operator/(const fraction& f) const;

    //    relational operators: < <= == != >= >
    bool operator<(const fraction& f) const;
    bool operator>(const fraction& f) const;
    bool operator==(const fraction& f) const;
    bool operator<=(const fraction& f) const;
    bool operator>=(const fraction& f) const;
    bool operator!=(const fraction& f) const;

    //    type cast to double
    operator double ();
    //    to string
    string fraction_to_string();
};
#endif
