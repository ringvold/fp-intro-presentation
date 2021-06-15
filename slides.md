---
marp: true
theme: gaia
class:
  - invert
paginate: true
---

<!-- _class: lead , invert -->

# Intro til funksjonell programmering

Harald Ringvold, Isak Sunde Singh, Morten Kolstad

---

## Agenda

* *Si litt generelt om funksjonell programmering*
* *Lære litt om Elm*
* *Jobbe med oppgaver*


---
<!-- _class: lead , invert -->

# Hva tenker du funksjonell programmering er?

---

<!-- _class: lead , invert -->


# Funksjonell programmering == FP

---
<!-- _class: lead , invert -->

# "Glem ALT du vet om programmering!"

---
<!-- _class: lead , invert -->

# 😱

---
<!-- _class: lead , invert -->

# Nei sånn er det jo ikke :hug:

<!--
Men noen ting er ganske anderledes
-->

---
<!-- _class: lead , invert -->

## Hva består egentlig et program av?

<!--
Eksempler og illustrasjon tatt fra Russ Olsen.
-->

---
<!-- _header: Illustrasjon av Russ Olsen -->
![bg contain](http://localhost:8080/images/pyramid1.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/pyramid2.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/pyramid3.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/pyramid4.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/pyramid5.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/blank.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/fp-base.png)

---
<!-- _header: Illustrasjon av Russ Olsen -->

![bg contain](http://localhost:8080/images/fp-program.png)

---
<!-- _class: lead , invert -->
# FP nøkkelkonsepter:

### - Redusere uønskede side-effekter
### - Separasjon av data og logikk

<!--
I hvilken grad forskjellige språk benytter eller legger til rette for disse forskjellige tingene varierer.
Hvordan dette ser ut og "oppleves" varierer fra språk til språk.
-->

---

# FP nøkkelkonsepter

- Immutable/uforanderlige/konstante datastrukturer
- Funksjoner som grunnleggende byggeblokker
- Funksjoner i matematisk forstand

---
# FP nøkkelkonsepter

- Algebraiske datatyper (ADT)
- Currying og partial application
- Funksjonskomposisjon

---

<!-- _class: lead , invert -->


# Utforske FP gjennom Elm

<!--
Hvorfor Elm?
- Min tidlig FP kotlin erfaring.
- Hvis man kan gjør det på "gamlemåten" er det veldig lett å falle tilbake på det. Et spårk som Elm tvinger det til "FP måten"
- Lite språk
- Benytter og har bygget inn i språket mange av nøkkelkonseptene i FP
- Veldig gode feilmeldinger
- En av de få språkene med rene funksjoner
- Sterkt typesystem, kan gi gode garantier
-->
---

<!-- _class: lead , invert -->

# ❝A delightful language for reliable web applications❞

---

# Elm

- Laget for å lage web applikasjoner
- Statisk typet
- Typeinferens
- ML syntaks
- "Kompilerer det, funker det mest sannsynlig"

---

* *Funksjonssyntaks*
* *Typer og signaturer*
* *Records, tupler og konstanter*
* *Type Alias*
* *Custom Types*
* *Pattern Matching*
* *Maybe*

---

## Funksjoner & typeinferens

```elm
increment x =
    x + 1

five = increment 4
```

---

## Typesignaturer

```elm
increment : Int -> Int
increment x =
    x + 1

five : Int
five = increment 4
```

<!--
Typer stareter med store bokstaver, alt annet er med små
-->
---

## Records og tilordninger

```elm
x : Int
x = 42

customer : { name : String, age : Int }
customer =
    { name = "Harald"
    , age = 31
    }
```

---

## Type alias

```elm
type alias Customer =
    { name: String
    , age: Int
    }

harald : { name: String , age: Int }
harald =
    { name = "Harald"
    , age = 31
    }

harald : Customer
harald =
    { name = "Harald"
    , age = 31
    }
```

---

## Type alias

```elm
type alias Coords = (Int, Int)

playerPosition : Coords
playerPosition = (0,0)
```

---

## Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    }

harald : Customer
harald =
    { name = "Harald"
    , age = 22
    , type = "Student"
    }
```

<!-- EKSEMPEL OVER FLERE SLIDES. Begynner som student. -->

---

## Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    }

harald : Customer
harald =
    { name = "Harald"
    , age = 22
    , type = "Student",
    , studentDiscount = 50
    }
```

---

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    , companyName: String
    }

harald : Customer
harald =
    { name = "Harald"
    , age = 31
    , type = "Corporate",
    , studentDiscount = 0
    , companyName = "BEKK Consulting"
    }
```

---

## Tre problemer:

_1. Vi får tomme felt med dummy-verdier_
_2. Lett å skrive feil verdi i `type`-feltet_
_3. Vi får ikke noe hjelp av compileren_

---

## Custom Types

```elm
type CustomerClass
    = Student
    | Corporate
    | Private
```
#### _**litt som enums på steroider**_

<!--
Er veldig gode til å modellere domene med.
Relativt lettleseling for mindre tekniske å lese også.
-->

---

## Custom Types

```elm
type CustomerClass
    = Student Int
    | Corporate String
    | Private
```
#### _**litt som enums på steroider**_

---

## Custom Types

```elm
type alias Discount = Int
type alias CompanyName = String

type CustomerClass
    = Student Discount
    | Corporate CompanyName
    | Private
```
#### _**litt som enums på steroider**_

---

## Pattern Matching

```elm
type CustomerClass = Student Discount | Corporate CompanyName | Private

getDiscount : CustomerClass -> Discount
getDiscount class =
    case class of
        Student discount ->
            discount
        Corporate name ->
            0
        Private ->
            0
```

#### _**glemte du en branch? compileren hjelper deg å huske!**_

---
<!-- _class: lead , invert -->

### Fju! Vi tar en pust i bakken :)

---
<!-- _class: lead , invert -->

# Elm har ikke `null`/`nil`/`undefined` :mind_blown:

---

## Null som et objekt

```elm
type Maybe a
    = Just a
    | Nothing
```
---

## Null som type

```elm
toInt : String -> Maybe Int
```

---

## Null som type

```elm
visMellomnavn : Maybe String -> String
visMellomnavn kanskjenavn =
    case kanskjenavn of
        Just mellomnavn ->
            mellomnavn
        Nothing ->
          "Har ingen mellom navn"
```

---

## Løkker og iterasjon

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
List.map     : (a -> b)    -> List a -> List b
List.filter  : (a -> Bool) -> List a -> List a
List.all     : (a -> Bool) -> List a -> Bool
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

## Oppsummering

* FP skiller data og logikk
* FP gjør det lettere å abstrahere logikk
* FP fokuserer på å lage ny data, ikke endre eksisterende data
* Datastrukturen gir garantier

---

```elm
-- Dette er en kommentar

person = {name = "Harald", age = 31}

-- Sette sammen strenger:
"Hei, mitt navn er " ++ person.name
-- Oppdatere records:

{ person | name = "Isak"
         , age = 25
}

```

---

# Ressurser

package.elm-lang.org

Videoer av Richard Feldman
FP in 40 minutes - Russ Olsen
