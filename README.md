# teacher_helper

Visitors who have not logged in should only see the login page.
Teachers who have logged in should be able to:
Create teachers
Create students
Create parents (for a particular student)
Enter, edit, or delete grades for a student. These grades are things like "Got a B on the 2/4/2015 homework", not just one grade per student.
Students who have logged in should be able to:
See their grades.
Parents who have logged in should be able to:
See their student's grades.
Any user who has logged in should be able to:
Change his or her password.
These lists are not cumulative. For instance, a student should NOT be able to create teachers.

In terms of code, you must:

Use at least two partials.
Use at least two helpers.
Have at least one controller that implements Rails' flavor of REST (i.e. a resources route).
