## Prophecy Model

exact prophecy that will be showed

**it uses both String as a field-indificator for low connectivity of modules and enum for constructor**

why is that needed?

from `langauge` module:
```
Map<String, String> get prophecyId;
```
from `data/platform/prophecies_repository_flutter_old`
```
  {
    "model": {
      "id": "INTERNAL_STRENGTH",
      "value": 4.9
    },
    "changes": []
  },
  {
    "model": {
      "id": "MOODLET",
      "value": 6.5
    },
    "changes": []
  },
```

This will not need any dependency on this model.

### Library name: `prophecy_model`

## Fields:
- `String` id;
- `double` value;

## Constructor:
```
ProphecyModel({
    @required ProphecyId id, 
    @required this.value
}) 
: this.id = id.str
```

## Enums and extensions:

- `ProphecyId`.str 

convert enum to `String` 

- `String`.prophecyId

convert `String` to enum

### Enum:

```
enum ProphecyId {
  LUCK,
  INTERNAL_STRENGTH,
  MOODLET,
  AMBITION,
  INTELLIGENCE,
}
```