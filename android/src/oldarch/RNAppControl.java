package com.gerem66.RNAppControl;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

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
}
