import { useEffect } from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { scanFile } from 'media-files-reindex-mobile';

export default function App() {
  useEffect(() => {
    scanFile('fileUri');
  }, []);

  return (
    <View style={styles.container}>
      <Text>Re Scan file index</Text>
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
