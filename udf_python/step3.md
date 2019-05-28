The last step is to add a conditional to check whether the sum is even or odd. We can use the modulus `%` of the sum and 2, which is the remainder of the sum divided by 2 `s%2`, to do this. If the sum is even, the modulus is zero. If the sum is odd, the modulus is not zero.

The conditional statement below checks if the modulus is zero.


```
if s%2 == 0:
    print("The sum of squares is even.")
else:
    print("The sum of squares is odd.")
```


Adding the conditional statement, completes the function.


```
def checksumsq(int_list):
    s=0
    for x in int_list:
        s+=x**2
    if s%2 == 0:
        print("The sum of squares is even.")
    else:
        print("The sum of squares is odd.")
    return s;
```

Click the function below, then click in the terminal and click enter to define the function.

```
def checksumsq(int_list):
    s=0
    for x in int_list:
        s+=x**2
    if s%2 == 0:
        print("The sum of squares is even.")
    else:
        print("The sum of squares is odd.")
    return s;
```{{execute}}


Now that the function is defined, let's test that it works.


Click `checksumsq([3,4,10])`{{execute}}. The output should be "The sum of squares is odd."


You can try using the function to check the sum of squares of other integer lists. When you are finished, click **Continue**.
