long count(unsigned long x){ //how many 1 bits in x?
  long ans = 0;
 loop:
  ans += x & 0x1;
  x >>= 1;
  if (x)
    goto loop;
  return ans;
}
