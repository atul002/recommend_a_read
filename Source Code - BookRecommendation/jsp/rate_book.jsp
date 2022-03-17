<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />

		<title>Rate Book - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/rate_book_style.css">    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

        <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon/favicon-16x16.png">
    </head>

<!--Body Tag Starts-->
<body>

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
	response.setHeader("Pragma", "no-cache");
	
	response.setHeader("Expires", "0");	
	
	String id = (String) session.getAttribute("id");
	
	
	if(id==null)
	{
		response.sendRedirect("login.jsp");
	}
	
%>
 
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
                    <li class="nav-button nav-bt-2"><a href="../logout">Logout</a></li>
                </ul>
            </nav>
            <!--Nav Tag Ends-->

        </header>
        <!--Header Tag Ends-->


        <div class="dashboard-container">

            <div class="sidebar-wrapper">

                <div class="sidebar">
                    <nav>
                        <ul>

                            <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="add_book.jsp"><i class="fa fa-plus"></i> Add Book</a></li>
                            <li class="active"><a href="rate_book.jsp"><i class="fa fa-star-half-o"></i> Rate Book</a></li>
                            <li><a href="about.jsp"><i class="fa fa-info-circle"></i> About</a></li>
                            


                        </ul>
                    </nav>
                </div>

            </div>


            <div class="book-rating-wrapper">

               

                <div class="book-rating">

                    <form action="../searchBook" method="post">
                        
                        <input type="text" name="search_book" id="search_book" placeholder="Enter Book Name to search">
                        <input type="submit" value="Search">
                    	
                    	<input type="hidden" name = "url" value="jsp/rate_book.jsp">
                    	
                    </form>
                    
                    
                    	<p class="error-message">
								<% String message = (String) session.getAttribute("message");
	
	
									if(message!=null)
									{
										out.print(message);
										session.setAttribute("message", null);
									}
									
									
									
								%>
							</p>

                    <img src="../images/table-bg.png" alt="bg-table">


                </div>

				<% String title = (String)session.getAttribute("title");
					if(title!=null)
					{
				%>
                <div class="book-wrapper">
                    <h2>Your Search Results...</h2>
                    <!--Books starts-->
                    <div class="books book-1">
                        
                        <div class="book-thumb">
                            <img src="<%String image = (String)session.getAttribute("image");
                     				out.print(image); %>" alt="<% out.print(title); %>">
                        </div>

                        <div class="book-description">
                            <div class="title">
                                <h2><%out.print(title); %></h2>
                            </div>

                            <div class="author">
                                <h3><%String author = (String)session.getAttribute("author"); out.print(author); %></h3>
                            </div>

                            <div class="summary">
                                <p>
                                    <%String summary = (String)session.getAttribute("summary"); out.print(summary); %>                                    
                                </p>
                            </div>

                            <div class="tags">
                                <ul>
                                    <li><a href="#"><%String genre_1 = (String)session.getAttribute("genre_1"); out.print(genre_1); %></a></li>
                                    <li><a href="#"><%String genre_2 = (String)session.getAttribute("genre_2"); out.print(genre_2); %></a></li>
                                    <li><a href="#"><%String genre_3 = (String)session.getAttribute("genre_3"); out.print(genre_3); %></a></li>
                                </ul>
                            </div>

                            <div class="rating">

                                <form action="../rateBook" method="post">
                                    
                    				<input type="hidden" name = "url" value="jsp/rate_book.jsp">
                    				
                                    <label for="rating">Rate this Book:
                                    <select name="rating" id="rating">
                                      <option value="1">1</option>
                                      <option value="2">2</option>
                                      <option value="3">3</option>
                                      <option value="4">4</option>
                                      <option value="5">5</option>
                                      <option value="6">6</option>
                                      <option value="7">7</option>
                                      <option value="8">8</option>
                                      <option value="9">9</option>
                                      <option value="10">10</option>                                      
                                    </select>
                                    </label>
                                    
                                    <input type="submit" value="Submit">
                                  </form>

                            </div>
                        </div>

                    </div>
                </div>
              

    				<% 
    				session.removeAttribute("title");
					}
					%>
                   
                



            </div>
            
        

        </div>

        
       

    </div>
    <!--Container Div ends-->


    <!--Footer Starts-->
    <footer>
        <div class="footer-nav">
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="signup.jsp">Logout</a></li>
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