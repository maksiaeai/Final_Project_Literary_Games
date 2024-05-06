VAR obsessed = 0
VAR grade = 4 // assume Yuliya barely passed the rest
VAR eugenia_tolerance = 3 // 3 
VAR logan_tolerance = 4  // 4 
VAR abraham_tolerance = 2 // 2
VAR money = 25

-> class_3

== class_3 ==

-> light_3

== light_3 == // dining hall has suspicious lights, you cannot get food

{ logan_tolerance > 0:
    * Logan
        -> friendship_3.logan 
}

{ eugenia_tolerance > 0:
    * Eugenia
        -> friendship_3.eugenia
}

{ abraham_tolerance > 0:
    * Abraham
        -> friendship_3.abraham
}

* [Don't call anyone]
-> alone

= alone

~ obsessed += 2 

// buy food and get it delivered if you have the money
{
- money > 20:
    * [Order takeout]
    ~ money -= 21
    -> quiz_3
}

// just go into the dining hall anyway
* [Go to the dining hall anyway]
~ obsessed += 5 

// starve 
* [Don't eat dinner]
~ obsessed += 3

- { 

- obsessed > 5: // you miss the quiz

    -> class_4

- obsessed > 2 && obsessed < 6: // you go to the quiz, but good luck 

    -> quiz_3
    
- obsessed < 3: // you go to the quiz and probably do fine. How did you do this?

    -> quiz_3

}


== friendship_3 ==

// ask to buy food (tolerance - 3)
// ask to deliver food that you bought (tolerance - 2)
// ask to go with you to dining hall (tolerance - 1)

= logan 

* [Ask Logan to buy you food]
~ logan_tolerance -= 3 

-> quiz_3

{ 
- money > 19:
    * [Buy your own food, and ask Logan to deliver it]
    ~ logan_tolerance -= 2 
    ~ money -= 20

-> quiz_3
}

* [Ask Logan to go with you to the dining hall]
~ logan_tolerance--

-> quiz_3

= eugenia 

* [Ask Eugenia to buy you food]
~ eugenia_tolerance -= 3 

-> quiz_3

* [Buy your own food, and ask Eugenia to deliver it]
~ eugenia_tolerance -= 2 
~ money -= 20

-> quiz_3

* [Ask Logan to go with you to the dining hall]
~ eugenia_tolerance--

-> quiz_3

= abraham

* [Ask Abraham to buy you food]
~ abraham_tolerance -= 3 

-> quiz_3

* [Buy your own food, and ask Abraham to deliver it]
~ abraham_tolerance -= 2 
~ money -= 20

-> quiz_3

* [Ask Logan to go with you to the dining hall]
~ abraham_tolerance--

-> quiz_3

== quiz_3 == 

VAR quiz_score_3 = 3

// quiz introduction 

-> question_1

= question_1 

// question 1

{ 
- obsessed > 5: // MUST BE HERE. MUST INCLUDE NEW LINE BEFORE SWITCH STATEMENT

* GHOST
    ~ quiz_score_3--
    -> question_2
* GHOST
    ~ quiz_score_3--
        -> question_2

* GHOST // correct
        -> question_2

* GHOST 
    ~ quiz_score_3--
        -> question_2

- obsessed > 2 && obsessed < 6: // mildly obsessed

* !wrong answer 
    ~ quiz_score_3--
        -> question_2

* GHOST
    ~ quiz_score_3--
        -> question_2

* GHOST // correct
        -> question_2

* !wrong answer
    ~ quiz_score_3--
        -> question_2

    
- obsessed < 3:

* !wrong answer
    ~ quiz_score_3--
            -> question_2

* !wrong answer
    ~ quiz_score_3--
            -> question_2

* !correct answer // correct
        -> question_2

* !wrong answer
    ~ quiz_score_3--
        -> question_2
}

= question_2

// question 2

You answer:

{ 

- obsessed > 5:

* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_3--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_3--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_3--
    -> question_3

- obsessed > 2 && obsessed < 6: 


* !correct answer // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_3--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_3--
    -> question_3
* !wrong answer
    ~ quiz_score_3--
    -> question_3

- obsessed < 3:


* !correct answer // correct
    -> question_3
* !wrong answer
    ~ quiz_score_3--
    -> question_3
* !wrong answer
    ~ quiz_score_3--
    -> question_3
* !wrong answer
    ~ quiz_score_3--
    -> question_3

}

= question_3

// question 3

You answer:

{ 

- obsessed > 5:

* GHOST GHOST 
    ~ quiz_score_3--
    -> quiz_finish
* GHOST GHOST  // correct
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_3--
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_3--
    -> quiz_finish
- obsessed > 2 && obsessed < 6:

* !wrong answer
    ~ quiz_score_3--
    -> quiz_finish
* GHOST GHOST
    -> quiz_finish
* GHOST GHOST
    ~ quiz_score_3--
    -> quiz_finish
* !wrong answer
    ~ quiz_score_3--
    -> quiz_finish
    
- obsessed < 2:

* !wrong answer
    ~ quiz_score_3--
    -> quiz_finish
* !correct answer
    -> quiz_finish
* !wrong answer
    ~ quiz_score_3--
    -> quiz_finish
* !wrong answer
    ~ quiz_score_3--
    -> quiz_finish
    
}
    
= quiz_finish

And with that, the quiz was over. 

{ 
- quiz_score_3 > 2:
        ~ grade = grade + 3 
        -> quiz_pass
- quiz_score_3 == 2:
    ~ grade = grade + 2
        -> quiz_barely
- quiz_score_3 == 1:
    ~ grade++
        -> quiz_fail
- quiz_score_3 < 1:
        -> quiz_fail
}

= quiz_pass

// pass 

-> class_4

= quiz_barely

// barely passed 
-> class_4

= quiz_fail

// fail the quiz

-> class_4

== class_4 ==

// class. acids and bases pt. 2 
-> light_4

== light_4 ==

// light
// it's raining. the streetlights are out during the day. On Friday! So you can't take the quiz :( Unless...

{ logan_tolerance > 0:
    * Logan
        -> friendship_4.logan 
}

{ eugenia_tolerance > 0:
    * Eugenia
        -> friendship_4.eugenia
}

{ abraham_tolerance > 0:
    * Abraham
        -> friendship_4.abraham
}

* Don't call anyone
    -> alone
// if none of your friends are available

// { logan_tolerance + eugenia_tolerance + abraham_tolerance == 0:

// // no one is available and you go to class alone 
// -> alone

// }

// alone? stay in == light_4 ==
= alone 

~ obsessed += 2

// you go to classes alone 
// do you make it to class though? not if you're obsessed

{ 

- obsessed > 5: // you miss the quiz

    -> class_5

- obsessed > 2 && obsessed < 6: // you go to the quiz, but good luck 

    -> quiz_4
    
- obsessed < 3: // you go to the quiz and probably do fine. How did you do this?

    -> quiz_4

}
    
== friendship_4 ==

= logan // does not inconvenience him at all, he's just lazy

* [Ask Logan to walk with you anyway]
~ logan_tolerance--
-> quiz_4

* [Believe Logan when he says it's inconvenient]
~ obsessed += 2
-> light_4 // opportunity to ask more friends?

= eugenia // this inconveniences her greatly, because she would have to miss class

* [Ask Eugenia to walk with you anyway]
~ eugenia_tolerance -= 2
-> quiz_4

* [Decide not to inconvenience Eugenia]
~ obsessed += 2
-> light_4 // opportunity to ask more friends?

= abraham // somewhat inconveniences him, but he pretends like it doesn't

* [Ask Abraham to walk with you anyway]
~ abraham_tolerance--
-> quiz_4

* [Don't believe Abraham when he says it's not inconvenient]
~ obsessed +=2 
-> light_4

== quiz_4 ==

VAR quiz_score_4 = 3

// quiz introduction 

-> question_1

= question_1 

// question 1

{ 
- obsessed > 5: // MUST BE HERE. MUST INCLUDE NEW LINE BEFORE SWITCH STATEMENT

* GHOST
    ~ quiz_score_4--
    -> question_2
* GHOST
    ~ quiz_score_4--
        -> question_2

* GHOST // correct
        -> question_2

* GHOST 
    ~ quiz_score_4--
        -> question_2

- obsessed > 2 && obsessed < 6: // mildly obsessed

* !wrong answer 
    ~ quiz_score_4--
        -> question_2

* GHOST
    ~ quiz_score_4--
        -> question_2

* GHOST // correct
        -> question_2

* !wrong answer
    ~ quiz_score_4--
        -> question_2

    
- obsessed < 3:

* !wrong answer
    ~ quiz_score_4--
            -> question_2

* !wrong answer
    ~ quiz_score_4--
            -> question_2

* !correct answer // correct
        -> question_2

* !wrong answer
    ~ quiz_score_4--
        -> question_2
}

= question_2

// question 2

You answer:

{ 

- obsessed > 5:

* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_4--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_4--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_4--
    -> question_3

- obsessed > 2 && obsessed < 6: 


* !correct answer // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_4--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_4--
    -> question_3
* !wrong answer
    ~ quiz_score_4--
    -> question_3

- obsessed < 3:


* !correct answer // correct
    -> question_3
* !wrong answer
    ~ quiz_score_4--
    -> question_3
* !wrong answer
    ~ quiz_score_4--
    -> question_3
* !wrong answer
    ~ quiz_score_4--
    -> question_3

}

= question_3

// question 3

You answer:

{ 

- obsessed > 5:

* GHOST GHOST 
    ~ quiz_score_4--
    -> quiz_finish
* GHOST GHOST  // correct
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_4--
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_4--
    -> quiz_finish
- obsessed > 2 && obsessed < 6:

* !wrong answer
    ~ quiz_score_4--
    -> quiz_finish
* GHOST GHOST
    -> quiz_finish
* GHOST GHOST
    ~ quiz_score_4--
    -> quiz_finish
* !wrong answer
    ~ quiz_score_4--
    -> quiz_finish
    
- obsessed < 2:

* !wrong answer
    ~ quiz_score_4--
    -> quiz_finish
* !correct answer
    -> quiz_finish
* !wrong answer
    ~ quiz_score_4--
    -> quiz_finish
* !wrong answer
    ~ quiz_score_4--
    -> quiz_finish
    
}
    
= quiz_finish

And with that, the quiz was over. 

{ 
- quiz_score_4 > 2:
        ~ grade = grade + 3 
        -> quiz_pass
- quiz_score_4 == 2:
    ~ grade = grade + 2
        -> quiz_barely
- quiz_score_4 == 1:
    ~ grade++
        -> quiz_fail
- quiz_score_4 < 1:
        -> quiz_fail
}

= quiz_pass

// pass 

-> class_5

= quiz_barely

// barely passed 
-> class_5

= quiz_fail

// fail the quiz
-> class_5

== class_5 ==

On Monday, you walk into chemistry class, as you've done every week this semester.

Today, your teacher announces that this week, you'll be finishing up by learning about the applications of thermodynamics. Luckily, there is no final exam, so the last portion of your grade will be determined by how well you do on this last weekly quiz.

Somehow, you think, that seems worse. 

But everyone else seems happy about it, so you figure that maybe you're just wrong about it being worse. 

Your professor begins by introducing the concept of entropy. That sounds familiar, but not in the way the professor explains it. Apparently, entropy is similar to "chaos". 

You could relate to that. 

Entropy is the measure of how "disordered" something is. Solids have the least amount of entropy, while gas has the most. Entropy also relates to the second law of thermodynamics -- which has two parts: first, when energy is converted or transferred, some of it is lost to the surroundings as heat. So while no energy was lost or created in the transfer (as per the first law of thermodynamics), the amount of usable energy has indeed decreased. 

How does entropy relate? In a system such as this, with no surrounding interference, entropy will either stay the same or increase -- the generation of heat increases entropy. In spontaneous systems, the overall change in entropy must be greater than or equal to 0. 

The only time entropy isn't above zero is when the system is at "absolute" zero -- zero degrees Kelvin, or -273.15 degrees Celsius. Nothing moves at absolute zero -- there is no disorder. Therefore, entropy is a constant zero...

-> light_5

== light_5 ==

You're on your way to your class's discussion section in the evening when you notice that green light on the side of the gym building again.  

It's been giving you the creeps these past couple weeks, but this time, you're sure that there's something actually seriously wrong with it. 

Maybe trying to observe it will help you figure out what it is?

{ 

- obsessed > 0: // even just a little bit
    -> light_obsessed
- else: // healthy
    -> light_healthy 
    
}

= light_obsessed // even just a little bit

* [Stare at it] 
    ~ obsessed++
    -> staring
    
* [Stare at it] 
    ~ obsessed++
    -> staring

= light_healthy

* [Stare at it]
    ~ obsessed++
    -> staring
    
* [Don't stare at it]

Curiously, the urge to stare at the light doesn't feel all that overwhelming this time... which is odd, considering all that's happened, but you don't question it. Instead of dwelling on it too much, you decide to actually go to discussion.

Discussion was fine. Going home was fine. Fascinatingly, the entire rest of the week was fine. Nothing else out of the ordinary happens for the rest of the week, and you don't need to ask any of your friends for help. 

Thursday night, you go to bed just fine. 

** [Wake up]

-> quiz_5

= staring

You decide to stare at it. Just for a little bit. After all, you do have to go to discussion.

* [Stare at it]

Some time passes. 

** [Stare at it]

Some more time passes.

*** [Stare at it]

How long has it been?

**** [Stare at it]

The light is all-encompassing. Something within you stirs. 

***** [Stare at it]

Is it trying to tell you something?

****** [Yes]
~ obsessed++

****** [No]

Yes it is. 

- You are sure that it's telling you something, but you don't know what it is.

* [Wait some more]

- Eventually, you figure it out. 

* The light doesn't want you to go to discussion.

** The light doesn't want you to pass this class.

*** The light doesn't want you to graduate...

**** ...Much less go to medical school.

***** The light doesn't want you to succeed.

****** The light doesn't want you to live. 

******* The light will do whatever it takes to make you fail. 

******** The light will do whatever it takes to make you die. 

- What do you do?

* [Let the light kill you]
    ~ obsessed++
-> kill_you

* [Trick the light instead]
    ~ obsessed++

You decide to trick the light instead of letting it kill you. 

Forget discussion. You have more important things to worry about. 

- You turn the opposite direction from the building where discussion is held, and instead head towards the local pharmacy.

If the light is going to try to kill you as long as you are alive, then, barring actually killing yourself, there's only one thing you can do:

* You have to trick the light into thinking you're already dead. 

- Your plan is simple. 

If you pretend to die in front of the light, it won't bother you anymore. Maybe you'll finally appease it. 

You don't have access to any weapons. But you do have access to the pharmacy. Medication can be weapon enough. Right?

* [Right]

-> overdose 

* [Wait--]

Wait a minute. This is ridiculous. You can't do this. It's too risky. 

But the thought can't leave your head. Maybe it's how perfectly simple the plan seems, or maybe it's the light just trying to make it alluring, but as you continue walking, you feel as if you can't stop yourself. 

You have to call someone. Someone has to help. You decide, quickly, to call...

{ logan_tolerance > 0:
    ** Logan
        -> friendship_5.logan 
}

{ eugenia_tolerance > 0:
    ** Eugenia
        -> friendship_5.eugenia
}

{ abraham_tolerance > 0:
    ** Abraham
        -> friendship_5.abraham
}

// if none of your friends are available

{ logan_tolerance + eugenia_tolerance + abraham_tolerance == 0:

...no one. You open your contacts list, but stop as soon as you do. That's right. You've driven away all of your friends. 

** No one is available. -> kill_you

}

= kill_you

There's nothing you can do, you've realized. There's nothing you can do to make the light stop torturing you like this. 

It will keep going, forever, following you and distracting you and consuming your every thought. 

You might as well stop wasting time. You might as well stop it now. 

* Stop it 

** Stop it 

*** Stop it  

**** Stop it 

***** Stop it

You stopped it. You stopped everything. It's over. You died. 

-> END

= overdose

You think about it for a moment. Right, yes, this makes sense. 

Despite your nerves, the cashier makes no comment as you buy two bottles of over-the-counter painkillers. That should be enough. Not to actually kill you, but definitely to hurt. 

You walk out, and go back to the suspicious light.

No one else is around. 

Despite the brightness, no one else can see you. 

You set your plan into motion. However, you forgot something. You completely forgot that in order to survive an overdose, you need to immediately seek medical attention. 

It's too late, once you start vomiting. You can't speak. You can't see. There's no way to use your phone. 

And once again, no one else is around. 

Not for the rest of the night. 

-> END

== friendship_5 ==

= logan

// Logan: if you refuse to go to the hospital, keeps an eye on you all night long, until the lights go away in the morning and you feel better. Encourages you to go to a doctor the next day anyway (DOCTOR ENDING)

* [Let Logan take you to the hospital]

// hospitalization ending. you miss the quiz :(

-> semester_over

* [Refuse to go to the hospital]

// doctor ending

-> quiz_5

= eugenia 

// Eugenia: waits until you get home, says that she'll be there, and then immediately calls police (HOSPITALIZATION ENDING)

-> police 

= abraham 

// Abraham: waits until you get home, convinces you to go to hospital on your own or via police (HOSPITALIZATION ENDING)

* [Let Abraham take you to the hospital]
// hospitalization ending, you miss the quiz :(
-> semester_over

* [Refuse to go to the hospital]
-> police 

== police ==

// the police come, and you are forcibly hospitalized 
You hear the sound of knocking at your door. 

* [Open the door]
-> open

* [Don't open the door]
-> no_open

= open

To your surprise, when you open the door, you see police.

-> arrest

= no_open

"Police! Open up," a voice on the other side of the door says.

Oh God. Police? Why would the police be at your door?

You don't know what you did wrong. But, figuring that you would rather not be hit with a "resisting arrest" charge, you decide to open the door.

Two officers stand before you. 

-> arrest

= arrest

"Are you Yuliya Pavlova?" One of the officers asks.

You would rather not get in trouble for lying.

* "Yes."

- "One of your friends has expressed some concerns about you. May we come in?"

Oh, shoot. Was this <> { 
- friendship_5.abraham: Abraham's 
- else: Eugenia's 
} <> fault? 

Once again, you decide that cooperation would be the best option for you.

* "Yes."

- The police officers come into your room. One of them poses the question: "Have you felt like hurting yourself lately?"


* { obsessed < 3} "No." 

And that was true, technically. You didn't really want to hurt yourself. It was just the lights that were giving you no choice. 

* "Well..."

- The officer raises her eyebrow. 

* "Well I mean, I don't actually want to hurt myself."

- "Your friend <> { 
- friendship_5.abraham: Abraham 
- else: Eugenia
} <> said otherwise."

You're in a corner. 

* { obsessed < 3} "<>{ 
- friendship_5.abraham: He 
- else: She
} <> misunderstood me. I don't want to hurt myself."

"Are you sure?" The officer asks.

** "I'm sure."

The officers look at each other. Outside of <> { 
- friendship_5.abraham: Abraham's 
- else: Eugenia's 
} <> word, they don't actually have any evidence to forcibly hospitalize you. One of them stands up. "Well," he says, and takes out a business card, "if you feel any differently later, here is a crisis line number."

You keep in your sigh of relief, and smile at him instead as you take the card. "Thank you."

"Have a good night," the second officer says, and they leave your room.

Once the door closes, you let your sigh escape. 

-> quiz_5

* "I did say that I might. But it's not something I actually want to do."

- "You need to keep your story straight," the officer warns. 

* "I am. I don't want to hurt myself."

** "It just feels like I don't have any choice."

- "And why is that?" The second officer asks.

You realize now that you can't talk your way out of this. You can't explain anything about the lights. You'll look crazy. 

* "What's going to happen to me?"

- "You're not in any trouble," the first officer assures you. "We're just here to take you to the hospital."

Well, you figure, there is no argument you can give that will get you out of this.

"The only question now is," that same officer explains, "will you allow us to take you to the hospital voluntarily, or will we have to take you involuntarily?"

* [Allow the police to take you]

"I'll go."

Standing up to follow them, you go to the hospital voluntarily...

...But you miss the quiz. 

-> semester_over

* [Don't allow the police to take you]

"I don't want to go to the hospital."

"Fine." The same officer says. "So we'll take you involuntarily."

Despite your insistence that you don't want to go to the hospital, you don't resist when they put handcuffs on you and escort you to the police car. 

You are involuntarily hospitalized. And you miss the quiz.

-> semester_over

== quiz_5 ==

VAR quiz_score_5 = 3

It's Friday. Today you have your weekly quiz in chemistry class. 
You sit down, unsure of what exactly to expect but sure that you'll be fine. After all, you did study. Somewhat. 

The teaching assistant passes out the pieces of paper, asking everyone to please not turn it over until everyone has one. You do as instructed.

Once the TA gives the go-ahead, you flip over your paper. 

{ 

- obsessed > 5: // very obsessed

Something is very, very wrong. 

The questions makes sense, sure, but the answers... the answers are something else. How is this even possible?

You look up at the board, where the TA wrote what time the quiz ends, and you look at the clock. 

You only have ten minutes to figure this out. 

Part of you wants to raise your hand and ask if there was a mistake, or a typo, or maybe you got the wrong quiz, or maybe it's a practical joke or something, but you think better of it and instead stare down at the piece of paper. 

    -> question_1
    
- obsessed > 2 && obsessed < 6: // mildly obsessed

Something about this is very odd. 

The questions made sense, but some of the answers... didn't. In fact, some of these answers didn't seem related to chemistry at all. To make matters worse, you were sure that most of the answers that did make sense were wrong too. Were there just no correct answers? Did you not study well enough? What should you do?

Eventually, you decide to just do your best and write at least something down on the quiz. After all, you get a 25% change of getting each question correct, right?

    -> question_1
    
- obsessed < 3: // healthy
    -> question_1
    
}

= question_1 

The first question reads: "At what temperature is entropy zero?"

You answer:

{ 
- obsessed > 5:
* GHOST
    ~ quiz_score_5--
    -> question_2
* GHOST
    ~ quiz_score_5--
        -> question_2

* GHOST // correct
        -> question_2

* GHOST 
    ~ quiz_score_5--
        -> question_2

- obsessed > 2 && obsessed < 6: // mildly obsessed

* 0 degrees Celsius
    ~ quiz_score_5--
        -> question_2

* GHOST
    ~ quiz_score_5--
        -> question_2

* GHOST // correct
        -> question_2

* 273 Kelvin 
    ~ quiz_score_5--
        -> question_2

- else:

* 0 degrees Celsius
    ~ quiz_score_5--
            -> question_2

* 0 degrees Fahrenheit 
    ~ quiz_score_5--
            -> question_2

* 0 Kelvin // correct
        -> question_2

* 273 Kelvin
    ~ quiz_score_5--
        -> question_2
}

= question_2

The second question reads: "Which statement best describes entropy's role in determining the spontaneity of a chemical reaction?"

You answer:

{ 
- obsessed > 5:

* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_5--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_5--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_5--
    -> question_3
    
- obsessed > 2 && obsessed < 6: 


* An increase in entropy can contribute to the spontaneity of a reaction because spontaneous reactions often increase disorder. // correct
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_5--
    -> question_3
* GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST GHOST 
    ~ quiz_score_5--
    -> question_3
* The higher the enthalpy, the more spontaneous the chemical reaction will be. 
    ~ quiz_score_5--
    -> question_3

- else:


* An increase in entropy can contribute to the spontaneity of a reaction because spontaneous reactions often increase disorder. // correct
    -> question_3
* Entropy is not relevant when considering the spontaneity of chemical reactions.
    ~ quiz_score_5--
    -> question_3
* A decrease in entropy always prevents spontaneous chemical reactions from occurring.  
    ~ quiz_score_5--
    -> question_3
* The higher the enthalpy, the more spontaneous the chemical reaction will be. 
    ~ quiz_score_5--
    -> question_3

}

= question_3

The third question reads: "What type of process has an increase in entropy?"

You answer:

{ 
- obsessed > 5:

* GHOST GHOST 
    ~ quiz_score_5--
    -> quiz_finish
* GHOST GHOST  // correct
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_5--
    -> quiz_finish
* GHOST GHOST 
    ~ quiz_score_5--
    -> quiz_finish

- obsessed > 2 && obsessed < 6:

* Nonspontaneous process
    ~ quiz_score_5--
    -> quiz_finish
* GHOST GHOST
    -> quiz_finish
* GHOST GHOST
    ~ quiz_score_5--
    -> quiz_finish
* Exothermic process
    ~ quiz_score_5--
    -> quiz_finish
    
- else:

* Nonspontaneous process
    ~ quiz_score_5--
    -> quiz_finish
* Spontaneous process
    -> quiz_finish
* Endothermic process
    ~ quiz_score_5--
    -> quiz_finish
* Exothermic process
    ~ quiz_score_5--
    -> quiz_finish
    
}

    

    
= quiz_finish

And with that, the quiz was over. 

{ 
- quiz_score_5 > 2:
        ~ grade = grade + 3 
        -> quiz_pass
- quiz_score_5 == 2:
    ~ grade = grade + 2
        -> quiz_barely
- quiz_score_5 == 1:
    ~ grade++
        -> quiz_fail
- quiz_score_5 < 1:
        -> quiz_fail
}

= quiz_pass

The next Monday, you get your quiz back.

Oh, good, you passed. Not only did you pass, but you got a 100%. Phew. You're not sure if that was luck, or maybe you actually did study well enough, but you'll take it. 

-> semester_over

= quiz_barely

The next Monday, you get your quiz back. 

You passed. Barely. It was unfortunate how unforgiving these quizzes were -- with only one question wrong, you got a 66%. That is passing, but still you feel incredibly disappointed. One question wrong? And get a D? That's not fair. Oh well. There's nothing you can do about it now. 

-> semester_over

= quiz_fail

The next Monday, you get your quiz back.

Once you see the number on the paper, something sinks in your stomach. 

You failed. 

Not only that, but this was the last quiz of the semester. There goes your grade. No coming back from this one. You can only hope that you did well enough on the rest to get a passing score in the course. Why were the grades in this class set up this way, anyway? It wasn't fair. 

Fighting back tears, you crumple the quiz up and shove it into your backpack. It seems wrong to just throw it away, even though there are no more quizzes left to study for. However, you clearly don't care enough about it to put in in your bag neatly. 

This time, when the professor begins to speak and go over the answers, you don't even write them down for reference. It's over. 

-> semester_over

== semester_over ==

Finally, the semester is over. 

You did fine in your other classes. It was chemistry you were most worried about. After having gotten your quiz grade back, you have a fairly good idea of how well you've done in the class.

After doing some calculations, you look at your final score, and... <> { 
- grade > 10: -> class_pass
- grade == 10: -> class_barely
- grade < 10: -> class_fail
}

= class_pass

you passed. Thank God, you passed. After all that's happened, you're surprised you even did so well. Wow. All those sleepless nights must have been worth it. 

Sighing a deep breath, you smile to yourself. You passed. Well done. 

-> END

= class_barely

you barely passed. But thank God, you passed. After all that's happened, that's the most you could hope for, honestly. Part of you is somewhat disappointed that you didn't do better, but with everything that the lights have done to you, it's a miracle you passed at all. It will be difficult to explain to your parents, but... you'll make it through. 

-> END

= class_fail

you failed. 

Oh God, you failed. 

What are you going to do? You begin to spiral. You failed chemistry. You don't really have an excuse, either, you think to yourself. It's not like anybody's going to believe you about the lights. You failed, and it's all your fault. You have to take chemistry again, which will put you back a semester. Regardless, you'll never get into medical school with a grade like this, even if you ace it the next semester. Who fails general chemistry? It's over. It's over. 

-> END

