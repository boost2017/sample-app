# EzoRed::Media::AudioStreamer

This is a simple `Audio Streamer` example to test all resources from Djinni tool and the bridge between platform code and C++ code.  

### How to use it with Swift?

Add the following lines to your bridge header file in Swift project:

```c++
#import <EzoRed/EZRAudioStreamerBridge.h>
#import <EzoRed/EZRAudioStreamerPlatformServiceImpl.h>
```

And in your swift class:

```swift
guard let audio = EZRAudioStreamerBridge.sharedInstance() else {
    return
}

if audio.getPlatformService() == nil {
    audio.setPlatformService(EZRAudioStreamerPlatformServiceImpl())
    audio.setUrl("https://www.ezored.com/extras/audio/sample-music.mp3")
}

let isPlaying = audio.isPlaying()

if isPlaying {
    audio.pause()
} else {
    audio.play()
}
```

### How to use it with Android?

```java
package com.ezored.sampleapp;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.ezored.media.AudioStreamerBridge;
import com.ezored.media.AudioStreamerPlatformServiceImpl;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("EzoRed");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        AudioStreamerBridge audio = AudioStreamerBridge.sharedInstance();

        if (audio.getPlatformService() == null) {
            audio.setPlatformService(new AudioStreamerPlatformServiceImpl(this));
            audio.setUrl("https://www.ezored.com/extras/audio/sample-music.mp3");
        }

        boolean isPlaying = audio.isPlaying();

        if (isPlaying) {
            audio.pause();
        } else {
            audio.play();
        }
    }

}
```

On Android, put the following permissions to "ApplicationManifest.xml" file:

```
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```