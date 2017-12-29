# EzoRed::Http::HttpClient

This is a simple `HttpClient` to make HTTP requests.  

All methods return a `EzoRed::Http::HttpResponse` object that contains all HTTP response data.  

### How to use it?

```c++
#include <ezored/http/HttpClient.hpp>

auto client = std::make_shared<EzoRed::Http::HttpClient>();
auto response = client->doGet("http://httpbin.org/get");

std::cout << response.code << std::endl;
std::cout << response.body << std::endl;
```

### How to use it with Swift?

```swift
guard let http = EZRHttpClientBridge.create() else {
    return
}

http.setPlatformService(EZRHttpClientPlatformServiceImpl())

DispatchQueue.global(qos: .background).async {
    let response = http.doGet("https://httpbin.org/delay/3")
    
    DispatchQueue.main.async {
        let message = "Status: \(response.code)\n\nMessage: \(response.body)"

        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
```

You can make all RESTful request types:

```swift
let responseGet = http.doGet("https://httpbin.org/get")  

let responseHead = http.doHead("https://httpbin.org/head")

let responsePost = http.doPost("https://httpbin.org/post", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")  

let responsePut = http.doPut("https://httpbin.org/put", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")  

let responsePatch = http.doPatch("https://httpbin.org/patch", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")  

let responseDelete = http.doDelete("https://httpbin.org/delete", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")  
```

### How to use it with Android?

```java
package com.ezored.sampleapp;

import android.content.Context;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;

import com.ezored.http.HttpClientBridge;
import com.ezored.http.HttpClientPlatformServiceImpl;
import com.ezored.http.HttpResponse;

import java.lang.ref.WeakReference;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("EzoRed");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        DoLoginAsyncTask task = new DoLoginAsyncTask(this);
        task.execute();
    }

    private static class DoLoginAsyncTask extends AsyncTask<Void, Void, HttpResponse> {

        private WeakReference<Context> context;

        DoLoginAsyncTask(Context context) {
            this.context = new WeakReference<>(context);
        }

        @Override
        protected HttpResponse doInBackground(Void... voids) {
            HttpClientBridge http = HttpClientBridge.sharedInstance();
            http.setPlatformService(new HttpClientPlatformServiceImpl());

            return http.doGet("https://httpbin.org/get");
        }

        @Override
        protected void onPostExecute(HttpResponse httpResponse) {
            AlertDialog.Builder builder = new AlertDialog.Builder(context.get());

            builder.setTitle("Message");
            builder.setMessage(String.format(Locale.getDefault(), "Status: %d\n\nBody: %s", httpResponse.getCode(), httpResponse.getBody()));
            builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            });

            builder.show();
        }
    }

}
```

You can make all RESTful request types:  

```java
http.doGet("https://httpbin.org/get");  

http.doHead("https://httpbin.org/head");  

http.doPost("https://httpbin.org/post", "{\"username\": \"demo\", \"password\": \"demo\"}", "application/json");  

http.doPut("https://httpbin.org/put", "{\"username\": \"demo\", \"password\": \"demo\"}", "application/json")  

http.doPatch("https://httpbin.org/patch", "{\"username\": \"demo\", \"password\": \"demo\"}", "application/json")  

http.doDelete("https://httpbin.org/delete", "{\"username\": \"demo\", \"password\": \"demo\"}", "application/json")  
```