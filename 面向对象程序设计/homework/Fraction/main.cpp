#include "fraction.h"
using namespace std;
int main(){
    //test Ctor and inserter and extractor for streams
    fraction f1 = fraction(12);
    fraction f2 = fraction(5,3);
    fraction f3;
    fraction f4 = f2;
    fraction f5 = fraction("14.14");

    cout << f1 << " is constructed from 12" << endl;
    cout << f2 << " is constructed from 5, 3" << endl;
    cout << f3 << " is constructed from default constructor" << endl;
    cout << f4 << " is constructed from f2" << endl;
    cout << f5 << " is constructed from '14.14'" << endl;
    cout << "please input 2 numbers to construct a fraction" << endl;
    cin >> f3;
    cout << f3 << " is constructed from stdin" << endl;

    //test conversion to string and double
    cout << f1 << " " << f1.fraction_to_string() << " " << double(f1) << endl;
    cout << f2 << " " << f2.fraction_to_string() << " " << double(f2) <<endl;

    //test arithmetical operators
    cout << "f3 is " << f3 << endl;
    cout << "f4 is " << f4 << endl;
    cout << "f3 + f4 = " << f3 + f4 << endl;
    cout << "f3 - f4 = " << f3 - f4 << endl;
    cout << "f3 * f4 = " << f3 * f4 << endl;
    cout << "f3 / f4 = " << f3 / f4 << endl;

    //test relational operators: < <= == != >= >
    fraction f6(6,3);
    fraction f7(8,4);
    cout << "f6 is " << f6 << endl;
    cout << "f7 is " << f7 << endl;
    cout << "the result of f6 == f7 is " << (f6 == f7) << endl;
    cout << "the result of f6 != f7 is " << (f6 != f7) << endl;
    f6 = f6 + fraction("0.01");
    cout << "f6 is " << f6 << endl;
    cout << "the result of f6 > f7 is " << (f6 > f7) << endl;
    cout << "the result of f6 >= f7 is " << (f6 >= f7) << endl;
    cout << "the result of f6 < f7 is " << (f6 < f7) << endl;
    cout << "the result of f6 <= f7 is " << (f6 <= f7) << endl;
}
