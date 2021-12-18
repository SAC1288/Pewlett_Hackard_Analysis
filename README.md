# Pewlett Hackard Employee Retirement and Mentorship Report
## *Section 1: Project Overview*

Pewlet Hackard has hired SATC Consulting to help with its database needs in regards to its employee retirement program. The purpose of the project is to help Pewlettt Hackard’s HR analyst Bobby determine who within the company is retiring and how many are retiring from each department. We began this project by building the initial database for the company from the six CSV files that were delivered to us. We built on these files and were able to query the information needed and have presented our findings in the following sections of this report. We also used this database to query information related to an upcoming mentorship program that Bobby has set up by creating a list of eligible employees for this program based on his criteria. The mentorship program is used to internally fill the vacancies created by the employees that will be retiring in the near future.

## *Section 2: Project Results*

*Section 2.1 Database Creation*

We worked with the following six tables in creating an employees database system for Pewlett Hackard:

•	Departments table lists all the departments and their corresponding department numbers.

•	Department Manger provides information on the Pewlett Hackard employees that are or have been department managers for the company. 

•	Employees table lists all of the employees at Pewlett Hackard and provides such information as their birth dates, hiring dates, and gender.

•	Department Employees table provides department information for each employee and the dates from when they were assigned to their respective department.

•	Salaries table provides salary information for each employee and the dates from when they received those payments. 

•	Titles able shows the titles that every employee has obtained while at Pewlett Hackard. 

We had to create relationships among the previous six tables to obtain the information that we needed. We connected each tables primary keys to other tables and for those that only had foreign keys were still related to other tables’ primary keys. **Figure 2-1** provides a diagram that illustrates this relationship network. 

<img src='Other Files/EmployeeDB.png'>

**Figure 2-1**

*Section 2.2 Key Takaways*

There were four main takeaways we gathered from the analysis. They are presented in the following list with supporting images:

•	The first order of business to address was to identify the number of employees retiring by each department. **Figure 2-2** provides a snapshot of the first 28 employees in the list that we created:

<img src='Other Files/Retiring_Titles_Snapshot.png'>

**Figure 2-2**

• There are 72,458 Pewlett Hackard employees that are eligible for retirement. The unique_titles table that we created and shown above contains the list of all retiring employees and their most recent titles. 

• Next, we organized the unique_titles list in postgres to come up with a retiring_titles table that shows the amount of employees retiring for each job title. **Figure 2-3** shows the summary snapshot of our findings:

<img src='Other Files/Retiring_Titles_Summary.png'>

**Figure 2-3**

• The table is organized in descending order based on the count of the number of retiring employees per position. An overwhelming amount of retiring employees are in senior positions, specifically as senior engineers or senior staff members. We recommend that Pewlett Hackard begin to look externally, in addition to looking internally, at replacing employees in these two positions in particular, if the company has not already initiated this process. 

• Finally, we were required to create a list of potential mentors for the Pewlett Hackard Mentorship Program. **Figure 2-4** shows a snapshot of the first 28 eligible employees for this program:

<img src='Other Files/Mentorship_Eligibility_List_Snapshot.png'>

**Figure 2-4**

• The analysis has confirmed that there about 1,549 employees eligible for the mentorship program. 

• A summary snapshot of the mentorship eligibility program by position has been provided in **Figure 2-5**:

<img src='Other Files/Mentorship_Eligibility_By_Position.png'>

• According to our analysis, senior staff positions have the most employees that are eligible for the mentorship program (569 employees). Engineers were the next class of employees that had the highest amount of eligible members (501 employees). 

## *Section 3: Summary*

When we began this project, there were two important questions that we needed to answer. We have mentioned our answers briefly in the “Project Results” section but will go into more detail about them in this section. Below are our full responses and the questions we needed to answer:

**1.) Question:** “How many roles will need to be filled as the ‘silver tsunami’ begins to make an impact?”

**Our Response:** Please go back and review Figures 2-2 and 2-3. There are 72,458 positions that need to be filled as a result of employees retiring from those posts. A significant amount of those retirees are in senior staff positions. We expected a great number from this group, but not as high as it turned out to be from the data. We recommend that Pewlett Hackard immediately begin its mentorship program and even look outside for help in terms of filling in those upcoming vacancies. 

**2.) Question:** “Are there enough qualified, retirement-read employees in departments to mentor the next generation of Pewlett Hackard employees?

**Our Response:** No, there are not enough employee eligible in the mentorship program to mentor the next generation of Pewlett Hackard employees. Again, over 72,000 are retiring leaving only 1,549 eligible mentors to run the whole mentorship program for the remining 300,000+ employees within the organization. That means there will be almost 300 employees for 1 mentor to cover if you did a straight-line average. This is not sustainable coverage for the amount of employees that need to be mentored and promoted to more senior positions within the organization. 

In addition, this means since there will be 72,000 open positions, this fact means that of the 1,549 selected for the mentorship program, approximately each one will have to work to find about 72 people to fill each of the positions lost. This does not seem achievable and so we further stress the importance of Pewlett Hackard looking more externally to fill these vacancies and not just rely on its internal placement programs alone.They will have to look at filling their sentior staff and seniorengineer positions in particular through external resources as those positions have the highest number of retirees.

**This is the conclusion of our report. If you have any questions about the information presented, then please reach out to one of our consultants.** 

