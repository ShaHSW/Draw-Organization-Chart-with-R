# Draw-Organization-Chart-with-R
Blog Post: http://haoshawang.com/blog/how-to-draw-organization-chart-with-r/


Spreadsheets are great when the data size is small.  I recently have helped one of our PM drawing organization chart with R and feel this is a good example to show the power and simplicity of R.

In this post, I have used a sample dataset and you can download from HERE.

Here is my intuitive solution after read data into R.

1.  Created a temp data frame as data input excluded unnecessary columns. Columns in my data input:

 EmpID: Unqiue Identifier for employee
 EmpName: Employee name. In this case, the PM has preprocessed it and they are unique names.
EmpTitle: Employee Title
EmpManager: Manager’s name this employee reports to
EmpDept: Employee’s department
FloorNum: Employee Offie ID. This is the primary key to identify which office employee is at.
2.  I used merge function from base to get manager’s titles.

3. Tweak and create a data frame as data input.

4. Use igraph packages to plot the organization chart.

6*. Another function if we want to draw organization chart by department
