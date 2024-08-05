import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'media-files-reindex-mobile' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

interface MyMediaScannerType {
  scanFile(path: string): Promise<void>;
}

const MyMediaScanner: MyMediaScannerType = NativeModules.MyMediaScanner
  ? NativeModules.MyMediaScanner
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function scanFile(path: string): Promise<void> {
  return MyMediaScanner.scanFile(path);
}
