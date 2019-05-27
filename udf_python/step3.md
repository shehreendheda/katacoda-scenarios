In the last step, we need add a conditional to check whether the sum is even or odd. We can use the modulus of the sum and 2 to do this. The modulus is the remainder of the sum divided by 2 `s%2=0`. If the modulus is zero, then the sum is even. If the modulus is not zero, then the sum is odd.


This is represented by the code snippet:


```
if s%2 == 0:
    print("The sum of squares is even.")
else:
    print("The sum of squares is odd.")
```


Adding the conditional to the function,


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


You can test out the sum of squares of other list arguments as well. When you are finished, click Continue.
