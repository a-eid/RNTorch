import * as React from 'react';
import {NativeModules, Button, View} from 'react-native';

const {Torch} = NativeModules;

export function App() {
  return (
    <View style={{justifyContent: 'center', flex: 1}}>
      <Button title="On" onPress={() => Torch.on()} />
      <Button title="Off" onPress={() => Torch.off()} />
    </View>
  );
}
