#!/usr/bin/octave -qf

function[] = kernelperceptron(gramm,clases,iteraciones)

  if (nargin!=3)
    printf("Usage: kernelperceptron.m(gramm, clases, iteraciones)\n");
    return;
  endif
  
  gramm
  clases
  
  disp("Pesos iniciales:");
  alphas = zeros(1, rows(gramm));
  disp(alphas);
  printf("\n");
  
  #g(x)=sum_1_n(alphai*ci*K(xi,x)+alphai*ci)
  
  for iter=1:iteraciones
    printf("----------------------------------\nIteración %i\n\n", iter);
  
    for i=1:rows(gramm)
      aux = 0;
      for j=1:rows(gramm)
        if (i != j)
          val1 = alphas(1,j)*clases(1,j)*gramm(i,j);
          val2 = alphas(1,j)*clases(1,j);
          if (val1 != 0 && val2 != 0)
             printf("a%i*c%i*K(x%i,x%i) + a%i*c%i = %d + %d\n",j,j,j,i,j,j,val1,val2);
          endif
          aux = aux + val1 + val2;
        endif
      endfor
      if (clases(1,i) * aux <= 0)
        alphas(1,i) = alphas(1,i) + 1;
      endif
      printf("Valor de g(x): %d\n",aux);
      printf("Valor de cig(x): %d\n",clases(1,i) * aux);
      printf("Pesos tras analizar x%i\n",i);
      disp(alphas);
      printf("\n");
    endfor
   
  endfor
  
endfunction