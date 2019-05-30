Now let’s replace each element `x` with the square of each element `x**2` to get the sum of the squares of the elements.

```
 def checksumsq(int_list):
     s = 0
     for x in int_list:
         s += x**2
     return s;
```

Click the function below, then click in the terminal and click enter to define the function.

```
def checksumsq(int_list):
    s = 0
    for x in int_list:
        s += x**2
    return s;
```{{execute}}


Now that the function is defined, let's test that it works.

Click `checksumsq([3,4,10])`{{execute}}. The output should be 125.

## Task

In the terminal, define a function **sumcube()** that calculates the sum of cubes of integers in a list (instead of the sum of squares). 

Use **sumcube()** to calculate the sum of cubes of 13, 27, and 9 and store the sum in the variable **mysumcube**.

Click the code below to check if your answer is correct.

```
from tasks import step2task
step2task(mysumcube)
```{{execute}}

If you have the correct answer, click **Continue**.
