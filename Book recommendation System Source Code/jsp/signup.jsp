<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Recommend a Read - We provide recommendations for book you would love to read!">
        
        <meta name="robots" content="index, follow" />

		<title>Signup - Recommend a Read</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="../css/signup_style.css">     

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
	
	
	if(id!=null)
	{
		response.sendRedirect("dashboard.jsp");
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
                    <li class="nav-button nav-bt-1"><a href="login.jsp">Login</a></li>
                </ul>
            </nav>
            <!--Nav Tag Ends-->

        </header>
        <!--Header Tag Ends-->


        <!--Header portion ends here and form container starts-->

        <div class="form-container-wrapper">

        
            <div class="form-container">

                    <div class="form-logo">
                        <img src="../images/login-logo.png" alt="Signup Page Logo">

                        <h1>Enter Credentials to Signup!</h1>
                    </div>
                    
                    <form action="../signup" method="post">                  
                        <div class="login-container">
							<p class="error-message">
								<% String message = (String) session.getAttribute("message");
	
	
									if(message!=null)
									{
										out.print(message);
										session.setAttribute("message", null);
									}
									
								%>
							</p>
                            <div class="name">
                                <label>Name:
                                    <input type="text" placeholder="User's name" name="name" required>
                                </label>
                            </div>

                            <div class="email">
                                <label>Email:
                                    <input type="email" placeholder="email-id@domain.com" name="email" required>
                                </label>
                            </div>
                            
                            <div class="password">
                                <label>Password:
                                    <input type="password" placeholder="********" name="password1" required>
                                </label>
                            </div>

                            <div class="password">
                                <label>Retype Password:
                                    <input type="password" placeholder="********" name="password2" required>
                                </label>
                            </div>

                        </div>
                        
                        
                        <button type="submit">Signup</button>
                        <button class="reset" type="reset">Clear All</button>
                        

                        
                    </form>
            </div>
        </div>
       
        <!--Form container ends-->

       

    </div>
    <!--Container Div ends-->


    <!--Footer Starts-->
    <footer>
        <div class="footer-nav">
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="login.jsp">Login</a></li>
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