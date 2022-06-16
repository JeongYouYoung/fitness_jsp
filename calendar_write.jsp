<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

request.setCharacterEncoding("utf-8");
String cTitle = request.getParameter("cTitle");
String cContent = request.getParameter("cContent");
int cFlexibility = Integer.parseInt(request.getParameter("cFlexibility"));
int cEndurance = Integer.parseInt(request.getParameter("cEndurance"));
int cWits = Integer.parseInt(request.getParameter("cWits"));
int cMuscularStrength = Integer.parseInt(request.getParameter("cMuscularStrength"));
int cCardiovascularEndurance = Integer.parseInt(request.getParameter("cCardiovascularEndurance"));
String cDate = request.getParameter("cDate");
String uId = request.getParameter("uId");

 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 PreparedStatement ps = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 = "insert into calendar (cTitle, cContent, cFlexibility, cEndurance, cWits, cMuscularStrength, cCardiovascularEndurance, user_uId, cDate ";
    String act2 = ") values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    ps = conn_mysql.prepareStatement(act1+act2);
    ps.setString(1, cTitle);
    ps.setString(2, cContent);
    ps.setInt(3, cFlexibility);
    ps.setInt(4, cEndurance);
    ps.setInt(5, cWits);
    ps.setInt(6, cMuscularStrength);
    ps.setInt(7, cCardiovascularEndurance);
    ps.setString(8,uId);
    ps.setString(9,cDate);

    ps.executeUpdate();
    conn_mysql.close();
%>
    {"result":"OK"}
<%
} catch(Exception e){
%>
    {"result":"ERROR"}
<%
}
%>