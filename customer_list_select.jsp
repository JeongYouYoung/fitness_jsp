<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

 String search = request.getParameter("search");

 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 String whereDefault = "SELECT uId, uName, uBirth, uEmail, uJoinDate FROM user where uAdmin = 0";
 String query2 = " and (uName like '%"+search+"%' or uId like '%"+search+"%')";

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    if(search.equals(null)){
      ResultSet rs = stmt_mysql.executeQuery(whereDefault);
      while(rs.next()){
          JSONObject tempJson = new JSONObject();
          tempJson.put("uId",rs.getString(1));
          tempJson.put("uName",rs.getString(2));
          tempJson.put("uBirth",rs.getString(3));
          tempJson.put("uEmail",rs.getString(4));
          tempJson.put("uJoinDate",rs.getString(5));
          itemList.add(tempJson);
      }
    }else{
      ResultSet rs = stmt_mysql.executeQuery(whereDefault+query2);
      while(rs.next()){
          JSONObject tempJson = new JSONObject();
          tempJson.put("uId",rs.getString(1));
          tempJson.put("uName",rs.getString(2));
          tempJson.put("uBirth",rs.getString(3));
          tempJson.put("uEmail",rs.getString(4));
          tempJson.put("uJoinDate",rs.getString(5));
          itemList.add(tempJson);
      }
    }
    search=null;

    jsonList.put("results",itemList);
    conn_mysql.close();
    out.print(jsonList);
} catch(Exception e){
    e.printStackTrace();
}
%>