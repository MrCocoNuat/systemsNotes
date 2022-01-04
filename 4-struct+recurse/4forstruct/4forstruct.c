struct st{
  long a;
  long b[10];
  long c[10];
};

void f(struct st *s){
  long i;
  for(i = 0; i < 10; i++){
    s->b[i] = s->c[i];
  }
}
