<%@page import="com.loktra_ui.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    margin-left: 10%;
    width: 80%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String m_title = request.getParameter("movie_title");
if(m_title==null)
{
	out.println("<center><h2>Search for movies on OMDB</h2> <a href=\"FavoritesList.jsp\" ><input type=\"button\" style=\"width:20%; height:20%; border-radius: 10px; background-color:aqua; ; font-size: x-large;\" value=\"See Favorites\"></a></B></h2></center><br /> <br /> ");
}
else
{
	Movie movie_details = Utilities.search_get_movie_detail(m_title);
	if(movie_details==null || movie_details.getTitle()==null)
	{
		out.println("Something wrong while retrival");
	}
	else
	{
	%>
	
	<center>
	<h2><B>
	<a href="FavoritesList.jsp" ><input type="button" style="width:20%; height:20%; border-radius: 10px; background-color:aqua; ; font-size: x-large;" value="See Favorites">
  </a>
	<br/>
  <br/>
	Search Details for "<%=m_title %>" <a href="addMovie.jsp?m_title=<%=m_title %>" ><input type="button" style="width:20%; height:20%; border-radius: 10px; background-color:aqua; ; font-size: x-large;" value="Add in favorites">
  </a>
  </B></h2></center>
	<table>
	<tr>
	<th>Field</th>
	<th>Value</th>
	</tr>
<tr><td>Title</td><td>
<%=movie_details.getTitle()%>
</td></tr>
<tr><td>Year</td><td>
<%=movie_details.getYear()%>
</td></tr>
<tr><td>Rated</td><td>
<%=movie_details.getRated()%>
</td></tr>
<tr><td>Released</td><td>
<%=movie_details.getReleased()%>
</td></tr>
<tr><td>Runtime</td><td>
<%=movie_details.getRuntime()%>
</td></tr>
<tr><td>Genre</td><td>
<%=movie_details.getGenre()%>
</td></tr>
<tr><td>Director</td><td>
<%=movie_details.getDirector()%>
</td></tr>
<tr><td>Writer</td><td>
<%=movie_details.getWriter()%>
</td></tr>
<tr><td>Actors</td><td>
<%=movie_details.getActors()%>
</td></tr>
<tr><td>Plot</td><td>
<%=movie_details.getPlot()%>
</td></tr>
<tr><td>Language</td><td>
<%=movie_details.getLanguage()%>
</td></tr>
<tr><td>Country</td><td>
<%=movie_details.getCountry()%>
</td></tr>
<tr><td>Awards</td><td>
<%=movie_details.getAwards()%>
</td></tr>
<tr><td>Poster</td><td>
<%=movie_details.getPoster()%>
</td></tr>
<tr><td>Metascore</td><td>
<%=movie_details.getMetascore()%>
</td></tr>
<tr><td>imdbRating</td><td>
<%=movie_details.getImdbRating()%>
</td></tr>
<tr><td>imdbVotes</td><td>
<%=movie_details.getImdbVotes()%>
</td></tr>
<tr><td>imdbID</td><td>
<%=movie_details.getImdbID()%>
</td></tr>
<tr><td>Type</td><td>
<%=movie_details.getType()%>
</td></tr>
<tr><td>Response</td><td>
<%=movie_details.getResponse()%>
</td></tr>

	</table>
	<%
	}
}
%>
<div align="center">
<form action="LibraryUI.jsp" method="post">
  <input type="text" style=" height:40px; font-size:100%; border-radius: 10px;" placeholder = "Search movie with title" name="movie_title" >
  <input type="submit" style="width:20%; height:20%; border-radius: 10px; background-color:aqua ; font-size: x-large;" value="Search">
  
</form>
</div>
</body>
</html>