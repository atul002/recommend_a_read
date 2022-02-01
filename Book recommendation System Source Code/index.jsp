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

		<title>Recommend a Read - We provide Reading Recommendations</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="css/index_style.css">     

        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    </head>

<!--Body Tag Starts-->
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
	response.setHeader("Pragma", "no-cache");
	
	response.setHeader("Expires", "0");	
%>
    
    <!--Container Div starts-->
    <div class="container">
        
        <!--Header Tag starts-->
        <header>

            <!--Logo Tag Starts-->
            <div class="logo">
                <a href="index.jsp">
                    <img src="images/logo.png" alt="Recommend a Read - Logo">
                </a>
            </div>
            <!--Logo Tag Ends-->

            <!--Nav Tag Starts-->
            <nav>
                <ul>
                
                	<%
                		String id = (String)session.getAttribute("id");
        		
        				if(id!=null) { %>
        				
		                    <li class="nav-button nav-bt-2"><a href="logout">Logout</a></li>
        				<%
        					
        				}
        				
        				else { %>
        				
        					<li class="nav-button nav-bt-1"><a href="jsp/login.jsp">Login</a></li>
		                    <li class="nav-button nav-bt-2"><a href="jsp/signup.jsp">Signup</a></li>
        					
        				<% }
        		
                	%>
                    
                                        
                </ul>
            </nav>
            <!--Nav Tag Ends-->

        </header>
        <!--Header Tag Ends-->



        <!--Header portion ends here and middle content starts-->

        <!--Middle-Content-Wrapper starts-->
        <div class="middle-content-wrapper">

            <!--search-content-wrapper starts-->
            <div class="search-content-wrapper">
                <h1>Discover Books that you'll love!</h1>
                <p>
                    Enter a book you like and the site will analyze our huge database of real readers' 
                    favorite books to provide book recommendations and suggestions for what to read next.
                </p>
                <!--Seach-content starts-->
                <div class="search-content">

                    <form action="searchBook" method="post">
                        
                            <input type="text" name="search_book" id="search_book" placeholder="Enter Book Name and we will recommend you what to read next..." required>
                            <input type="submit" value="Search">
                        	
                        	<input type="hidden" name = "url" value="jsp/recommendation.jsp">
                    </form>

                    <img src="images/table-bg.png" alt="bg-table">

                </div>
                <!--Search-content ends-->

            </div>
            <!--search-content-wrapper ends-->




            <!--category-wrapper starts-->
            <div class="category-wrapper">
                <h2>Popular Categories</h2>
                <!--categories starts-->
                <div class="categories">

                    <div class="cat cat-1">
                        <a href="jsp/books.jsp?genre=Science Fiction">Science Fiction</a>
                    </div>

                    <div class="cat cat-2">
                        <a href="jsp/books.jsp?genre=Adventure">Adventure</a>
                    </div>
                    
                    <div class="cat cat-3">
                        <a href="jsp/books.jsp?genre=Fantasy">Fantasy</a>
                    </div>

                    <div class="cat cat-4">
                        <a href="jsp/books.jsp?genre=Time Travel">Time Travel</a>
                    </div>
                    
                    <div class="cat cat-5">
                        <a href="jsp/books.jsp?genre=Young Adult">Young Adult</a>
                    </div>
                    
                    <div class="cat cat-6">
                        <a href="jsp/books.jsp?genre=Romance">Romance</a>
                    </div>
                    
                    <div class="cat cat-7">
                        <a href="jsp/books.jsp?genre=Thriller">Thriller</a>
                    </div>
                    
                    <div class="cat cat-8">
                        <a href="jsp/books.jsp?genre=Horror">Horror</a>
                    </div>
                    
                    <div class="cat cat-9">
                        <a href="jsp/books.jsp?genre=Mystery">Mystery</a>
                    </div>
                    
                    <div class="cat cat-10">
                        <a href="jsp/books.jsp?genre=Drama">Drama</a>
                    </div>
                    
                    <div class="cat cat-11">
                        <a href="jsp/books.jsp?genre=Biography">Biography</a>
                    </div>
                    
                    <div class="cat cat-12">
                        <a href="jsp/books.jsp?genre=Non-Fiction">Non Fiction</a>
                    </div>


                </div>
                <!--categories ends-->

            </div>
            <!--category-wrapper ends-->





            <!--Featured Books starts-->
            <div class="featured-books">
                <h1>Featured Books</h1>

                <!--Books wrapper starts-->
                <div class="books-wrapper">


<%
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_recommendation","root","Root@002##");
	
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select books.book_id, books.title, books.author, books.summary, books.genre_1, books.genre_2, books.genre_3, books.image, avg(rating) from books join ratings on books.book_id = ratings.book_id group by books.book_id order by avg(rating) desc limit 5;");
	int i=0;
	int book_count  = 0;
	while(rs.next()){ i++;
		%>
				
		<!--Books starts-->
                    <div class="books book-<%book_count++;%> ">
                        
                        <div class="book-thumb">
                            <img src="<%String image = rs.getString("image");
                            			image = image.substring(3);
                            			out.print(image);
                            			%>" alt="<%=rs.getString("books.title")%>">
                        </div>

                        <div class="book-description">
                            <div class="title">
                                <h2> <%=rs.getString("books.title")%></h2>
                            </div>

                            <div class="author">
                                <h3><%=rs.getString("books.author")%></h3>
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

                    
                    <!--Books ends-->
		
	
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
                <!--Books Wrapper ends-->
            </div>

            <!--Featured Books ends-->
        
        </div>
        <!--Middle-Content-Wrapper ends-->

    </div>
    <!--Container Div ends-->


    <!--Footer Starts-->
    <footer>
        <div class="footer-nav">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="jsp/about.jsp">About</a></li>
                
                
                
                	<%
                		
        		
        				if(id!=null) { %>
        				
		                    <li><a href="logout">Logout</a></li>
        				<%
        					
        				}
        				
        				else { %>
        				
        					<li><a href="jsp/login.jsp">Login</a></li>
		                    <li><a href="jsp/signup.jsp">Signup</a></li>
        					
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