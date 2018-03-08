## Instead of writing DB Connection and other server side code in servlet file, everything is written in JSP page
## index.jsp

```
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<form method="post">

<table border="2">
   <tr>
        <td>lastName</td>
        <td>firstName</td>
        <td>major</td>
        <td>bDay</td>
        <td>AGE</td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/jspdb";
       String username="root";
       String password="";
       String query="select * from Subha";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
{

%>
<tr><td><%=rs.getString("lastName") %></td></tr>
<tr><td><%=rs.getString("firstName") %></td></tr>
<tr><td><%=rs.getString("major") %></td></tr>
<tr><td><%=rs.getDate("bDay") %></td></tr>
<tr><td><%=rs.getInt("AGE") %></td></tr>

 <%

}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</form>
```