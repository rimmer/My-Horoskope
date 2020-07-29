# User Poll BLoC

User poll is used by user to say have he feels about yesterday. This information will be used in algorithm to see if it connects with astrology results and help to calibrate it.
This bloc supervise how user poll widget works. For example, when user makes a choise or want to give more complex answers. 

### Library name: `user_poll`

### Input Events (`UserPollEvent`):
- PollNotUsed
- PollUsed
- PollSimple
- PollComplex

### Output States (`UserPollState`):
- UserPollInitial
- UserPollChanged 
```
class UserPollChanged {
  final bool isSimple;
  final UserPoll poll;
  
  UserPollChanged({
      @required poll, 
      @required isSimple
    });
}
```