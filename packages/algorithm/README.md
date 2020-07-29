# Algorithm module

Consists of main app calculation module, calculations and extensions on some classes.

### Library name: `algorithm`

Extension example on astro.dart:

```
extension BasicAstrology on int {
  String get astroSign {
    switch (this.toDateTime.month) {
      case 1:
        if (this.toDateTime.day > 20) return "Aquarius";
        return "Capricorn";
      case 2:
        if (this.toDateTime.day > 20) return "Pisces";
        return "Aquarius";
```

# Main app calculation module:

## final `AgoData` dat:

- final [`PollAvailability`](https://github.com/rimmer/my_prophet/tree/master/packages/models/poll_availability) pollAvailability
- final [`PollByDateRepository`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/pollbydate) pollByDateRepo
- var [`UserEntity`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md#user-entity) user
- var [`UserPoll`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll) currentPoll

## var `MainCalculation` magic:
- **@TODO_ObjectName** calculate(AlgoData dat)

    Input: `AlgoData`

    Output: **@TODO_ObjectName**

    calculates prophecies based on current data

## **@TODO_ObjectName** result()

Input: **@TODO_ObjectName**

Output: **@TODO_ObjectName**

takes output of magic.calculation() and adds user choises to it, if they are enabled

# MainCalculation abstract class

- Pattern Strategy

Is an interface for algorithm implementation.
Implementations are inside folder `variants/`

By default is used _RitesStrategy from `variants`/`algorithm_bgoncharuck.dart`

# UserChoises

Is extension on **@TODO_ObjectName** that returns new **@TODO_ObjectName** with user choises added

```
extension _UserChoises on Object {
  Object addUserChoises(PollByDateRepository repo) => Object
}
```