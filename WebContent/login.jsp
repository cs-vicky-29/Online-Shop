<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<!-- Login Page Specific Content -->
<%
if(request.getParameter("btnlogin")!=null) //Login Button Clicked
{
	String user=request.getParameter("txtuser");
	String pass=request.getParameter("txtpass");
	//Validate it Againest Admin Login Table
	
	ResultSet rs=db.getRows("select * from AdminLogin where UserName=? and Password=?", user,pass);
 	if(rs.next()){ //True/False
 		//Redirect to Admin Dashboard
 		session.setAttribute("user", user);
 		response.sendRedirect("admin/admin.jsp");
 	} 
 	else{
 		session.setAttribute(user, null);
 		msg="Invalid UserName/Password..Try Again..";
 	}
}
%>
<div class="container">
<form method="post">
<div class="col-5 offset-3">
<br> <br>
<h2>Login</h2>
<div  class="form-group">
UserName/Email Address
<input type="text" name="txtuser" id="txtuser" class="form-control" placeholder="Enter Your Username" autofocus/>
</div>
<div  class="form-group">
Password
<input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Your Password"/>
</div>
<br>
<input type="submit" name="btnlogin" value="login" class="btn btn-primary" />
</div>
</form>
</div>
<br>
<%@ include file="footer.jsp"%>