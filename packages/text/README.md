## Language Module

This module done for localization purpose.

### Library name: `language`

# Structure:

## Interface 

- abstract class `Locale` in src/interface.dart

It is an interface and must be implemented by language files.
It has getters of `String` or `Map<Strng,String>`. 

```
abstract class Locale {
    String get name;
    String get birthdate;
    String get birthcountry;
    Map<String, String> get prophecyId;
    ...
    other fields
}
```

## Implementation:

class `RussianLocale` implements it by final `Strings` and `Map` getter which

```
class RussianLocale implements Locale {
    final String name = "имя";
    final String birthdate = "дата рождения";
    final String birthcountry = "страна, в которой вы родились";
    Map<String, String> get prophecyId => const {
        "LUCK": "Удача",
        "AMBITION": "Амбиции",
        "INTELLIGENCE": "Интеллект",
      };
}
```

## Library:

library has a class called `lang` which has `static` fields and variable **"locale"** that can be used to switch language.

```
class lang {
    static Locale locale = RussianLocale();

    static String name = locale.name;
    static String birthdate = locale.birthdate;
    static String birthcountry = locale.birthcountry;
    static String birthplace = locale.birthplace;

    static Map<String, String> get prophecyId => 
    locale.prophecyId;
} 
```

## Example:

```
Text(
    lang.birthcountry, 
    style: TextStyle(color: Colors.purple),
),
```

```
lang.locale= EnglishLocale();
print(lang.name);
lang.locale= ChineseLocale();
print(lang.name);
```