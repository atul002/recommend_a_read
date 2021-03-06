<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />

		<title>404! Page Not Found - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/error_404_style.css">     

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


        <!--Header portion ends here and error container starts-->
        <div class="error-wrapper">
            <div class="error-image">
                <img src="../images/error_404.png" alt="Error-404">
            </div>

            <div class="error-msg">
                <p>Unfortunately! The page you requested could not be found...</p>

                <button>
                    <a href="../index.jsp">Return to Homepage</a> 
                </button>
            </div>
            
        </div>
        

        
        <!--Error container ends-->

        

       

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