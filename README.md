https://atul002.github.io/recommend_a_read/
 
Working Demonstration : https://www.youtube.com/watch?v=s9clv3T8f34






The Project can be deployed on your localhost as follows:

1 - Download Java --> https://www.oracle.com/java/technologies/downloads/

2 - Download Apache Tomcat from here --> https://tomcat.apache.org/download-90.cgi

3 - Setup the necessary Environment Variables: JAVA_HOME, CLASSPATH

4 - Download & Setup MySQL Workbench from here --> https://dev.mysql.com/downloads/windows/installer/8.0.html

5 - Credentials from MySQL Workbench:

                                     id - "root"
                                     
                                     pass - "Root@002##"
                                     
                                     

6 - Create Database 'Book Recommendation' and Tables 'User', 'Rating', 'Book' as specified in the Project Report File

7 - Load the CSV data into the Tables using import command.

8 - Place BookRecommendation.war file in "C:\apache-tomcat-9.0.30\webapps"

9 - Goto "C:\apache-tomcat-9.0.30\bin\startup.bat" and run the startup.bat file

10 - Open your browser and Goto: "http://localhost:8080/BookRecommendation"
