---Overview---
This submission contains five SQL scripts (q1.sql to q5.sql), each creating a stored procedure as required by the lab assignment. The procedures operate on a database of TV shows, subscribers, and their watch history.


---Prerequisites---
MySQL Server installed and running.

MySQL Workbench (or any other MySQL client) to execute the scripts.


---Steps to Execute the Scripts---
These steps should be followed in a query tab within MySQL Workbench.

Step 1: Database and Table Setup
First, you need to create the database, tables, and populate them with the initial sample data.

Open MySQL Workbench and connect to your MySQL server.

Execute the following commands to create and select the database:

CREATE DATABASE IF NOT EXISTS LAB2;
USE LAB2;

Run the table creation and data insertion scripts provided in the assignment PDF. This will create the Shows, Subscribers, and WatchHistory tables and load the initial data.

Step 2: Creating the Stored Procedures
Each of the five required procedures is in its own .sql file. Execute the contents of each file from q1.sql to q5.sql.

For example, to create the first procedure, you would open q1.sql and run its content:

Important Note on Rerunning Scripts:
If you need to modify and re-run a script, you will get an error that the procedure "already exists." To avoid this, it is best practice to add the following line at the top of each procedure script. This will safely delete the old version before creating the new one.

DROP PROCEDURE IF EXISTS YourProcedureName;

For example, for q1.sql, you would add DROP PROCEDURE IF EXISTS ListAllSubscribers; at the top.

Step 3: How to Test the Procedures
After creating the procedures, you can test them using the CALL command.

To test Question 1:

CALL ListAllSubscribers();

To test Question 2: (Replace 1 with any valid SubscriberID)

CALL GetWatchHistoryBySubscriber(1);

To test Question 3:

-- This will add a new subscriber
CALL AddSubscriberIfNotExists('New User');
-- This will show a message that the user already exists
CALL AddSubscriberIfNotExists('Emily Clark');

To test Question 4:

CALL SendWatchTimeReport();

To test Question 5:

CALL GetAllWatchHistoriesWithCursor();


---File Descriptions---
q1.sql: Creates the ListAllSubscribers() procedure. This script uses a cursor to iterate through every row in the Subscribers table. Inside a loop, it fetches each subscriber's name and uses a SELECT statement to print it.

q2.sql: Creates GetWatchHistoryBySubscriber(). This procedure accepts a subscriber's ID as an input parameter. It performs a JOIN between the WatchHistory and Shows tables and uses a WHERE clause to filter the results, returning only the show titles and watch times for that specific subscriber.

q3.sql: Creates AddSubscriberIfNotExists(). This script takes a new subscriber's name as input. It first checks if that name already exists in the Subscribers table. If it does not, it calculates a new unique SubscriberID and inserts the new subscriber with the current date.

q4.sql: Creates SendWatchTimeReport(). This procedure identifies all subscribers who have watched at least one show by selecting distinct SubscriberIDs from the WatchHistory table. It uses a cursor to loop through these active subscribers and CALLs the GetWatchHistoryBySubscriber() procedure for each one to generate their report.

q5.sql: Creates GetAllWatchHistoriesWithCursor(). Similar to Q4, this procedure also uses a cursor, but it iterates through every single subscriber in the main Subscribers table, regardless of whether they have a watch history. For each subscriber, it CALLs the GetWatchHistoryBySubscriber() procedure to print their watch history (which will be empty for new subscribers).
