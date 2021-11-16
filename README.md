# react-native-ios-on-demand-resource-loader

React native on demand resources loader module. Works only on ios

## How to run example project
```sh
# install dependencies in the root folder
yarn install

# install pods
cd example/ios
pod install

# go to the "example" folder and run the app
yarn ios
```

## Installation

```sh
yarn install react-native-ios-on-demand-resource-loader
```

## Usage

```js
import { loadResourcesByTag } from 'react-native-ios-on-demand-resource-loader';

// ...

loadResourcesByTag('img_1')
  .then(console.log)
  .catch(console.log);
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
