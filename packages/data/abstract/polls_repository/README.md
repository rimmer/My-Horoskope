# Poll by Date data

Is an abstract data module which have:
- `PollByDate` entity
- `PollByDateRepository` data controller

It is needed to correctly save one user poll per date which is used as a dt integer key.

Why not use a Map itself:
- Provider package and inherited widgets in Flutter work best with a concrete instances of a concrete objects in a search tree.
- Abstraction.
- DRY, less code for serialziation, it is written once.

## Entity:

`class PollByDate` with only one field
- [`Map<int, UserPoll>`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll/README.md) date

Constructor:
```
PollByDate({
    Map<int, UserPoll> map
}) : date = map ?? {};
```

## Data Controller:

Reposiory pattern.

---

`abstract class PollByDateRepository`

---

var `PollByDate` current [`UserPoll`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll/README.md)s

variable which stores all polls of current loaded [`UserEntity`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md#user-entity).


--- 
`Future<bool>` save(int userid)

`Future<bool>` load(int userid)

loads or save ***all*** user poles by user id from whatever implemented in `data`/`platform`

---

[`UserPoll`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll/README.md) add({
    @required `int` dt, 
    @required [`UserPoll`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll/README.md) poll
})

adds poll by its dt key, actually, must be an ordinary map adding.

--- 

[`UserPoll`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/userpoll/README.md) get todayPoll

is a current day poll, basically must be just currentUserPolls.date[dtDay]