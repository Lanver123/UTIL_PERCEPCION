#!/usr/bin/octave -qf

function[] = kernelperceptron(trset,clases)

  if (nargin!=2)
    printf("Usage: kernelperceptron.m(trset, clases)\n");
    printf("Donde trset contiene una muestra (x,y) en cada fila");
    return;
  endif
  
  trset
  
  # Cálculo de Gramm
  gramm = zeros(rows(trset), rows(trset));
  for i=1:rows(trset)
    for j=1:(rows(trset)-i+1)
      # Distancia de Hamming, solo si la piden
      igu = (trset(i,:) == trset(j,:));
      dxy = sum(ones(1,2) - igu);
      # Valor para K = 1 / (dxy + 1)
      gramm(i,j) = 1/(dxy+1);
      
      # Valor para K = exp(x'y)
      # gramm(i,j) = e^(trset(j,:)*trset(i,:)');
      
      # Valor para K = ???
      # examen
      
      gramm(j,i) = gramm(i,j);
    endfor
  endfor
  
  kernelperceptron(gramm,clases,1)
  
endfunction