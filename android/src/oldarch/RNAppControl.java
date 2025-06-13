package com.github.Gerem66.RNAppControl;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import android.util.Log;

public class RNAppControl extends ReactContextBaseJavaModule {

    private final RNAppControlImpl delegate;

    public RNAppControl(ReactApplicationContext reactContext) {
        super(reactContext);
        delegate = new RNAppControlImpl(reactContext);
    }

    @Override
    public String getName() {
        return RNAppControlImpl.NAME;
    }

    @ReactMethod
    public void Exit() {
        delegate.Exit();
    }

    @ReactMethod
    public void Restart() {
        delegate.Restart();
    }

    @ReactMethod
    public void RestartApp() {
        delegate.RestartApp();
    }
}
