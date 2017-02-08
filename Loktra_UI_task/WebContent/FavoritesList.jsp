<%@page import="com.loktra_ui.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<script type="text/javascript">
function displayToggle( div_id) {
    var x = document.getElementById(div_id);
    console.log("style display "+ x.style.display);
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}
</script>
</head>
<body>
<%

	ArrayList<Movie> movies = new ArrayList<Movie>();
	movies = Utilities.readFavorites();
	int i =0;
	out.println("<center><h2>Saved favorites movies details on OMDB are: </h2></center>");
	for(Movie movie_details : movies )
	{
		i++;
	if(movie_details==null || movie_details.getTitle()==null)
	{
		out.println("Something wrong while retrival");
	}
	else
	{
		
	%>
	<h3><B>Details for <button style="border-radius: 10px; background-color: white; height: 55px;" onclick="displayToggle(<%=i%>)"><p style="color: maroon; font-size: large; font-weight: bold;">"<%=movie_details.getTitle() %>"</p></button></B></h3>
	<table style="display: none;" id=<%=i%>>
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
</body>
</html>