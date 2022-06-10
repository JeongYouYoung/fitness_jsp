<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("UTF-8");

    String content =request.getParameter("content");
    String uId = request.getParameter("user_uId");
    


    String url_mysql = "jdbc:mysql://localhost/todolist?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 ="insert into list (lContent, lCheck, user_uId";
        String act2=") values (?,1,?)";

        ps=conn_mysql.prepareStatement(act1+act2);
        ps.setString(1,content);
        ps.setString(2,uId);


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