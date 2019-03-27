
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
# there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p <= 1000, is the number of solutions maximised?

library(hash)
# An integer triangle or integral triangle is a triangle all of whose
# sides have lengths that are integers.
# Right angled triangles must satisfy a^2 + b^2 == c^2
# Looks like they are also want a < b < c

perimeters <- hash()
for(a in 1:1000){
  for(b in (a+1):(1000-a)){
    for(c in (b+1):(1000-a-b)){
      if(a^2 + b^2 == c^2){  # right angled triangle
        perimeter <- as.character(a + b + c)
        count = perimeters[[perimeter]]
        if(is.null(count)){
          perimeters[[perimeter]] <- 1
        }else{
          perimeters[[perimeter]] <- count + 1
        }
      }
    }
  }
}

maxp <- 0
maxn <- 0
for(k in keys(perimeters)){
  v <- perimeters[[k]]
  if(v > maxn){
    maxn <- v
    maxp <- as.numeric(k)
  }
}

print(maxp)  # 840
