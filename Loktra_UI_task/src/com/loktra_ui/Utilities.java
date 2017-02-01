package com.loktra_ui;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.ArrayList;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Utilities {
	@SuppressWarnings("deprecation")
	public static Movie search_get_movie_detail(String inp_title) throws HttpException, IOException
	{
		Movie ret_movie_details = new Movie();
		/*HttpClient client = new HttpClient();
		HttpMethod method = new GetMethod("http://www.omdbapi.com/?t=in&y=&plot=short&r=json");
 		method.addRequestHeader("Accept", "application/json");
 		int status = client.executeMethod(method);
 		System.out.println("Status:" + status + " client.getstate() " + client.getState());
 		BufferedReader rd = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream()));
 		String line = "";
 		while ((line = rd.readLine()) != null) {
 			System.out.println(line);
 		}*/
 		
 		try {

			@SuppressWarnings("resource")
			DefaultHttpClient httpClient = new DefaultHttpClient();
			String request_url = "http://www.omdbapi.com/?t="+ inp_title +"&y=&plot=short&r=json";
			HttpGet getRequest = new HttpGet(request_url);
			getRequest.addHeader("accept", "application/json");

			HttpResponse response = httpClient.execute(getRequest);

			if (response.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
				   + response.getStatusLine().getStatusCode());
			}

			BufferedReader br = new BufferedReader(
	                         new InputStreamReader((response.getEntity().getContent())));

			String output;
			String resp_output="";
			System.out.println("Output from Server .... "+response.toString()+"\n ");
			while ((output = br.readLine()) != null) {
				resp_output= resp_output+ output;
				//System.out.println(output);
			}
			
			Gson gson = new Gson();
			Type type_movie = new TypeToken<Movie>() {
			}.getType();

			System.out.println("array defined");

			Movie m = new Movie();
			//Mapped the objects and properties
			if(isJSONValid(resp_output))
			{
				System.out.println("Valid JSON : "+resp_output);
				m = gson.fromJson(resp_output,type_movie);
			}
			if (m == null) {
				System.out.println("retrieval of movies failed");
			} else {
				System.out
						.println("Movie detail "+m.getTitle());
				ret_movie_details = m;
			}
			
			httpClient.getConnectionManager().shutdown();

		  } catch (ClientProtocolException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();
		  }
 		return ret_movie_details;
	}

	public static void saveMovieDetails(Movie m) throws IOException
	{
		Gson gson = new Gson();
        Type type = new TypeToken<Movie>() {}.getType();
		String json = gson.toJson(m, type);
		
		String file_name = "added_fav_movies.json";
		File file = new File(file_name);

		// if file doesn't exists, then create it
		if (!file.exists()) {
			file.createNewFile();
		}

		FileWriter fw = new FileWriter(file.getAbsoluteFile(),true);
		@SuppressWarnings("resource")
		BufferedWriter bw = new BufferedWriter(fw);
		
		if(!existFavorites(m.getTitle(),file_name))
		{
			bw.write(m.getTitle() + ":=\n" + json);
		}
        System.out.println(json);
	}
	
	private static boolean existFavorites(String title, String file_name) throws IOException {
		boolean exist = false;
		File file = new File(file_name);
		FileReader fw = new FileReader(file.getAbsoluteFile());
		@SuppressWarnings("resource")
		String line = "";
		String search_str = title + ":=";
		BufferedReader br = new BufferedReader(fw);
		while ((line = br.readLine()) != null && !exist) {
			if(line.contains(search_str))
			{
				exist = true;
			}
		}
		return exist;
	}

	public static ArrayList<Movie> readFavorites() throws IOException
	{
		ArrayList<Movie> movie_list = new ArrayList<Movie>();
		String file_name = "added_fav_movies.json";
		File file = new File(file_name);
		FileReader fw = new FileReader(file.getAbsoluteFile());
		@SuppressWarnings("resource")
		String line = "";
		BufferedReader br = new BufferedReader(fw);
		while ((line = br.readLine()) != null) {
			if(!line.contains(":="))
			{
				String json_movie = line;
				Movie m = new Movie();
				
				Gson gson = new Gson();
				Type type_movie = new TypeToken<Movie>() {
				}.getType();

				System.out.println("array defined");

				if(isJSONValid(json_movie))
				{
					m = gson.fromJson(json_movie,type_movie);
				}
				if (m == null) {
					System.out.println("retrieval of movies failed");
				} else {
					System.out
							.println("Movie detail "+m.getTitle());
				}
				
				movie_list.add(m);
			}
		}
		return movie_list;
	}
	
	private static boolean isJSONValid(String jsonInString) {
	      try {
	    	  Gson gson = new Gson();
	          gson.fromJson(jsonInString, Object.class);
	          return true;
	      } catch(com.google.gson.JsonSyntaxException ex) { 
	          return false;
	      }
	  }
	
	public static void main(String[] args) throws HttpException, IOException
	{
		Utilities.search_get_movie_detail("");
	}
}
