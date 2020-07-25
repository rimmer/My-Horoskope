## Poll Availability Model

used to enable or disable user choises impact on prophecy

**It is wrapped model**, means that it is mutable object with only one field.

### Library name: `poll_availability`

## Fields:

- `private bool` _switcher

## Methods:

- `bool` value

getter which shows current availability

- 'void' switch ({`Function` actions})

switch boolean value and run given optitional actions after it

## Constructor:
```
PollAvailability({
    @required bool value
})
```