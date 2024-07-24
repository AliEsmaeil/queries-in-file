## Converting Multiple Queries in File to Single Query

Here's an example demonstrating a file containing a many insert queries and converting them to single insert query:

Here's what i have put in the file(inserts.txt), exactly in a single line:

<table><tr><td>
INSERT INTO article (id, name) VALUES (1, 'Banana') ; INSERT INTO article (id, name) VALUES (2, 'Orange') ; INSERT INTO article (id, name) VALUES (3, 'Apple') ;

</td></tr></table>

This demonstration is done using prcedural programming (functional programming)

The result of that function is just a single string representing the content of the file or `null` if the file is not exist.

after all you need to get the accumulative query and pass it to your database Manager to insert them:

  `INSERT INTO article (id, name) VALUES (1, 'Banana') ,(2, 'Orange') ,(3, 'Apple') ;`
