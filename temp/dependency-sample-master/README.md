# EzoRed::Sample::GreetingMessage

This is a simple `Greeting Message` example to test all resources from Djinni tool and the bridge between platform code and C++ code.  

### How to use it with C++?

```c++
#include <ezored/sample/GreetingMessage.hpp>

auto gm = std::make_shared<EzoRed::Sample::GreetingMessage>();
gm->setMessage("Your message");
gm->printMessage();

std::cout << gm->getMessage() << std::endl;
```

### How to use it with Swift?

Add the following lines to your bridge header file in Swift project:

```c++
#import <EzoRed/EZRGreetingMessageBridge.h>
#import <EzoRed/EZRGreetingMessagePlatformServiceImpl.h>
```

And in your swift class:

```swift
guard let gm = EZRGreetingMessageBridge.sharedInstance() else {
    return
}

gm.setPlatformService(EZRGreetingMessagePlatformServiceImpl())
gm.setMessage("Test")
gm.printMessage()

gm.showGreetingMessageAlert("Your title", message: "Your message")
```

### How to use it with Android?

```java
package com.ezored.sampleapp;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.ezored.sample.GreetingMessageBridge;
import com.ezored.sample.GreetingMessagePlatformServiceImpl;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("EzoRed");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        GreetingMessageBridge gm = GreetingMessageBridge.sharedInstance();
        gm.setPlatformService(new GreetingMessagePlatformServiceImpl(this));

        gm.setMessage("Simple message");
        gm.printMessage();

        gm.showGreetingMessageAlert("Your title", "Your message");
    }

}
```