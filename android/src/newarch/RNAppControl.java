package com.github.Gerem66.RNAppControl;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;

import com.github.Gerem66.RNAppControl.NativeRNAppControlSpec;

public class RNAppControl extends NativeRNAppControlSpec {

    private final RNAppControlImpl delegate;

    public RNAppControl(ReactApplicationContext reactContext) {
        super(reactContext);
        delegate = new RNAppControlImpl(reactContext);
    }

    @NonNull
    @Override
    public String getName() {
        return RNAppControlImpl.NAME;
    }
    
    @Override
    public void Exit() {
        delegate.Exit();
    }

    @Override
    public void Restart() {
        delegate.Restart();
    }
}
