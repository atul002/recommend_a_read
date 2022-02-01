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
        
        <meta name="robots" content="index, follow"/>

		<title>Dashboard - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/dashboard_style.css">    
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
	
	String id = (String)session.getAttribute("id");
	
	if(id==null) {
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

                            <li class="active"><a href="dashboard.jsp"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="add_book.jsp"><i class="fa fa-plus"></i> Add Book</a></li>
                            <li><a href="rate_book.jsp"><i class="fa fa-star-half-o"></i> Rate Book</a></li>
                            <li><a href="about.jsp"><i class="fa fa-info-circle"></i> About</a></li>
                            
                        </ul>
                    </nav>
                </div>

            </div>


            <div class="books-container">


                <div class="books-read-wrapper">

                    <h3>Books you've read:</h3>
    
                    <div class="books-read">
    
    
		
<%
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_recommendation","root","Root@002##");
	
	Statement st= con.createStatement();
	
	
	ResultSet rs=st.executeQuery("select books.title, books.image from users join ratings join books on users.id = ratings.user_id and ratings.book_id = books.book_id where users.id='"+id+"' and ratings.rating > 0 order by rating desc limit 27");
	
	
	int i=0;
	int book_count  = 0;
	while(rs.next()){ i++;
		%>
				
		<!--Books starts-->
                    <div class="book book-<%book_count++;%> ">
                        
                            <img src="<%String image = rs.getString("image");
                            			//image = image.substring(3);
                            			out.print(image);
                            			%>" alt="<%=rs.getString("books.title")%>">
							
							<h4><% String title = rs.getString("title");
									out.print(title);%></h4>
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
    
                </div>

                
                
                <div class="recommended-books-wrapper">

					<!--
                    <h3>Our Recommendations:</h3>
    
                    <div class="recommended-books">
    
                        <div class="book book-1">
                            <img src="../images/book-thumbs/The Alchemist.png" alt="The Alchemist">
                            <h4>The Alchemist</h4>
                        </div>
    
                    </div>
                    
                    
                    Commenting it for next update
                    -->
                </div>


            </div>	
            
        

        </div>

        
       

    </div>
    <!--Container Div ends-->


    <!--Footer Starts-->
    <footer>
        <div class="footer-nav">
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="../logout">Logout</a></li>
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