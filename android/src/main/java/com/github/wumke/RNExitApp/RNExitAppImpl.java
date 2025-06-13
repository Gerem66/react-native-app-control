package com.github.Gerem66.RNAppControl;

import com.facebook.react.bridge.ReactApplicationContext;
import android.content.Intent;
import android.app.Activity;
import android.os.Handler;
import android.os.Looper;

class RNAppControlImpl {

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
            // Get the package manager and launch intent for this application
            Intent intent = RCTContext.getPackageManager().getLaunchIntentForPackage(RCTContext.getPackageName());
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
                
                // Use Handler to delay the restart slightly to ensure clean shutdown
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        RCTContext.startActivity(intent);
                        // Kill the current process to ensure clean restart
                        android.os.Process.killProcess(android.os.Process.myPid());
                    }
                }, 100);
            }
        }
    }
}
