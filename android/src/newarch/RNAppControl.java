package com.gerem66.RNAppControl;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.gerem66.RNAppControl.specs.NativeRNAppControlSpec;

public class RNAppControl extends NativeRNAppControlSpec {

    private final RNAppControlImpl delegate;

    public RNAppControl(ReactApplicationContext reactContext) {
        super(reactContext);
        delegate = new RNAppControlImpl(reactContext);
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
