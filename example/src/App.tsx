import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { check } from 'react-native-ismuted-device';

export default function App() {
  const [result, setResult] = useState(0);

  useEffect(() => {
    handleCheck();
  }, []);

  const handleCheck = () => {
    const test = check(3, 7);
    setResult(test);
  };

  return (
    <View style={styles.container}>
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
