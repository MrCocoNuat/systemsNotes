long g(long y);

long f(long x){
  x = g(x+2);
  return x;
}

long g(long y){
  return 2*y;
}
