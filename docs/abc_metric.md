# Assignment Branch Condition

Assignment Branch Condition (ABC) size is a way to measure the size of your code. It was first proposed in 1997 by Jerry Fitzpatrick in an article originally published in __C++ Report__. You can read the original paper [here](http://www.softwarerenovation.com/ABCMetric.pdf).

Here's how we calculate the ABC size for Puppet:

1. Add one to the assignment count for each occurrence of variable and attribute assignment.
2. Add one to the branch count for each resource declaration, function call, and resource collector.
3. Add one to the conditional count for each use of a comparison operator.

    `>` `<` `>=` `<=` `!~` `=~` `!=` `==`

4. Add one to the contitional count for each contitional expression.

    `if` `else` `elsif` `unless` `case`

5. Add one to the conditional count for each selector expression.
