<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
        
      if(request.getParameter("submit") != null ){
        
        Connection con;
        PreparedStatement pst;
           
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DATABASE_NAME?autoReconnect=true&useSSL=false","YOUR_USERNAME","YOUR_PASSWORD");
        
        String sid = request.getParameter("id");
        String sname  = request.getParameter("student") ;
        String cname  = request.getParameter("course");
        String fee  = request.getParameter("fee");
    
        try{
        pst = con.prepareStatement("update stdent set sname = ?,cname = ?,fee = ? where sid = ?;");
        
        pst.setString(1, sname);
        pst.setString(2, cname);
        pst.setString(3, fee);
        pst.setString(4, sid);
        
        pst.executeUpdate();
        
        }catch(Exception e){
            System.out.println(e);
        }
        
        response.sendRedirect("index.jsp");
    }
      
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Edit details : </h2>
        
        <div class='row'>
            <div class="col-md-6" align='center' style="border-style: solid" >
                <h4>Student Entry :</h4>
                
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
        </div>
        
    </body>
</html>
