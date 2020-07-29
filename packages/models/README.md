Models are objects which are:
- Immutable or wrapped
- Models can't have other models as fields, they must be fully seperated
- Depend only on Dart core packages (exception: build-runner packages and meta)
- Easily serializable 
- Use only basic types like int, String, List and no other objects as fields
- Good for composition

**Models which are not following these rules must be considered as dirty and be redone as abstract data classes.**

Models are used:
- As a bridge between data and calculation
- As values for variables and constants
- As fields for data classes, which saved/loaded and transfered
- As a method to store sensitive information

Basic types can be called models too.

```
// with map
final colors= Map<String,int>();
colors.add({"red": 0xFFFF0000});
write(colors.toJson());


// with model
final colors= List<Clr>();
colors.add(Clr("red", 0xFFFF0000));
write(colors.toJson());
```

When you give a new value to integer

```
var steelIngotsCount= 3;
steelIngotsCount= 11;
```

You are basically doing this

```
steelIngotCount= Int(11);
```

Models work in the same way, but have multiple fields.