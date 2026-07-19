PhoneMaleAnswerMornText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "…" ; "…"

	para "Good morning,"
	line "<PLAYER>!" ; "<PLAYER>!"
	done

PhoneMaleAnswerDayText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "…" ; "…"

	para "How's it going,"
	line "<PLAYER>?" ; "<PLAYER>?"
	done

PhoneMaleAnswerNiteText:
	text "Hallo. Met" ; "Hello. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "…" ; "…"

	para "Goedenavond," ; "Good evening,"
	line "<PLAYER>!" ; "<PLAYER>!"
	done

PhoneFemaleAnswerMornText:
	text "Hoi. Met" ; "Hi. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."

	para "Hoi, <PLAYER>!" ; "Hi, <PLAYER>!"
	line "Goedemorgen." ; "Good morning."
	done

PhoneFemaleAnswerDayText:
	text "Hoi. Met" ; "Hi. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."

	para "Hoi, <PLAYER>!" ; "Hi, <PLAYER>!"
	line "Hoe gaat het?" ; "How are you?"
	done

PhoneFemaleAnswerNiteText:
	text "Hoi. Met" ; "Hi. This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."

	para "Hoi, <PLAYER>!" ; "Hi, <PLAYER>!"
	line "Goedenavond." ; "Good evening."
	done

PhoneMaleGreetMornText:
	text "<PLAYER>," ; "<PLAYER>, good"
	line "goedemorgen!" ; "morning!"

	para "Met @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Hoe gaat het?" ; "How are you doing?"
	done

PhoneMaleGreetDayText:
	text "<PLAYER>, howdy!" ; "<PLAYER>, howdy!"

	para "Met @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Lekker weertje he?" ; "Isn't it nice out?"
	done

PhoneMaleGreetNiteText:
	text "<PLAYER>," ; "<PLAYER>, good"
	line "Goedenavond!" ; "evening!"

	para "Met @" ; "It's me, @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Heb je even?" ; "Got a minute?"
	done

PhoneFemaleGreetMornText:
	text "Goedemorgen," ; "Good morning,"
	line "<PLAYER>." ; "<PLAYER>."

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Maak ik je wakker?" ; "Did I wake you?"
	done

PhoneFemaleGreetDayText:
	text "Hello, <PLAYER>." ; "Hello, <PLAYER>."

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Hoe gaat ie?" ; "How are things?"
	done

PhoneFemaleGreetNiteText:
	text "Good evening," ; "Good evening,"
	line "<PLAYER>." ; "<PLAYER>."

	para "Dit is @" ; "This is @"
	text_ram wStringBuffer3 ; MaxLength 9
	text "." ; "."
	line "Was je wakker?" ; "Were you awake?"
	done

PhoneMaleReallyEnergeticText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; "'s"
	line "erg energiek." ; "really energetic."
	cont "Wat een gedoe!" ; "It's a handful!"
	done

PhoneFemaleTopShapeText:
	text "Hoe gaat het met" ; "How are your"
	line "je #MON?" ; "#MON doing?"

	para "Ik houd mijn" ; "I always keep my"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " gezond" ; " in top"

	para "door #MONCENTRA" ; "shape by going to"
	line "te bezoeken." ; "#MON CENTERS."
	done

PhoneMaleLookingAwesomeText:
	text "Mijn @" ; "My @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " is" ; "'s"
	line "geweldig." ; "looking awesome."

	para "Kon ik het je maar" ; "I wish I could"
	line "laten zien." ; "show you."
	done

PhoneFemaleDressedUpText:
	text "Ik verkleedde mijn" ; "I dressed up my"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "." ; "."

	para "Het ziet er nu nog" ; "It looks even"
	line "schattiger uit." ; "cuter than before."
	done

PhoneMaleManagedToBeatText:
	text "Oh ja, ik versloeg" ; "Oh, yeah, I man-"
	line "een erg sterke" ; "aged to beat a"
	cont "@" ; "tough @"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text "." ; "."

	para "Ik moet mijn team" ; "I need to make my"
	line "sterker maken." ; "party stronger."
	done

PhoneFemaleTypeAdvantageText:
	text "Moet je horen!" ; "You have to hear"
	line "Ik vocht met een" ; "this! I battled"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " een" ; " the"
	line "tijdje terug." ; "other day."

	para "Eitje! Ik had het" ; "It was easy! I had"
	line "juiste type." ; "a type advantage."
	done

PhoneMaleAlmostCaughtText:
	text "He, luister! Ik" ; "Hey, listen!"
	line "ving bijna een" ; "I almost caught"

	para "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " een" ; " the"
	line "tijdje geleden." ; "other day."

	para "Oh, het was echt" ; "Oh, it was soooo"
	line "bijna gelukt!" ; "close too!"
	done

