Now let’s replace each element with the square of each element to get the sum of the squares of the elements.

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


You can test out the sum of squares of other list arguments as well. When you are finished, click Continue.
