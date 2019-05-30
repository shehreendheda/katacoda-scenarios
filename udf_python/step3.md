The last step in creating **checksumsq()** is to add a conditional to check whether the sum is even or odd. We can use the modulus `%` of the sum and 2, which is the remainder of the sum divided by 2 `s%2`, to do this. If the sum is even, the modulus is zero. If the sum is odd, the modulus is not zero.

The conditional statement below checks if the modulus is zero.


```
if s%2 == 0:
    print("The sum of squares is even.")
else:
    print("The sum of squares is odd.")
```


Adding the conditional statement, completes the **checksumsq()** function.


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


## Task

Define a new function **checksumsq3()** that checks if the sum of squares of integers in a list is a multiple of 3. The function should _return_ "The sum of squares is a mutiple of 3." or should be _return_ "The sum of squares is not a multiple of 3." 

Use **checksumsq3()** to check if the sum of squares of 38, 94, and 113 is a multiple of 3 and store the output in the variable **mysumsq3**.

Click the code below to check if your answer is correct.

```
from tasks import step3task
step3task(mysumsq3)
```{{execute}}

If you have the correct answer, click **Continue**.
