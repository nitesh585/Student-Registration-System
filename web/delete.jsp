<%@page import="java.sql.*" %>

<%
      Connection con;
      PreparedStatement pst;
           
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YOUR_DATABASE_NAME?autoReconnect=true&useSSL=false","YOUR_USERNAME","YOUR_PASSWORD");
      String id = request.getParameter("id");
   
      pst = con.prepareStatement("delete from stdent where sid = ?");
      pst.setString(1, id);
      pst.executeUpdate();

      response.sendRedirect("index.jsp");
%>
