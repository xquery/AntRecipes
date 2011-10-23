<Q1>
  {
    for $n in distinct-values(
                  for $i in (//* | //@*)
                  return namespace-uri($i) 
               )
    return  <ns>{$n}</ns>
  }
</Q1>