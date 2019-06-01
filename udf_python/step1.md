Before we begin, click `python`{{execute}} to start the python shell.


To create **checksumsq()**, let’s first start by defining our version of the built-in sum() function that returns a sum of the integers in a list.


```
def checksumsq(int_list):
    return s;
```


Because the expected argument is list, we will include an iterator in the code block.


```for x in int_list:```


Our function now looks like


```
def checksumsq(int_list):
    for x in int_list:
    return s;
```


To calculate the sum of all elements in `int_list`, each element `x` is added to the sum `s` of the prior elements. We can start with a sum of zero `s=0` and, in the for loop, add each element `x` to that sum `s+=x`. Adding that to the code block, the sum() function is now complete.


```
def checksumsq(int_list):
    s = 0
    for x in int_list:
        s += x
    return s;
```


Click the function below, then click in the terminal and press Enter to define the function.

```
def checksumsq(int_list):
    s = 0
    for x in int_list:
        s += x
    return s;
```{{execute}}


Now that the function is defined, let's test that it works.


Click `checksumsq([3,4,10])`{{execute}}. The output should be 17.

## Task
Use the **checksumsq()** function you just created to calculate the sum of 14, 7, 17, and 5 and store that sum in the variable **mysum**.

Click the code below to check if your answer is correct.

```
from tasks import step1task
step1task(mysum)
```{{execute}}

If you have the correct answer, click **Continue**.
