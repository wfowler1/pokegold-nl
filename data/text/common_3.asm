_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Te weinig" ; "Not enough"
	line "munten." ; "coins."
	prompt

_SlotsRanOutOfCoinsText::
	text "Verdorie… Geen" ; "Darn… Ran out of"
	line "munten meer…" ; "coins…"
	done

_SlotsPlayAgainText::
	text "Weer spelen?" ; "Play again?"
	done

_SlotsLinedUpText::
	text "op een rij!" ; "lined up!"
	line "Won @"
	text_ram wStringBuffer2 ; MaxLength 3
	text " munten!" ; " coins!"
	done

_SlotsDarnText::
	text "Verdorie!" ; "Darn!"
	done

_GearTodayText::
	text_today
	text_end

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Je bent buiten het" ; "You're out of the"
	line "gebruiksgebied." ; "service area."
	prompt

_PokegearAskWhoCallText::
	text "Met wie wil" ; "Whom do you want"
	line "je bellen?" ; "to call?"
	done

_PokegearPressButtonText::
	text "Druk op een knop" ; "Press any button"
	line "om te sluiten." ; "to exit."
	done

_PokegearAskDeleteText::
	text "Verwijder dit" ; "Delete this stored"
	line "bewaarde nummer?" ; "phone number?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, fout" ; "Huh? Sorry, wrong"
	line "nummer!" ; "number!"
	done

_PhoneClickText::
	text "Klik!" ; "Click!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Dat nummer is" ; "That number is out"
	line "buiten bereik." ; "of the area."
	done

_PhoneJustTalkToThemText::
	text "Ga gewoon met ze" ; "Just go talk to"
	line "praten!" ; "that person!"
	done

_PhoneThankYouText::
	text "Bedankt!" ; "Thank you!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Wachtwoord OK." ; "Password OK."
	line "Kies VERDER &" ; "Select CONTINUE &"
	cont "reset" ; "reset settings."
	cont "instellingen."
	prompt

_PasswordWrongText::
	text "Fout wachtwoord!" ; "Wrong password!"
	prompt

_PasswordAskResetClockText::
	text "Reset de klok?" ; "Reset the clock?"
	done

_PasswordAskEnterText::
	text "Voer het wacht-" ; "Please enter the"
	line "woord in." ; "password."
	done

_ClearAllSaveDataText::
	text "Clear all save"
	line "data area?"
	done

_LearnedMoveText:: ; AlwaysReplace
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " leerde" ; " learned"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Welke aanval wordt" ; "Which move should"
	line "vergeten?" ; "be forgotten?"
	done

_StopLearningMoveText::
	text "Stop met leren van" ; "Stop learning"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "leerde niet" ; "did not learn"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " " ; " is"
	line "probeert" ; "trying to learn"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text " te" ; "."
	cont "leren."

	para "Maar @" ; "But @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "kan maximaal vier" ; "can't learn more"
	cont "aanvallen leren." ; "than four moves."

	para "Verwijder een oude" ; "Delete an older"
	line "aanval voor" ; "move to make room"
	cont "@" ; "for @"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 en…@" ; "1, 2 and…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Poef!@" ; " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " vergat" ; " forgot"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "."

	para "En…" ; "And…"
	prompt

_MoveCantForgetHMText::
	text "VM-aanvallen zijn" ; "HM moves can't be"
	line "niet te vergeten." ; "forgotten now."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Speel met drie" ; "Play with three"
	line "munten?" ; "coins?"
	done

_CardFlipNotEnoughCoinsText::
	text "Te weinig munten…" ; "Not enough coins…"
	prompt

_CardFlipChooseACardText::
	text "Kies een kaart." ; "Choose a card."
	done

_CardFlipPlaceYourBetText::
	text "Zet geld in." ; "Place your bet."
	done

_CardFlipPlayAgainText::
	text "Nog een keer" ; "Want to play"
	line "spelen?" ; "again?"
	done

_CardFlipShuffledText::
	text "De kaarten zijn" ; "The cards have"
	line "geschud." ; "been shuffled."
	prompt

_CardFlipYeahText::
	text "Jaaa!" ; "Yeah!"
	done

_CardFlipDarnText::
	text "Verdorie…" ; "Darn…"
	done

_BallDodgedText::
	text "Hij ontweek de" ; "It dodged the"
	line "geworpen BAL!" ; "thrown BALL!"

	para "Deze #MON" ; "This #MON"
	line "is niet te vangen!" ; "can't be caught!"
	prompt

_BallMissedText::
	text "Je miste de" ; "You missed the"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Oh nee! De #MON" ; "Oh no! The #MON"
	line "brak los!" ; "broke free!"
	prompt

_BallAppearedCaughtText::
	text "Aww! Het leek" ; "Aww! It appeared"
	line "te zijn gelukt!" ; "to be caught!"
	prompt

_BallAlmostHadItText::
	text "Aargh!"
	line "Bijna gelukt!" ; "Almost had it!"
	prompt

_BallSoCloseText::
	text "Verdraaid! Zo" ; "Shoot! It was so"
	line "dichtbij ook!" ; "close too!"
	prompt

Text_BallCaught::
	text "Hebbes! @" ; "Gotcha! @"
	text_ram wEnemyMonNickname
	text_start
	line "is gevangen!@" ; "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " ging" ; " was"
	line "naar BILL's PC." ; "sent to BILL's PC."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

_AskGiveNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text " steeg." ; " rose."
	prompt

_ItemCantUseOnMonText::
	text "Niet te gebruiken" ; "That can't be used"
	line "op deze #MON." ; "on this #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "De VERJAAG die je" ; "The REPEL used"
	line "eerder gebruikte" ; "earlier is still"
	cont "werkt nog." ; "in effect."
	prompt

