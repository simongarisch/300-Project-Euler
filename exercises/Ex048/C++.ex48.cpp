/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

#include <iostream>

#define START 1
#define STOP 1000

long powerof(int n);

using namespace std;


int main(){
  long totsum = 0;
  for(int i=START; i<=STOP; i++){
    totsum = (totsum + powerof(i)) % (long)1e10;
  }
  cout << totsum << endl;  // 9,110,846,700
  return 0;
}


long powerof(int n){
  // fetch the last digits from the result n^n
  long result = n;
  for(int i=2; i<=n; i++){
    result = result * n;
    // only keep the last digits
    result = result % (long)1e10;
  }
  return result;
}
