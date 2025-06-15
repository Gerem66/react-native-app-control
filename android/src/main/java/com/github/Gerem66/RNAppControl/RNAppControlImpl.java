package com.gerem66.RNAppControl;

import com.facebook.react.bridge.ReactApplicationContext;
import android.content.Intent;
import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.app.PendingIntent;
import android.app.AlarmManager;
import android.content.Context;

public class RNAppControlImpl {

    public static final String NAME = "RNAppControl";

    ReactApplicationContext RCTContext;

    public RNAppControlImpl(ReactApplicationContext reactContext) {
        RCTContext = reactContext;
    }

    public void Exit() {
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    public void Restart() {
        Activity currentActivity = RCTContext.getCurrentActivity();
        if (currentActivity != null) {
            // Ensure we're on the main thread
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    currentActivity.recreate();
                }
            });
        }
    }
}
