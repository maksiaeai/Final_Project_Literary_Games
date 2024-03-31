VAR obsessed = 0

== class ==

-> END

== light ==

You're on your way to your class's discussion section in the evening when you notice that green light on the side of the gym building again.  

It's been giving you the creeps these past couple weeks, but this time, you're sure that there's something actually seriously wrong with it. 



-> END

== friendship ==

-> END

== quiz ==

VAR quiz_score = 3

It's Friday. Today you have your weekly quiz in chemistry class. 
You sit down, unsure of what exactly to expect but sure that you'll be fine. After all, you did study. Somewhat. 

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

Something about this is very odd. 

The questions made sense, but some of the answers... didn't. In fact, some of these answers didn't seem related to chemistry at all. To make matters worse, you were sure that most of the answers that did make sense were wrong too. Were there just no correct answers? Did you not study well enough? What should you do?

Eventually, you decide to just do your best and write at least something down on the quiz. After all, you get a 25% change of getting each question correct, right?

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

Oh, this looks easy. Thank God, honestly. You haven't studied much, but still these questions look totally doable. 

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

The next Monday, you get your quiz back.

Oh, good, you passed. Not only did you pass, but you got a 100%. Phew. You're not sure if that was luck, or maybe you actually did study well enough, but you'll take it. 

-> END

= quiz_barely

The next Monday, you get your quiz back. 

You passed. Barely. It was unfortunate how unforgiving these quizzes were -- with only one question wrong, you got a 66%. That is passing, but still you feel incredibly disappointed. One question wrong? And get a D? That's not fair. Oh well. There's nothing you can do about it now. 

-> END

= quiz_fail

The next Monday, you get your quiz back.

Once you see the number on the paper, something sinks in your stomach. 

You failed. 

Not only that, but this was the last quiz of the semester. There goes your grade. No coming back from this one. You can only hope that you did well enough on the rest to get a passing score in the course. Why were the grades in this class set up this way, anyway? It wasn't fair. 

Fighting back tears, you crumple the quiz up and shove it into your backpack. It seems wrong to just throw it away, even though there are no more quizzes left to study for. However, you clearly don't care enough about it to put in in your bag neatly. 

This time, when the professor begins to speak and go over the answers, you don't even write them down for reference. It's over. 

-> END

