<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />

		<title>Login - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/about_style.css">     

        <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon/favicon-16x16.png">
    </head>

<!--Body Tag Starts-->
<body>
    
    <!--Container Div starts-->
    <div class="container">
        
        <!--Header Tag starts-->
        <header>

            <!--Logo Tag Starts-->
            <div class="logo">
                <a href="../index.jsp">
                    <img src="../images/logo.png" alt="Recommend a Read - Logo">
                </a>
            </div>
            <!--Logo Tag Ends-->

            <!--Nav Tag Starts-->
            <nav>
                <ul>
                    <%
                		String id = (String)session.getAttribute("id");
        		
        				if(id!=null) { %>
        				
		                    <li class="nav-button nav-bt-2"><a href="../logout">Logout</a></li>
        				<%
        					
        				}
        				
        				else { %>
        				
        					<li class="nav-button nav-bt-1"><a href="login.jsp">Login</a></li>
		                    <li class="nav-button nav-bt-2"><a href="signup.jsp">Signup</a></li>
        					
        				<% }
        		
                	%>
                </ul>
            </nav>
            <!--Nav Tag Ends-->

        </header>
        <!--Header Tag Ends-->


        <!--Header portion ends here and about container starts-->

        <div class="about-container">
            <h1>Book Recommendation System</h1>

            <div class="project-description">
                <p>
                    Nowadays the amount of information available on the internet grows very
                    rapidly. Finding necessary information becomes more difficult. Recommendation
                    systems aim to solve this kind of problems. With the help of them one can quickly
                    access relevant information without searching the web manually. As such many
                    web sites today benefit from recommendation systems to promote and sell their
                    products. 
                    <br><br>
                    There is a wide range of products like music, movies, articles and etc.
                    that can be recommended to the customer based on their profiles in internet
                    shops or even social networks, browsing history such as visited links, browsing
                    activity like number and time of visits and other online behavior. Online shops are
                    increasing their sales using such technologies.
                    In this application we propose using recommendation systems for recommending
                    books.
                    
                </p>

                <h2>Objective</h2>
                <p>
                    Developing a system, that can recommend books to user based on their search.
                    And also learns user preferences by asking to rate books and choosing favorite
                    categories and then generate the list of books user most probably would like to
                    read.
                </p>

                <h2>Proposed System</h2>
                <p>
                    In this proposed system, we collect the data by crawling web sites using Scrappy
                    Framework. We collect data and store it into MySQL database. There are two
                    types of users in the system: Guest and Registered users. Guest can search for
                    appropriate books, get recommendations and read descriptions. Whereas
                    registered users can rate items and see the recommendations of the system.
                    <br><br>
                    The main goal is to create such a system, which can give qualitative
                    recommendations to the users without need to be registered for a long time and
                    have big profile information, browsing history and etc. The proposed system can
                    be applied for other domains to suggest items like movies, music and other
                    products.
                </p>
            </div>
        </div>



        <!--About container ends-->

       

    </div>
    <!--Container Div ends-->


    <!--Footer Starts-->
    <footer>
        <div class="footer-nav">
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <%
        		
        				if(id!=null) { %>
        				
		                    <li><a href="../logout">Logout</a></li>
        				<%
        					
        				}
        				
        				else { %>
        				
        					<li><a href="login.jsp">Login</a></li>
		                    <li><a href="signup.jsp">Signup</a></li>
        					
        				<% }
        		
                	%>
            </ul>
        </div>

        <p>
            &copy; Recommend a Read | 2022
        </p>
    </footer>
    <!--Footer Ends-->
</body>

<!--Body Tag Ends-->


</html>