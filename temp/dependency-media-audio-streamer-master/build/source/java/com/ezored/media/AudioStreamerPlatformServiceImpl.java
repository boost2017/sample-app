package com.ezored.media;

import android.content.Context;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.util.Log;

import java.io.IOException;
import java.util.Locale;

public class AudioStreamerPlatformServiceImpl extends AudioStreamerPlatformService {
    private String TAG = "AudioStreamerPlatformServiceImpl";

    private Context mContext;
    private MediaPlayer mMediaPlayer;
    private String mUrl;

    public AudioStreamerPlatformServiceImpl(Context context) {
        mContext = context;

        mMediaPlayer = new MediaPlayer();
        mMediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
    }

    @Override
    public String getUrl() {
        return mUrl;
    }

    @Override
    public void setUrl(String url) {
        if (mContext != null) {
            mUrl = url;

            //
            // Stop the media player if it's currently playing some audio
            //
            if (isPlaying()) {
                mMediaPlayer.stop();
            }

            //
            // Try loading in the new url as a new data source for the media player
            //
            try {
                mMediaPlayer.setDataSource(url);
                mMediaPlayer.prepare();
            } catch (IOException e) {
                Log.d(TAG, String.format(Locale.getDefault(), "Error: %s", e.getLocalizedMessage()));
            }
        }
    }

    @Override
    public boolean isPlaying() {
        return mMediaPlayer.isPlaying();
    }

    @Override
    public void play() {
        mMediaPlayer.start();
    }

    @Override
    public void pause() {
        mMediaPlayer.pause();
    }

}
