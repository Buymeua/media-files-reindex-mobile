# media-files-reindex-mobile

scan media library after upload for fast refresh media library like telegram

## Installation

```sh
npm install media-files-reindex-mobile
```

## Usage


```js
import { scanFile } from 'media-files-reindex-mobile';

// ...

scanFile('/path/to/file').then(() => {
  console.log('File scanned successfully');
}).catch(error => {
  console.error('Error scanning file:', error);
});
```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
