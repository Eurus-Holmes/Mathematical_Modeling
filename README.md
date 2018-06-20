# 2018.1.30
## Mathematical Modeling Algorithms and Applications


    1. Linear programming
    2. Integer programming
    3. Nonlinear programming
    4. Figure and network model and method
    5. Interpolation and Fitting
    6. Differential Equation Modeling
    7. Mathematical Statistics
    8. Sequentially
    9. Support Vector Machines
    10. Multivariate analysis
    11. Partial least squares regression analysis
    12. Modern optimization algorithm
    13. Digital image processing
    14. Comprehensive evaluation and decision-making methods
    15. Method of prediction
    16. Goal planning
 

----------


# 2018.2.1

> How to solve "failed to push some refs to git"

    The main reason for the error is that the README.md file in github is not in the local code directory.
    
    Code can be combined through the following order Note(pull = fetch + merge):
    git pull --rebase origin master
    
    After executing the above code you can see the README.md file in the local code base.
    
    At this point and then execute the statement:
    git push-u origin master
    to complete the code upload to github.

