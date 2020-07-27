## Language Module

This module done for localization purpose.

# Structure:

## Interface 

- abstract class `Locale` in src/interface.dart

Which has getters of `String` or `Map<Strng,String>` is interface which must be implemented by language file

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

## Implementation example

- implementation example: 

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

library has a class called `lang` with has `static` fields and variable **"locale"** that can be used to switch language.

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