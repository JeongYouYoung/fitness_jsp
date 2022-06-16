<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

 request.setCharacterEncoding("utf-8");
String uId = request.getParameter("uId");
String cDate = request.getParameter("cDate");

 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 String whereDefault = "select cTitle, cFlexibility, cEndurance, cWits, cMuscularStrength, cCardiovascularEndurance, cContent, cDate, cCode from calendar where user_uId = '" + uId + "'";
 String query2 = " and cDate = '"+cDate+"'";

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();


    if(cDate.equals(null)){
        ResultSet rs = stmt_mysql.executeQuery(whereDefault);
        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("cTitle",rs.getString(1));
            tempJson.put("cFlexibility",rs.getInt(2));
            tempJson.put("cEndurance",rs.getInt(3));
            tempJson.put("cWits",rs.getInt(4));
            tempJson.put("cMuscularStrength",rs.getInt(5));
            tempJson.put("cCardiovascularEndurance",rs.getInt(6));
            tempJson.put("cContent",rs.getString(7));
            tempJson.put("cDate",rs.getString(8));
            tempJson.put("cCode",rs.getInt(9));
            itemList.add(tempJson);
        }
    }else{
        ResultSet rs = stmt_mysql.executeQuery(whereDefault+query2);
        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("cTitle",rs.getString(1));
            tempJson.put("cFlexibility",rs.getInt(2));
            tempJson.put("cEndurance",rs.getInt(3));
            tempJson.put("cWits",rs.getInt(4));
            tempJson.put("cMuscularStrength",rs.getInt(5));
            tempJson.put("cCardiovascularEndurance",rs.getInt(6));
            tempJson.put("cContent",rs.getString(7));
            tempJson.put("cDate",rs.getString(8));
            tempJson.put("cCode",rs.getInt(9));
            itemList.add(tempJson);
        }
    }


    jsonList.put("results",itemList);
    conn_mysql.close();
    out.print(jsonList);
} catch(Exception e){
    e.printStackTrace();
}
%>