_PlayedFluteText::
	text "Speelde de #" ; "Played the #"
	line "FLUTE."

	para "Nou, wat een leuk" ; "Now, that's a"
	line "leuk deuntje!" ; "catchy tune!"
	prompt

_FluteWakeUpText::
	text "Slapende #MON" ; "All sleeping"
	line "werden wakker." ; "#MON woke up."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> speelde" ; "<PLAYER> played the"
	line "de #FLUIT.@" ; "# FLUTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_CoinCaseCountText:: ; AlwaysReplace
	text "Munten:" ; "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Verhoog AP van" ; "Raise the PP of"
	line "welke aanval?" ; "which move?"
	done

_RestoreThePPOfWhichMoveText::
	text "Herstel AP van" ; "Restore the PP of"
	line "welke aanval?" ; "which move?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "'s AP" ; "'s PP"
	line "is op zijn hoogst." ; "is maxed out."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "'s AP" ; "'s PP"
	line "is verhoogd." ; "increased."
	prompt

_PPRestoredText::
	text "AP was hersteld." ; "PP was restored."
	prompt

_SentTrophyHomeText::
	text "Er zat een" ; "There was a trophy"
	line "trofee in!@" ; "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " zond prijs" ; " sent the"
	line "naar huis." ; "trophy home."
	prompt

_ItemLooksBitterText::
	text "Lijkt best bitter…" ; "It looks bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Dat werkt niet" ; "That can't be used"
	line "op een EI." ; "on an EGG."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het" ; "This isn't the"
	cont "moment daarvoor!" ; "time to use that!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Dat is van iemand" ; "That belongs to"
	line "anders!" ; "someone else!"
	prompt

_ItemWontHaveEffectText::
	text "Het zal geen" ; "It won't have any"
	line "effect hebben." ; "effect."
	prompt

_BallBlockedText::
	text "De trainer" ; "The trainer"
	line "blokkeerde de BAL!" ; "blocked the BALL!"
	prompt

_BallDontBeAThiefText::
	text "Niet stelen!" ; "Don't be a thief!"
	prompt

_NoCyclingText::
	text "Fietsen is hier" ; "Cycling isn't"
	line "niet toegestaan." ; "allowed here."
	prompt

_ItemCantGetOnText::
	text "Kunt niet rijden" ; "Can't get on your"
	line "op @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "." ; " now."
	prompt

_BallBoxFullText::
	text "De #MON BOX" ; "The #MON BOX"
	line "is vol. Dat kun je" ; "is full. That"
	cont "nu niet gebruiken." ; "can't be used now."
	prompt

_ItemUsedText::
	text "<PLAYER> gebruikte@" ; "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> ging op de@" ; "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stapte van@" ; "<PLAYER> got off@"
	text_low
	text "de @" ; "the @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kent" ; " knows"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "."
	prompt

_MoveKnowsOneText::
	text "Die #MON kent" ; "That #MON knows"
	line "een enkele aanval." ; "only one move."
	done

_AskDeleteMoveText::
	text "Oh, wil je" ; "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text " ver-" ; "?"
	cont "geten?"
	done

_DeleterForgotMoveText::
	text "Klaar! Je #MON" ; "Done! Your #MON"
	line "vergat de aanval." ; "forgot the move."
	done

_DeleterEggText::
	text "Een EI kent geen" ; "An EGG doesn't"
	line "aanvallen!" ; "know any moves!"
	done

_DeleterNoComeAgainText::
	text "Nee? Bezoek me" ; "No? Come visit me"
	line "later weer." ; "again."
	done

_DeleterAskWhichMoveText::
	text "Welke aanval moet" ; "Which move should"
	line "worden vergeten?" ; "it forget, then?"
	prompt

_DeleterIntroText::
	text "Um… Oh, ja, Ik ben" ; "Um… Oh, yes, I'm"
	line "de AANVALWISSER." ; "the MOVE DELETER."

	para "Ik wis aanvallen" ; "I can make #MON"
	line "van je #MON." ; "forget moves."

	para "Moet ik helpen een" ; "Shall I make a"
	line "aanval te wissen?" ; "#MON forget?"
	done

_DeleterAskWhichMonText::
	text "Welke #MON?" ; "Which #MON?"
	prompt

_DSTIsThatOKText::
	text " ZMR," ; " DST,"
	line "is dat OK?" ; "is that OK?"
	done

_TimeAskOkayText::
	text ","
	line "is dat OK?" ; "is that OK?"
	done

_TimesetAskDSTText::
	text "Wil je wisselen" ; "Do you want to"
	line "naar de Zomer-" ; "switch to Daylight"
	cont "tijd?" ; "Saving Time?"
	done

_TimesetDSTText::
	text "Ik heb de klok één" ; "I set the clock"
	line "uur voor je" ; "forward by one"
	cont "vooruitgezet." ; "hour."
	prompt

_TimesetAskNotDSTText::
	text "Is de Wintertijd" ; "Is Daylight Saving"
	line "aangebroken?" ; "Time over?"
	done

_TimesetNotDSTText::
	text "De klok is één uur" ; "I put the clock"
	line "achteruitgezet." ; "back one hour."
	prompt

_TimesetAskAdjustDSTText::
	text "Wil je de klok" ; "Do you want to"
	line "aanpassen" ; "adjust your clock"

	para "voor de Zomer-" ; "for Daylight"
	line "tijd?" ; "Saving Time?"
	done

_MomLostGearBookletText::
	text "Ik ben de hand-" ; "I lost the in-"
	line "leiding van de" ; "struction booklet"
	cont "#GEAR kwijt." ; "for the #GEAR."

	para "Kom over een" ; "Come back again in"
	line "tijdje terug." ; "a while."
	prompt
