package com.auction.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;


public class GoogleApi {
	 public static JsonNode getAccessToken(String autorize_code) {
		 
	        final String RequestUrl = "https://www.googleapis.com/oauth2/v4/token";
	 
	        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	        postParams.add(new BasicNameValuePair("client_id", "1001790183901-cb9d2bt84dqu3v7e0gfsg6rtjrpapdd7.apps.googleusercontent.com"));
	        postParams.add(new BasicNameValuePair("client_secret", "JQKptU5Rh94iLgjluxBxvmSQ"));
	        postParams.add(new BasicNameValuePair("redirect_uri", "http://yejin0682.cafe24.com/oauth2callback")); // 리다이렉트 URI
	        postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
	 
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	        JsonNode returnNode = null;
	 
	        try {
	            post.setEntity(new UrlEncodedFormEntity(postParams));
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Post parameters : " + postParams);
	            System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());

	 
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	        return returnNode;
	 
	    }
	 public static JsonNode getGoogleUserInfo(String autorize_code) {
		 
	        final String RequestUrl = "https://www.googleapis.com/oauth2/v2/userinfo";
	 
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpGet get = new HttpGet(RequestUrl);
	 
	        JsonNode returnNode = null;
	        
	        // add header
	        get.addHeader("Authorization", "Bearer " + autorize_code);
	 
	        try {
	            final HttpResponse response = client.execute(get);
	            final int responseCode = response.getStatusLine().getStatusCode();
	            
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	            
	            System.out.println("\nSending 'GET' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	 
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	        return returnNode;
	 
	    }


}

