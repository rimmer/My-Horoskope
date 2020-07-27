# User Poll BLoC

User poll used by user to say have he feel about yesterday. This information will be used in algorithm to see if it connects with astrology results and calibrate it.
This blocs supervise user poll widget: when user make a choise or want to give more complex answers. 

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