package com.ezored.http;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.ezored.http.HttpClientPlatformService;
import com.ezored.http.HttpResponse;

/**
 * Platform-Specific implementation of Http Client class
 */
public class HttpClientPlatformServiceImpl extends HttpClientPlatformService {

    public HttpResponse doGet(String url) {
        return doRequest(url, "GET", null, null);
    }

    public HttpResponse doHead(String url) {
        return doRequest(url, "HEAD", null, null);
    }

    public HttpResponse doPost(String url, String data, String contentType) {
        return doRequest(url, "POST", data, contentType);
    }

    public HttpResponse doPut(String url, String data, String contentType) {
        return doRequest(url, "PUT", data, contentType);
    }

    public HttpResponse doDelete(String url, String data, String contentType) {
        return doRequest(url, "DELETE", data, contentType);
    }

    public HttpResponse doPatch(String url, String data, String contentType) {
        return doRequest(url, "PATCH", data, contentType);
    }

    public HttpResponse doRequest(String url, String method, String data, String contentType) {
        try {
            // general
            URL aurl = new URL(url);
            HttpURLConnection connection;
            InputStream is;

            connection = (HttpURLConnection) aurl.openConnection();
            connection.setRequestMethod(method);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (compatible)");
            connection.setRequestProperty("Accept", "*/*");

            // request content type
            if (contentType != null) {
                connection.setRequestProperty("Content-Type", contentType);
            }

            // request data
            if (data != null) {
                connection.setDoOutput(true);

                DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
                dStream.writeBytes(data);
                dStream.flush();
                dStream.close();
            } else {
                connection.setDoOutput(false);
            }

            connection.connect();

            // prepare and do the request
            is = connection.getInputStream();
            int responseCode = connection.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder responseBody = new StringBuilder();
            String line = "";

            while ((line = br.readLine()) != null) {
                responseBody.append(line);
            }

            br.close();

            return new HttpResponse(responseCode, responseBody.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return new HttpResponse(0, "");
        }
    }

}
