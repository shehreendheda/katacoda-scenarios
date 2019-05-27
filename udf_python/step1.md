Before we begin, click `python`{{execute}} to start the python shell.


Let’s first start by defining our version of the built-in sum function that will return a sum value.


```
def checksumsq(int_list):
    return s;
```


Because the expected arguments are lists, we will include an iterator in the code block.


```for x in int_list:```


So at this point, our function looks like


```
def checksumsq(int_list):
    for x in int_list:
    return s;
```


Now, to include the addition part of the code block, each element is added to the element after it. One approach is to start with a sum of zero and add each element (x) to that sum.


```
s=0
s+=x
```


Adding that to the code block, the function is now complete.


```
def checksumsq(int_list):
    s = 0
    for x in int_list:
        s += x
    return s;
```


Click the function below, then click in the terminal and click enter to define the function.


```
def checksumsq(int_list):
    s = 0
    for x in int_list:
        s += x
    return s;
```{{execute}}



Now that the function is defined, let's test that it works.


Click `checksumsq([3,4,10])`{{execute}}. The output should be 17.


You can test out the sum of other list arguments as well. When you are finished, click Continue.