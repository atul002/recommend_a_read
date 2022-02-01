<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />


        <!--Insert Book name here-->
		<title><%String title = (String)session.getAttribute("title"); out.print(title);%></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/recommendation_style.css">     

        <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon/favicon-16x16.png">
    </head>

<!--Body Tag Starts-->
    <body>
    
    <%
    

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
	response.setHeader("Pragma", "no-cache");
	
	response.setHeader("Expires", "0");	
	
	
    	if(session.getAttribute("title") == null)
    	{
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
            
            <div class="book-searched-wrapper">

                <div class="book-container">

                    <!--Book Searched starts-->
                    <div class="book-searched">
                       
                      
                        <div class="book-thumb">
                            <img src="<%String image = (String)session.getAttribute("image");
                     				out.print(image); %>" alt="<% out.print(title); %>">
                        </div>

                        <div class="book-data">
                            <div class="title">
                                <h1><%out.print(title); %></h1>
                            </div>

                            <div class="author">
                                <h2><%String author = (String)session.getAttribute("author"); out.print(author); %></h2>
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
                        </div>
                    </div>
                    <!--Book Searched Ends-->


                    <!--Recommended Book Wrapper starts-->
                    <div class="recommended-books-wrapper">
                        
                        
						
                        <h3>If you loved reading <%out.print(title);%> by <%out.print(author); %>,
                            try reading our recommendations too...</h3>
                       
                       
                       
                       <div class="recommended-books">
                       
                       
<%
try 
{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_recommendation","root","Root@002##");
	String query = "select books.book_id, books.title, books.author, books.summary, books.genre_1, books.genre_2, books.genre_3, books.image, avg(rating) from books join ratings on books.book_id = ratings.book_id where (genre_1 = ? or genre_1 = ? or genre_1 = ?) and books.title != ? group by books.book_id order by avg(rating) desc limit 5;";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, genre_1);
    pstmt.setString(2, genre_2);
    pstmt.setString(3, genre_3);
    pstmt.setString(4, title);
    ResultSet rs = pstmt.executeQuery();
    
    
    
	
	
	
		
	int i=0;
	while(rs.next()){ i++;
		%>
		
                    <div class="books book-<%out.print(i);%>">
                       
                                <div class="book-thumb">
                                    <img src="<%=rs.getString("image")%>" alt="<%=rs.getString("title")%>">
                                </div>
        
                                <div class="book-data">
                                    <div class="title">
                                        <h1><%=rs.getString("title")%></h1>
                                    </div>
        
                                    <div class="author">
                                        <h2><%=rs.getString("author")%></h2>
                                    </div>
        
                                    <div class="summary">
                                        <p>
                                            <%=rs.getString("summary")%>
                                        </p>
                                    </div>
        
                                    <div class="tags">
                                        <ul>
                                            <li><a href="#"><%=rs.getString("genre_1")%></a></li>
                                            <li><a href="#"><%=rs.getString("genre_2")%></a></li>
                                            <li><a href="#"><%=rs.getString("genre_3")%></a></li>
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
                

            </div>
            
            <!--Book Container Wrapper ends-->

            

        

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