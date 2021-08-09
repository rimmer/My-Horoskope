# An App That Reveals Future

## Building
In order to get all dependencies, run:
* Win: `dart .\packages\multi_pub_get.dart .\packages`
* Linux: `dart ./packages/multi_pub_get.dart ./packages`

> If dart is not in your path, you can find it in `flutter\bin\cache\dart-sdk\bin`.

## SVG
### Preparing files
1. place `defs` tag in the start of file (after`xmlns` tag ends)
2. https://petercollingridge.appspot.com/svg-editor
- Conservative
- Remove whitespace
- use CSS

![image](https://user-images.githubusercontent.com/25586948/112624119-d9989b00-8e35-11eb-9d19-22422fcdc169.png)

3. Convert svg's to `si` format, if using  `jovial_svg` loader (see below)

### Converting to `SI`
1. Activate `jovial_svg` executables `flutter pub global activate jovial_svg`
2. Run `svg_to_si` against all svgs that you have added one by one (`svg_to_si <path to file>`)
3. Assets now have the following structure:
   1. `assets/<subfolder>/svg` <= here you place original svg (DO NOT ADD TO ASSETS in pubspec.yaml)
   2. `assets/<subfolder>/si` <= here you place compiled `si` files (ADD THIS TO ASSETS in pubspec.yaml)