<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="application/vnd.ms-excel"%>
<%@page errorPage="ShowError.jsp"%>
<html><center>
<table border=1>
	<tr>
		<th bgcolor=red><font face='lucida console' size=4 color=white>Semester</font></th>
		<th bgcolor=red><font face='lucida console' size=4 color=white>Subject1</font></th>
		<th bgcolor=red><font face='lucida console' size=4 color=white>Subject2</font></th>
		<th bgcolor=red><font face='lucida console' size=4 color=white>Subject3</font></th>
		<th bgcolor=red><font face='lucida console' size=4 color=white>Total</font></th>
	</tr>
		
<%
int rno;

PreparedStatement ps=(PreparedStatement)application.getAttribute("pre");

rno = Integer.parseInt(request.getParameter("rno"));

	ps.setInt(1,rno);
	ResultSet rs = ps.executeQuery();

	while(rs.next())
	{
		int tot = rs.getInt("sub1")+rs.getInt("sub2")+rs.getInt("sub3");
%>
		<tr>
			<td align=center><font face='lucida console' size=4 color=white><%= rs.getInt("sem") %></font></td>
			<td align=center><font face='lucida console' size=4 color=white><%= rs.getInt("sub1") %></font></td>
			<td align=center><font face='lucida console' size=4 color=white><%= rs.getInt("sub2") %></font></td>
			<td align=center><font face='lucida console' size=4 color=white><%= rs.getInt("sub3") %></font></td>
			<td align=center><font face='lucida console' size=4 color=white><%= tot %></font></td>
		</tr>
<%
	}
	
%>

</table>
</center></html>