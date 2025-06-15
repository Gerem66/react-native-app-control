import NativeRNAppControl from "./src/NativeRNAppControl";

var RNAppControl = {
  Exit: function() {
    NativeRNAppControl.Exit();
  },
  Restart: function() {
    NativeRNAppControl.Restart();
  }
};

export default RNAppControl;
