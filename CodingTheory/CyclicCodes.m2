 
cyclicCode = method (TypicalValue => LinearCode) 

cyclicCode(RingElement, ZZ) := LinearCode => (G,n) -> (
    
    --Constructor for Cyclic Codes generated by a polynomial.
    -- input: The generating polynomial and the lenght of the code
    --outputs: a cyclic code defined by the initial polynomial .
    
    -- We should make a list of the coefficients of the polynomial. 
    ring G;
    x:=(gens ring G)#0;
    f := x^n-1;
    t:=quotientRemainder(G,f);
    g:=t#1;
    l:=toList apply(0.. (n-1),i->first flatten entries sub(matrix{{g//x^i}},x=>0));
    -- Generate the generating matrix using the funtion cyclicMatrix 
         L=toList apply(toList(0..n-1), i -> apply(toList(0..n-1),j -> l_((j-i)%n)));
    return linearCode(coefficientRing (ring G),L)
          )
