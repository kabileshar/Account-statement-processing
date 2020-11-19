<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
String accountno=request.getParameter("accountno");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Password");
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("select * from data where email='"+email+"' and password='"+password+"' and accountno='"+accountno+"'");
	try{
		rs.next();
		if(rs.getString("password").equals(password) && rs.getString("email").equals(email) && rs.getString("accountno").equals(accountno))
		{
		out.println("Welcome " +rs.getString("username"));
		}
		
	}
	catch(Exception e){
		out.println("Invalid password or username.");
	}
}
catch(Exception e)
{
	out.println("error "+e);
}
%>