PhoneFemaleMissedCatchingText:
	text "Raad eens wat er" ; "Guess what happen-"
	line "laatst gebeurde." ; "ed the other day."

	para "De vangst van een" ; "I missed catching"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " faalde." ; " again."

	para "Misschien ben ik" ; "Maybe I'm not very"
	line "hier niet goed in…" ; "good at this…"
	done

PhoneMaleWantsToBattleText:
	text "Potje vechten?" ; "Want to battle?"
	line "Het zal niet zoals" ; "It's not going to"

	para "de vorige keer" ; "be a repeat of the"
	line "gaan." ; "last time we met."

	para "Je vindt me bij" ; "I'll be around"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "." ; "."
	done

PhoneFemaleWantsToBattleText:
	text "Wil je vechten?" ; "Do you want to"
	line "Ditmaal ga ik" ; "battle? I'm going"
	cont "winnen!" ; "to win this time!"

	para "Ik wacht op je" ; "I'll be waiting"
	line "ergens bij" ; "for you around"

	para "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "." ; "."
	line "Zoek jij me op?" ; "Look for me, OK?"
	done

PhoneWrongNumberKazText:
	text "Hallo? Dit is" ; "Hello? This is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxTrainerNameLength
	text "…" ; "…"

	para "Uh-oh… Jij bent" ; "Uh-oh… You're not"
	line "niet KAZ! Sorry," ; "KAZ! Sorry, wrong"
	cont "verkeerd nummer." ; "number."
	done

PhoneWrongNumberAudreyText:
	text "Hallo, dit is" ; "Hello, this is"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text ". Hoe" ; ". How are"
	cont "gaat ie, AUDREY?" ; "you doing, AUDREY?"

	para "Huh? <PLAYER>?" ; "Huh? <PLAYER>?"
	line "Oeps! Mijn fout!" ; "Oops! My mistake!"
	done

PhoneSeeYouLaterText:
	text "Spreek je later!" ; "See you later!"
	done

PhoneByeByeText:
	text "Doei!" ; "Bye-bye!"
	done

PhoneSwarmGrassText:
	text "Je moet dit zien!" ; "You have to see"
	line "Het is bizar!" ; "this! It's wild!"

	para "Een hele groep" ; "A whole bunch of"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " doken" ; " have"

	para "op bij" ; "shown up around"
	line "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "!" ; "!"
	done

PhoneSwarmFishText:
	text "Het is geweldig!" ; "It's amazing!"

	para "Op @" ; "On @"
	text_ram wStringBuffer5 ; MaxLength 14
	text "," ; ","
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " bijten" ; " are"

	para "echt continu aan" ; "biting like there"
	line "mijn vishengel." ; "is no tomorrow."

	para "<PLAYER>, neem je" ; "<PLAYER>, bring"
	line "HENGEL mee, maat!" ; "your ROD, buddy!"
	done

PhoneSwarmCaveText:
	text "Ik hoorde dit net" ; "A friend just told"
	line "van een vriend." ; "me this."

	para "Hij zag veel" ; "He saw a lot of"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxPokemonNameLength
	text " in" ; " in"
	cont "@"
	text_ram wStringBuffer5 ; MaxLength MaxLandmarkLength
	text "." ; "."

	para "<PLAYER>, ga eens" ; "<PLAYER>, you ought"
	line "een kijkje nemen." ; "to go look."
	done

PhoneBugCatchingContestText:
	text "Ze organiseren" ; "They're holding"
	line "vandaag een KEVER-" ; "the Bug-Catching"

	para "TOERNOOI in het" ; "Contest today at"
	line "park." ; "the PARK."

	para "<PLAYER>, ga jij" ; "<PLAYER>, are you"
	line "meedoen?" ; "going to go?"
	done

IrwinRocketTakeoverRumorText:
	text "<PLAYER>, heb je" ; "<PLAYER>, did you"
	line "het al gehoord?" ; "know?"

	para "De radiotoren in" ; "I hear GOLDENROD's"
	line "GOLDENROD zou zijn" ; "RADIO TOWER was"

	para "gekaapt door" ; "taken over by TEAM"
	line "TEAM ROCKET." ; "ROCKET."

	para "Maar wat is TEAM" ; "But what exactly"
	line "ROCKET eigenlijk?" ; "is TEAM ROCKET?"
	done

GinaRocketTakeoverRumorText:
	text "<PLAYER>, heb je" ; "<PLAYER>, did you"
	line "het al gehoord?" ; "hear the news?"

	para "TEAM ROCKET heeft" ; "TEAM ROCKET has"
	line "de RADIOTOREN in" ; "taken over the"

	para "GOLDENROD CITY" ; "RADIO TOWER in"
	line "gekaapt." ; "GOLDENROD CITY."

	para "Hopelijk is" ; "I wonder if the"
	line "iedereen OK…" ; "workers are OK…"
	done
