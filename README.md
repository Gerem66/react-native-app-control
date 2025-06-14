# react-native-app-control

Exit / Restart your react native app. Does not invoke a crash notification.

## Setup

React Native `>= 0.60` supports autolinking, so you can simply run:
```bash
npm install react-native-app-control
```

<details>
<summary>Manual linking (for React Native < 0.60)</summary>

If you are using React Native version < 0.60, you will need to link the library manually. Follow these steps:

```bash
npm install react-native-app-control
react-native link react-native-app-control
```

</details>

## Usage

```javascript
import AppControl from 'react-native-app-control';

AppControl.Exit();
AppControl.Restart();
```

### Platform-specific behavior

#### iOS

On iOS, `AppControl.Restart()` displays a localized popup before closing the app.  
The popup language is automatically detected from the device's system language.

#### Android

On Android, `AppControl.Restart()` performs a complete app restart without showing a popup.

## Compatibility

### React Native versions
- **Old architecture**: ✅
- **New architecture**: ✅

### Platforms

- **Android**: ✅ (Tested on Android >= 12)
- **iOS**: ✅ (Tested on iOS >= 18)
- **Web**: ❌ (Not supported)

## Credits

This library is based on the [react-native-exit-app](https://github.com/wumke/react-native-exit-app) library by [wumke](https://github.com/wumke).
