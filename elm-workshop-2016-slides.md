theme: Ostrich, 1
![original](universe.png)

#### _**Fun And Games With**_

# **ELM**

#### _**And Typed Functional Programming**_

[.footer: BEKK, Oslo Elm Meetup 10.12.18]

---

### _**Agenda**_

 We talk
 _**syntax and semantics**_


 You code
 _**Memory Card Game**_
 
 
---
<!--
# **Who are we?**

![inline](1054.jpeg) ![inline](1083.jpeg) ![inline](1168.jpeg)
![inline](726.jpeg) ![inline](814.jpeg) ![inline](847.jpeg)
![inline](849.jpeg)

--->

![fit](memory.png)

---

# _**Who are**_ **you**?

* _programming languages_
* _experience with functional programming_

^Erfaring med FP, og hvilke språk de kommer fra

---

# **Motivations for Elm**

* _safety and robustness_
* _easy refactoring and maintainability_
* _using a functional language_
* _avoid js-fatigue_

---

# **Elm in Norway**

* _several companies using or experimenting with Elm_
* _some companies fully dedicated to Elm_
* _Monthly meetups in Oslo with around 40 people_
* _Oslo Elm Day: first conf in N. Europe (10.06.17)_

^
SVV: ca 14 Elm applications

---

* *Function syntax*
* *Types & signatures*
* *Records, tuples and constants*
* *Type Alias*
* *Custom Types*
* *Pattern Matching*
* *The Elm Architecture*
* *Maybe*

---

# Functions & type inference

```elm
increment x =
    x + 1

five = increment 4
```

---

# Type Signatures

```elm
increment : Int -> Int
increment x =
    x + 1

five : Int
five = increment 4
```

---

# Records and bindings

```elm
x : Int
x = 42

customer : { name : String, age : Int }
customer = 
    { name = "Erik"
    , age = 24
    }
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    }   
```

#### _**allows us to define new types**_

---

# Type alias

```elm
type alias Coords = (Int, Int)

playerPosition : Coords
playerPosition = (0,0)
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Student"
    }   
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Student",
    , studentDiscount = 50
    }   
```

---

# Type alias

```elm
type alias Customer =
    { name: String
    , age: Int,
    , type: String
    , studentDiscount: Int
    , companyName: String
    }

erik : Customer
erik = 
    { name = "Erik"
    , age = 24
    , type = "Corporate",
    , studentDiscount = 0
    , companyName = "BEKK Consulting"
    }   
```

---

# Three problems:

_1. We get empty fields with dummy values_
_2. Easy to mistype `type`-field_
_3. No help from the compiler_

---

# Custom Types

```elm
type CustomerClass
    = Student
    | Corporate
    | Private
```
#### _**like enums on stereoids**_

---

# Custom Types

```elm
type CustomerClass
    = Student Int
    | Corporate String 
    | Private
```
#### _**like enums on stereoids**_

---

# Custom Types

```elm
type alias Discount = Int
type alias CompanyName = String

type CustomerClass
    = Student Discount
    | Corporate CompanyName 
    | Private
```
#### _**like enums on stereoids**_

---

# Pattern Matching

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

#### _**forgot a branch? compiler has you covered!**_

---

```html
<div>
    <img src=“/image.png” />
    <h1>Min elm-app!</h1>
</div>
```

---

```
div []
    [ img [src “/image.png”] []
    , h1 [] [ text “Min elm-app!”]
    ]
```

---

### The Elm Architecture

* _Model_
* _View_
* _Update_

---

![](the-elm-architecture.jpg)

---

![fit](the-elm-architecture2.jpg)

---

![](the-elm-architecture3.jpg)

---

![](the-elm-architecture.jpeg)

Illustrations by: @01k

From presentation by: @unsoundscapes

---

### Live-koding

---
### Avslutning

```bash
$ npm install -g create-elm-app
$ create-elm-app min-forste-app
$ cd min-forste-app
$ elm-app start
```


# **Thank you**!

---

# github.com/ewendel/elm-workshop



