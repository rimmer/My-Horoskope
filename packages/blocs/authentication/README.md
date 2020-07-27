# Authentication BLoC

Authentication is used to register or load registred user from local storage.

### Input Events (`AuthenticationEvent`):
- AppStarted
- AuthEvent

### Output States (`AuthenticationState`):

#### INITIAL:
- Uninitialized

#### AppStarted:
- Authenticated
- Unauthenticated

#### AuthEvent:
- Authenticated
- Unauthenticated