VAR obsessed = 0

== class ==

-> END

== light ==

-> END

== friendship_beginning ==

-> END

== quiz ==

VAR quiz_score = 3

It's Friday. Today you have your weekly quiz in chemistry class. 
You sit down, unsure of what exactly to expect but sure that you'll be fine. After all, you did study. 

The teaching assistant passes out the pieces of paper, asking everyone to please not turn it over until everyone has one. You do as instructed.

Once the TA gives the go-ahead, you flip over your paper. 

{ 

- obsessed > 5: // very obsessed
    -> quiz_very_obsessed
- obsessed > 2 && obsessed < 5: // mildly obsessed
    -> quiz_mildly_obsessed
- obsessed < 3: // healthy
    -> quiz_healthy
    
}

= quiz_very_obsessed 

Something is very, very wrong. 

The questions makes sense, sure, but the answers... the answers are something else. How is this even possible?

You look up at the board, where the TA wrote what time the quiz ends, and you look at the clock. 

You only have ten minutes to figure this out. 

Part of you wants to raise your hand and ask if there was a mistake, or a typo, or maybe you got the wrong quiz, or maybe it's a practical joke or something, but you think better of it and instead stare down at the piece of paper. 

The first question reads: "Which of the following is an ionic bond?"

You answer:

* GHOST
    quiz_score--
* GHOST
    quiz_score--
* GHOST // correct
    quiz_score++
* GHOST 
    quiz_score--

- The second question reads: "Covalent bonds always form between nonmetals and..."

You answer:

* GHOST // correct
    quiz_score++
* GHOST 
    quiz_score--
* GHOST
    quiz_score--
* GHOST
    quiz_score--

- The third question reads: "Which of the following compounds has the highest melting point?"

You answer:

* GHOST
    quiz_score--
* GHOST // correct
    quiz_score++
* GHOST
    quiz_score--
* GHOST
    quiz_score--
    
- And with that, the quiz was over. 

{ 
- quiz_score > 2:
        -> quiz_pass
- quiz_score == 2:
        -> quiz_barely
- quiz_score < 2:
        -> quiz_fail
}

= quiz_mildly_obsessed

// NOTE: give passage

The first question reads: "Which of the following is an ionic bond?"

You answer:

* HCl
    quiz_score--
* GHOST
    quiz_score--
* GHOST // correct
    quiz_score++
* H2O 
    quiz_score--
    

- The second question reads: "Covalent bonds always form between nonmetals and..."

You answer:

* Nonmetals // correct
    quiz_score++
* GHOST 
    quiz_score--
* GHOST
    quiz_score--
* Compounds
    quiz_score--

- The third question reads: "Which of the following compounds has the highest melting point?"

You answer:

* HCl
    quiz_score--
* GHOST // correct
    quiz_score++
* GHOST
    quiz_score--
* KN3
    quiz_score--
    
- And with that, the quiz was over. 

{ 
- quiz_score > 2:
        -> quiz_pass
- quiz_score == 2:
        -> quiz_barely
- quiz_score < 2:
        -> quiz_fail
}

= quiz_healthy

// NOTE: Give passage

The first question reads: "Which of the following is an ionic bond?"

You answer:

* HCl
    quiz_score--
* CH4
    quiz_score--
* NaCl // correct
    quiz_score++
* H2O 
    quiz_score--

- The second question reads: "Covalent bonds always form between nonmetals and..."

You answer:

* Nonmetals // correct
    quiz_score++
* Metals 
    quiz_score--
* Metalloids
    quiz_score--
* Compounds
    quiz_score--

- The third question reads: "Which of the following compounds has the highest melting point?"

You answer:

* HCl
    quiz_score--
* MgO // correct
    quiz_score++
* KCl
    quiz_score--
* KN3
    quiz_score--
    
- And with that, the quiz was over. 

{ 
- quiz_score > 2:
        -> quiz_pass
- quiz_score == 2:
        -> quiz_barely
- quiz_score < 2:
        -> quiz_fail
}

= quiz_pass

-> END

= quiz_barely

-> END

= quiz_fail

-> END

