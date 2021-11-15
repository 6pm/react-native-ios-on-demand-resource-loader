import * as React from 'react';

import { StyleSheet, View, Text, Button } from 'react-native';
import { loadResourcesByTag } from 'react-native-ios-on-demand-resource-loader';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  const loadTag1 = () => {
    loadResourcesByTag('img_1').then(console.log).catch(console.log);
  };

  return (
    <View style={styles.container}>
      <Button title="load resource with tag: img_1" onPress={loadTag1} />
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
