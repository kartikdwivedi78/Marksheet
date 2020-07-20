<%@ page import="java.io.*, java.sql.*,java.util.*" %>

<%!

	Connection cn;
	PreparedStatement ps1,ps2;
	int rno;
	String dob;

	public void jspInit()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmatics","root","kartik@mysql");
			
			ps1 = cn.prepareStatement("select * from studs where rno=? and dob=?");
			ps2 = cn.prepareStatement("select * from marks where rno=?");			
		}
		catch(ClassNotFoundException e)
		{}
		catch(SQLException e)
		{}
	}
	
	public void jspDestroy()
	{
		try
		{
			cn.close();
		}
		catch(SQLException e)
		{}
	}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Marksheet</title>
</head>
<body bgcolor=teal>
	<center>
		<br><br><br><br>
		<font face='lucida console' size=6 color=orange>Jai Narayan Vyas University</font>
		<br><br>
		<font face='lucida console' size=4 color=orange>MARKS-SHEET</font>
		<br><br>
		<%
	
		application.setAttribute("pre",ps2);
		
		
		
		rno = Integer.parseInt(request.getParameter("rno"));
		dob = request.getParameter("dob");
		
		try
		{
			ps1.setInt(1,rno);
			ps1.setString(2,dob);
			
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next())
			{
				if(rno==rs1.getInt("rno") && dob.equals(rs1.getString("dob")))
				{
					ps2.setInt(1,rno);
					
					ResultSet rs2 = ps2.executeQuery();
		%>
					<table border=1>
						<tr>
							<th style='text-align:left;'><font face='lucida console' size=4 color=white>Roll Number</font></th>
							<td style='text-align:left;'><font face='lucida console' size=4 color=white><%= rs1.getInt("rno") %></font></td>
						</tr>
						<tr>
							<th style='text-align:left;'><font face='lucida console' size=4 color=white>Name</font></th>
							<td style='text-align:left;'><font face='lucida console' size=4 color=white><%= rs1.getString("fname")+" "+rs1.getString("lname") %></font></td>
						</tr>
						<tr>
						<th style='text-align:left;'><font face='lucida console' size=4 color=white>Branch</font></th>
						<td style='text-align:left;'><font face='lucida console' size=4 color=white><%= rs1.getString("branch") %></font></td>
						</tr>
					</table>
					<br><br>
					<table border=1>
						<tr>
							<th bgcolor=red><font face='lucida console' size=4 color=white>Semester</font></th>
							<th bgcolor=red><font face='lucida console' size=4 color=white>Subject1</font></th>
							<th bgcolor=red><font face='lucida console' size=4 color=white>Subject2</font></th>
							<th bgcolor=red><font face='lucida console' size=4 color=white>Subject3</font></th>
							<th bgcolor=red><font face='lucida console' size=4 color=white>Total</font></th>
						</tr>
		<%
					while(rs2.next())
					{
						int tot = rs2.getInt("sub1")+rs2.getInt("sub2")+rs2.getInt("sub3");
		%>
						<tr>
							<td align=center><font face='lucida console' size=4 color=white><%= rs2.getInt("sem") %></font></td>
							<td align=center><font face='lucida console' size=4 color=white><%= rs2.getInt("sub1") %></font></td>
							<td align=center><font face='lucida console' size=4 color=white><%= rs2.getInt("sub2") %></font></td>
							<td align=center><font face='lucida console' size=4 color=white><%= rs2.getInt("sub3") %></font></td>
							<td align=center><font face='lucida console' size=4 color=white><%= tot %></font></td>
						</tr>
		<%
					}
				}
			}
		}
		catch(SQLException e)
		{}
		
		%>
		</table>
		<br><br>
		<form action=download.jsp>
			<input type=hidden name=rno value=<%= rno %>>
			<input type=submit value=Download>
		</form>
	</center>
</body>
</html>
