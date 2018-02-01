2018.1.30

Mathematical Modeling Algorithms and Applications

Table Of Contents

1.Linear programming<br>
2.Integer programming<br>
3.Nonlinear programming<br>
4.Figure and network model and method<br>
5.Interpolation and Fitting<br>
6.Differential Equation Modeling<br>
7.Mathematical Statistics<br>
8.Sequentially<br>
9.Support Vector Machines<br>
10.Multivariate analysis<br>
11.Partial least squares regression analysis<br>
12.Modern optimization algorithm<br>
13.Digital image processing<br>
14.Comprehensive evaluation and decision-making methods<br>
15.Method of prediction<br>
16.Goal planning<br>
<br>
<br>
<br>
2018.2.1

How to solve "failed to push some refs to git"

The main reason for the error is that the README.md file in github is not in the local code directory.

Code can be combined through the following order Note(pull = fetch + merge):
git pull --rebase origin master

After executing the above code you can see the README.md file in the local code base.

At this point and then execute the statement:
git push-u origin master
to complete the code upload to github.
