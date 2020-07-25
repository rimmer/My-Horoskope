## Poll Model

poll model stores the value and type of user impact poles

### Library name: `poll_model`

## Fields:
- `enum` type

- - MOOD,
- - PRODUCTIVITY,
- - RELATIONSHIPS,
- - SELFDEVELOPMENT,
- - PHYSICAL_ACTIVITY,

- `int` value

for now it is value from one to six

## Constructor:
```
PollModel({
    @required this.type, 
    this.value = 3
})
```