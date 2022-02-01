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


        <!--Insert Book name here-->
		<title>Book by Category</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/books_style.css">     

        <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon/favicon-16x16.png">
    </head>

<!--Body Tag Starts-->
    <body>

<%
	String genre = (String)request.getParameter("genre");
        		
    if(genre==null) {
    	response.sendRedirect("error_404.jsp");
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


            <!--Header portion ends here and Book-container-wrapper starts-->
            
                <div class="books-container-wrapper">
                    <!--Book Wrapper starts-->
                    <div class="books-container">
                        <!--Insert Searched Book name-->

                        <h3>Most Popular <%out.print(genre); %> Books!</h3>
                        <div class="recommended-books">
                        
                        
                        

<%
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_recommendation","root","Root@002##");
	
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select books.title, books.title, books.author, books.summary, books.genre_1, books.genre_2, books.genre_3, books.image, avg(rating) from books join ratings on books.book_id = ratings.book_id where genre_1 = '"+genre+"' or genre_2 = '"+genre+"' or genre_3 = '"+genre+"' group by books.book_id order by avg(rating) desc limit 5");
	int i=0;
	int book_count  = 0;
	while(rs.next()){ i++;
		%>
				
		
				<div class="books book-<%book_count++;%> ">
                       
                                <div class="book-thumb">
                                    <img src="<%String image = rs.getString("image");
                            			out.print(image);
                            			%>" alt="<%=rs.getString("books.title")%>">
                                </div>
        
                                <div class="book-data">
                                    <div class="title">
                                		<h1> <%=rs.getString("books.title")%></h1>
                            		</div>

		                            <div class="author">
		                                <h2><%=rs.getString("books.author")%></h2>
		                            </div>

		                            <div class="summary">
		                                <p>
		                                    <%=rs.getString("books.summary")%>
		                                </p>
		                            </div>

		                            <div class="tags">
		                                <ul>
		                                    <li><a href="#"><%=rs.getString("books.genre_1") %></a></li>
		                                    <li><a href="#"><%=rs.getString("books.genre_2") %></a></li>
		                                    <li><a href="#"><%=rs.getString("books.genre_3") %></a></li>
		                                </ul>
		                            </div>
                          		</div>
                        	</div> 
				
                            
		
	
		<%
		}
		con.close();
		
		} 
		
		catch (Exception e) 
		{
		System.out.println(e);
		}
%>                        
                   			




                            




                            
                        </div>
                    </div>
                    <!--Recommended Book Wrapper ends-->

                </div>
                            
            <!--Book Container Wrapper ends-->

            

        

        </div>
        <!--Container Div ends-->


        <!--Footer Starts-->
        <footer>
            <div class="footer-nav">
                <ul>
                    <li><a href="../index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
<%
        		
        				if(id!=null) { %>
        				
		                    <li><a href="../logout">Logout</a></li>
        				<%
        					
        				}
        				
        				else { %>
        				
        					<li><a href="login.jsp">Login</a></li>
		                    <li><a href="signup.jsp">Signup</a></li>
        					
        				<% }
        		
                	%>                </ul>
            </div>

            <p>
                &copy; Recommend a Read | 2022
            </p>
        </footer>
        <!--Footer Ends-->
    </body>

    <!--Body Tag Ends-->


</html>