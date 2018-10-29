```R
## for迴圈
# Create a 30 x 30 matrix (of 30 rows and 30 columns)
mymat <- matrix(nrow=30, ncol=30)

# For each row and for each column, assign values based on position: product of two indexes
for(i in 1:dim(mymat)[1]) {
  for(j in 1:dim(mymat)[2]) {
    mymat[i,j] = i*j
  }
}

# Just show the upper left 10x10 chunk
mymat[1:10, 1:10]

## while迴圈
x=0
while (x<10) {
  x = x+1 
  print(x)
  if(x==5)
  print("next")
}
```
