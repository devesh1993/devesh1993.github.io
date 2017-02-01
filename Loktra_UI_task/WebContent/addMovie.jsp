<%@page import="com.loktra_ui.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String m_title = request.getParameter("m_title");
if(m_title==null)
{
	out.println("<h2>Search for movies on OMDB</h2>");
}
else
{
	Movie movie_details = Utilities.search_get_movie_detail(m_title);
	Utilities.saveMovieDetails(movie_details);
}
%>
<%
    String redirectURL = "http://localhost:8080/Loktra_UI_task/LibraryUI.jsp";
    response.sendRedirect(redirectURL);
%>
</body>
</html>