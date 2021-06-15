---
marp: true
theme: gaia
class:
  - invert
paginate: true
---

<!-- _class: lead , invert -->

# Intro til funksjonell programmering

Harald Ringvold, Isak Sunde Singh, Morten Kolstand


---
<!-- _class: lead , invert -->

# Hva tenker du funksjonell programmering er?

---

<!-- _class: lead , invert -->


# Funksjonell programmering == FP

---
<!-- _class: lead , invert -->

# Glem ALT du vet om programmering!

---
<!-- _class: lead , invert -->

# 😱

---

![bg contain](http://localhost:8080/images/pyramid1.png)

---

![bg contain](http://localhost:8080/images/pyramid2.png)

---

![bg contain](http://localhost:8080/images/pyramid3.png)

---

![bg contain](http://localhost:8080/images/pyramid4.png)

---

![bg contain](http://localhost:8080/images/pyramid5.png)

---
![bg contain](http://localhost:8080/images/fp-base.png)

---
![bg contain](http://localhost:8080/images/fp-program.png)

---

## Redusere uønskede side-effekter
## Seperasjon av data og behandling

<!--
I hvilken grad forskjellige språk benytter eller legger til rette for disse forskjellige tingene varierer.
Hvordan dette ser ut og "oppleves" varierer fra språk til språk.
-->

---

- Immutable/uforanderlige/konstante datastrukturer
- Funksjoner som grunnleggende byggeblokker
- Funksjoner i matematisk forstand

---

- Algebraiske datatyper (ADT)
- Currying og pratial application
- Funksjonskomposisjon

---

# Utforske FP gjennom Elm

<!--
Hvorfor Elm?
- Lite språk
- Benytter og har bygget inn i språket mange av nøkkelkonseptene i FP
- Veldig gode feilmeldinger
- En av de få språkene med rene funksjoner
-->

---

# Elm

- Statisk typet
- Typeinferens
- ML syntaks

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













# Ressurser

package.elm-lang.org

Videoer av Richard Feldman
FP in 40 minutes - Russ Olsen
