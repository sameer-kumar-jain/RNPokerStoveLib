
# react-native-poker-stove-lib

## Getting started

`$ npm install react-native-poker-stove-lib --save`

### Mostly automatic installation

`$ react-native link react-native-poker-stove-lib`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-poker-stove-lib` and add `RNPokerStoveLib.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPokerStoveLib.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

TO DO

#### Windows
TO DO


## Usage
```javascript
import RNPokerStoveLib from 'react-native-poker-stove-lib';

// TODO: What to do with the module?
RNPokerStoveLib.calculateEquity("O","","7c5c4c3c", "5d4d3d2d",(error, result)=>{
	console.log('RNPokerStoveLib result is', result)
})
```

Most of the time you might get error with h files not found or undefined symbols which is typically solved by providing correct header path in project->target->build settings-> Search Header Path

## Limitations

Currently we only tested ```omaha high``` and we plan to support other. 