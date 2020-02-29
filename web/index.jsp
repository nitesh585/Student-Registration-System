<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
      Connection con;
      PreparedStatement pst;
           
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YOUR_DATABASE_NAME?autoReconnect=true&useSSL=false","YOUR_USERNAME","YOUR_PASSWORD");
     
      
    if(request.getParameter("submit") != null ){
        String sname  = request.getParameter("student") ;
        String cname  = request.getParameter("course");
        String fee  = request.getParameter("fee");
        
           
        try{
        pst = con.prepareStatement("insert into stdent(sname,cname,fee) values(?,?,?);");
        pst.setString(1, sname);
        pst.setString(2, cname);
        pst.setString(3, fee);
        pst.executeUpdate();
        
        }catch(Exception e){
            System.out.println("Not connected!!!");
        }  
    }
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <h1 align='center'>Student Registration System</h1><br>
        <div class="row" width="100%">
            <!--FOR FORM --->
            <div class="col-md-6" align='center' style="border-style: solid" >
                <h3>Student Entry :</h3>
                
                <form method="POST" action="#">
                   
                    <div align='left' >
                        <label class="form-label" style="margin-left:10px; margin-top:5px;">Student Name</label>
                        <input type="text" class='form-control' placeholder="Student Name" name="student" id="student" style="margin-left:10px;"required>
                    </div>
                    
                    <div align='left' >
                        <label class="form-label"style="margin-left:10px; margin-top:5px;">Course Name</label>
                        <input type="text" class="form-control" placeholder="Course Name" name="course" id="course" style="margin-left:10px;" required>
                    </div>
                    
                    <div align='left' >
                        <label class="form-label" style="margin-left:10px; margin-top:5px;">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" style="margin-left:10px;" required>
                    </div>
                    
                    <br>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-primary">
                    </div>
                    
                </form>
                <br>
            </div>
            
          <!--FOR TABLE --->
            <div class="col-md-6" align='center' style="border-style: solid" >
                <h3>Table Content</h3>
                <table id='tbl-student' class='table table-responsive' cellpadding='0' width='100%'>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Course</th>
                            <th>Fee</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                        <%
                            ResultSet rs;
                            String query = "select * from stdent;";
                            
                            Statement st = con.createStatement();
                            
                            rs = st.executeQuery(query);
                            
                            while(rs.next()){
                                
                                String id = rs.getString("sid");
                      
                        %>
                        
                        
                        <tr>
                            <td><%=rs.getString("sname")%></td>
                            <td><%=rs.getString("cname")%></td>
                            <td><%=rs.getString("fee")%></td>
                            <td><input type="button" id="edit" value="edit" name="edit" onclick="location.href='edit.jsp?id=<%=id%>'"  class="btn btn-secondary"></td>
                            <td><input type="button" id="delete" value="delete" name="delete" onclick="location.href = 'delete.jsp?id=<%=id%>'" class="btn btn-danger"></td>
                            
                        </tr>
                        <% } %>
                    </thead>
                    
                    
                </table> 
                
            </div>
        </div> 
        <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
