<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />

		<title>Add Book - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/add_book_style.css">    
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

                            <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active"><a href="add_book.jsp"><i class="fa fa-plus"></i> Add Book</a></li>
                            <li><a href="rate_book.jsp"><i class="fa fa-star-half-o"></i> Rate Book</a></li>
                            <li><a href="about.jsp"><i class="fa fa-info-circle"></i> About</a></li>
                            


                        </ul>
                    </nav>
                </div>

            </div>


            <div class="form-container-wrapper">

                <div class="form-container">

                    <h1>Enter Book's Data</h1>
                    
                    <form action="../addBook" method="post">
                    
                    	<p class="error-message">
								<% String message = (String) session.getAttribute("message");
	
	
									if(message!=null)
									{
										out.print(message);
										session.setAttribute("message", null);
									}
									
								%>
							</p>
							                  
                        <div class="book-container">

                            <div class="title">
                                <label>Title:
                                    <input type="text" placeholder="Title of Book" name="title" required>
                                </label>
                            </div>

                            <div class="author">
                                <label>Author:
                                    <input type="text" placeholder="Author of Book" name="author" required>
                                </label>
                            </div>
                            
                            <div class="yop">
                                <label>Publication Year:
                                    <input type="number" placeholder="Year of Publication" name="year" required>
                                </label>
                            </div>

                            <div class="summary">
                                <label>Summary:
                                    <textarea name="summary" required>A Brief Summary of the Book!</textarea>
                                </label>
                            </div>

                            <div class="genre genre-1">
                                <label>Genre 1:
                                    <input type="text" placeholder="Primary Genre" name="genre_1" required>
                                </label>
                            </div>

                            <div class="genre genre-2">
                                <label>Genre 2:
                                    <input type="text" placeholder="Secondary Genre" name="genre_2" required>
                                </label>
                            </div>

                            <div class="genre genre-3">
                                <label>Genre 3:
                                    <input type="text" placeholder="Tertiary Genre" name="genre_3" required>
                                </label>
                            </div>


                        </div>
                        
                        
                        <button type="submit">Submit Book</button>
                        <button type="reset">Reset</button>
                        

                        
                    </form>
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