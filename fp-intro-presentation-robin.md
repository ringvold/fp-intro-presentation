# Funksjonell Programmering

---

## Sammenligne med Objektorientert Programmering

---

## Strukturert Data

```java
class Person {
    String name;
    int age;
}
```

---

## Metoder

```java
class Person {
    String name;
    int age;

    public String getName() {
        return this.name;
    }

    public boolean oldEnoughToDrink() {
        return this.age >= 18;
    }
}
```

---

## Funksjoner

```elm
module Data.Person exposing (Person, getAge, oldEnoughToDrink)

type Person = 
    Person { name : String, age : Int }

getName : Person -> String
getName (Person fields) =
    fields.name

oldEnoughToDrink : Person -> Bool
oldEnoughToDrink (Person fields) =
    fields.age >= 18
```

---

## Løkker

```java
int averageAge(List<Person> persons) {
    int sumAge = 0;
    for (var p : persons) {
        sumAge += p.age
    }

    return sumAge / persons.length;
}
```

---

## Rekursive funksjoner

```elm
averageAge : List Person -> Int
averageAge persons =
    (sumAge persons 0) // (List.length persons)

sumAge : List Person -> Int -> Int
sumAge persons summedAge =
    case persons of
        [] -> summedAge
        p :: ps -> sumAge ps (summedAge + p.age)
```

---

## Løkkeabstraksjoner

```elm
averageAge : List Person -> Int
averageAge persons =
    persons
    |> List.map .age
    |> List.sum
    |> (\summedAge -> summedAge // (List.length persons)
```

---

## "Alt" er funksjoner

```elm
averageAge : List Person -> Int
averageAge persons =
    persons
    |> List.map .age
    |> List.foldl (+) 0
    |> (\summedAge -> summedAge // (List.length persons)
```

---

## Kondisjonell logikk

```elm
oldEnoughToDrink : Person -> Bool
oldEnoughToDrink (Person p) =
    if p.age > 18 then
        True
    else
        False
```

---

## Funksjonskomposisjon

```elm
adults : List Person -> List Person
adults persons =
    List.filter (.age >> ((<) 18)) persons
```

---

## Null som et objekt

```clojure
(defn summedAge [persons]
    (->> persons
        (map .getAge)
        (reduce + 0)))

(averageAge nil) ;; gir 0

```
---

## Null som et objekt

```elm
type Maybe a
    = Just a
    | Nothing

withDefault : a -> Maybe a -> a
withDefault default maybeValue =
    case maybeValue of
        Just value -> value
        Nothing -> default
```

---

## Navn å merke seg

* map
* andThen
* filter
* filterMap
* concatMap / flatMap

---

## map

```elm
map : (a -> b) -> Maybe a -> Maybe b
map fn maybeVal =
    case maybeVal of
        Just value -> Just (fn value)
        Nothing -> Nothing
```

---

## andThen

```elm
andThen : (a -> Maybe b) -> Maybe a -> Maybe b
andThen fn maybeVal =
    case maybeVal of
        Just value -> fn value
        Nothing -> Nothing

map : (a -> b) -> Maybe a -> Maybe b
map fn maybeVal = 
    andThen (Just << fn) maybeVal
```

---

## filter

```elm
filter : (a -> Bool) -> Maybe a -> Maybe a
filter fn maybeVal =
    case maybeVal of
        Just value ->
            if fn value then
                maybeVal
            else
                Nothing

        Nothing -> 
            Nothing
```

---

## Immutability

---

## Mer eksplisitt

---

## Statisk typet FP

---

## Du har alltid en datastruktur

---

## Den datastrukturen lover noe

---

## Maser informasjon til informasjon med sterkere garantier

---

## Maybe

```elm
type Maybe a
    = Just a
    | Nothing

withDefault : a -> Maybe a -> a
withDefault default maybeValue =
    case maybeValue of
        Just value -> value
        Nothing -> default
```

---

## Result

```elm
type Result val err
    = Ok val
    | Err err

getPeople : Result (List Person) Http.Error
```

---

## Skjema

```elm
type alias PersonFormData =
    { name : String
    , age : String
    , email : String
    , phoneNumber : String
    , annualIncome : String
    }
```

---

## Validert skjema

```elm
type ValidatedPersonFormData =
    ValidatedPersonFormData
        { name : Name
        , age : Age
        , email : Email
        , phoneNumber : PhoneNumber
        }

validate : PersonFormData -> Result ValidatedPersonFormData (List ValidationErrors)

savePerson : ValidatedPersonFormData -> Result ID Http.Error
```

---

## Oppsummert

* FP skiller data og logikk
* FP gjør det lettere å abstrahere logikk
* FP fokuserer på å lage ny data, ikke endre eksisterende data
* Datastrukturen gir garantier 
