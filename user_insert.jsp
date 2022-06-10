<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("UTF-8");

    String id =request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    int birth =  Integer.parseInt(request.getParameter("birth"));
    String email = request.getParameter("email");
    


    String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 ="insert into user (uId, uPw, uName, uBirth, uEmail, uJoinDate";
        String act2=") value (?,?,?,?,?,now())";

        ps=conn_mysql.prepareStatement(act1+act2);
        ps.setString(1,id);
        ps.setString(2,pw);
        ps.setString(3,name);
        ps.setInt(4,birth);
        ps.setString(5,email);


        ps.executeUpdate();
        conn_mysql.close();
%>
       {"result":"OK"}
<%
    }catch(Exception e){
        %>
        {"result":"ERROR"}
<%
    }
    %>