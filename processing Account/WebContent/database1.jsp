<%@ page import="java.sql.*"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String accno = request.getParameter("accountno");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","Password");
	Statement st = con.createStatement();
	st.executeUpdate("insert into data value('"+name+"','"+email+"','"+password+"','"+accno+"');");
	response.sendRedirect("sign.html");
}
catch(Exception e){
	out.println(e);
	//response.sendRedirect("Error.html");
}
%>