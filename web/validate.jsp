<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
    //out.print("Connection");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phish","root","");
    //out.println("Driver");
	PreparedStatement pstmt = con.prepareStatement("select * from list");
	ResultSet rs = pstmt.executeQuery();
        int flag=0;
	while(rs.next())
        {
            if(rs.getString(1).equals(request.getParameter("href")))
                flag=1;
        }
        if(flag==1)
            out.println("It's a PHISHING site!!Don't go!!");
        else
            out.println("Possible phishing site!!BEWARE!!");
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
