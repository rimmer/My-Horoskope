## Impact Model

Used to store additional personal impact to calculated prophecies

### Library name: `impact_model`

## Fields:
- `String` iconName

will help to find correct file name which will be used as icon

- `String` text

impact explaination

- `double` value

how much impacted value will be changed

## Constructor:
```
  ImpactModel({
    @required this.iconName,
    @required this.text,
    @required this.value,
  });
```