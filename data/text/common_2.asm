_CantSurfText::
	text "Hier kun je geen" ; "You can't SURF"
	line "SURF gebruiken." ; "here."
	prompt

_AlreadySurfingText::
	text "Je bent al aan het" ; "You're already"
	line "SURFEN." ; "SURFING."
	prompt

_AskSurfText::
	text "Het water is rus-" ; "The water is calm."
	line "tig. SURFEN?" ; "Want to SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte WATERVAL!" ; "WATERFALL!"
	done

_HugeWaterfallText::
	text "Wauw, een gigan-" ; "Wow, it's a huge"
	line "tische waterval." ; "waterfall."
	done

_AskWaterfallText::
	text "Wil je WATERVAL" ; "Do you want to use"
	line "gebruiken?" ; "WATERFALL?"
	done

_UseDigText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte GRAVEN!" ; "DIG!"
	done

_UseEscapeRopeText::
	text "<PLAYER> gebruikte" ; "<PLAYER> used an"
	line "ONTSNAPTOUW." ; "ESCAPE ROPE."
	done

_CantUseDigText::
	text "Kun je hier niet" ; "Can't use that"
	line "gebruiken." ; "here."
	done

_TeleportReturnText::
	text "Terug naar vorig" ; "Return to the last"
	line "#MONCENTRUM." ; "#MON CENTER."
	done

_CantUseTeleportText::
	text "Kun je hier niet" ; "Can't use that"
	line "gebruiken." ; "here."
	done

_AlreadyUsingStrengthText::
	text "Een #MON ge-" ; "A #MON is using"
	line "bruikt al KRACHT." ; "STRENGTH already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte KRACHT!" ; "STRENGTH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kan" ; " can"
	line "rotsen schuiven." ; "move boulders."
	prompt

_AskStrengthText::
	text "Een #MON kan" ; "A #MON may be"
	line "dit verschuiven." ; "able to move this."

	para "Wil je" ; "Want to use"
	line "KRACHT gebruiken?" ; "STRENGTH?"
	done

_BouldersMoveText::
	text "Rotsen kunnen nu" ; "Boulders may now"
	line "worden verschoven!" ; "be moved!"
	done

_BouldersMayMoveText::
	text "A #MON zou dit" ; "A #MON may be"
	line "kunnen bewegen." ; "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte DRAAIKOLK!" ; "WHIRLPOOL!"
	prompt

_MayPassWhirlpoolText::
	text "Het is een heftige" ; "It's a vicious"
	line "draaikolk!" ; "whirlpool!"

	para "Een #MON kan er" ; "A #MON may be"
	line "wellicht langs." ; "able to pass it."
	done

_AskWhirlpoolText::
	text "Een draaikolk zit" ; "A whirlpool is in"
	line "in de weg." ; "the way."

	para "Wil je DRAAIKOLK" ; "Want to use"
	line "gebruiken?" ; "WHIRLPOOL?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " deed" ; " did a"
	line "een KOPSTOOT!" ; "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Niks…" ; "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "Een #MON kan in" ; "A #MON could be"
	line "deze boom zitten." ; "in this tree."

	para "Wil je KOPSTOOT" ; "Want to HEADBUTT"
	line "gebruiken?" ; "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte STEENKNAL!" ; "ROCK SMASH!"
	prompt

_MaySmashText::
	text "A #MON may be"
	line "able to break it."
	done

_AskRockSmashText::
	text "Deze rots lijkt" ; "This rock looks"
	line "breekbaar." ; "breakable."

	para "Wil je STEENKNAL" ; "Want to use ROCK"
	line "gebruiken?" ; "SMASH?"
	done

_RodBiteText::
	text "Oh!"
	line "Beet!" ; "A bite!"
	prompt

_RodNothingText::
	text "Niet eens" ; "Not even a nibble!"
	line "een hapje!"
	prompt

_UnusedNothingHereText::
	text "Zo te zien is hier" ; "Looks like there's"
	line "niks te vinden." ; "nothing here."
	prompt

_CantGetOffBikeText::
	text "Je kunt hier niet" ; "You can't get off"
	line "afstappen!" ; "here!"
	done

_GotOnBikeText::
	text "<PLAYER> stapte op" ; "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> stapte" ; "<PLAYER> got off"
	line "van @" ; "the @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	done

_AskCutText::
	text "Deze boom kun je" ; "This tree can be"
	line "SNIJDEN!" ; "CUT!"

	para "SNIJD gebruiken?" ; "Want to use CUT?"
	done

_CanCutText::
	text "Deze boom kun je" ; "This tree can be"
	line "SNIJDEN!" ; "CUT!"
	done

_FoundItemText::
	text "<PLAYER> vond" ; "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items!"
	done

_WhitedOutText::
	text "<PLAYER> heeft geen" ; "<PLAYER> is out of"
	line "bruikbare #MON!" ; "useable #MON!"

	para "<PLAYER> werd" ; "<PLAYER> whited"
	line "uitgeschakeld!" ; "out!"
	done

_ItemfinderItemNearbyText::
	text "Ja! DETECTOR" ; "Yes! ITEMFINDER"
	line "ziet een voorwerp" ; "indicates there's"
	cont "in de buurt." ; "an item nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! DETECTOR" ; "Nope! ITEMFINDER"
	line "reageert niet." ; "isn't responding."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text_start
	line "viel flauw!" ; "fainted!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> heeft geen" ; "<PLAYER> is out of"
	line "bruikbare #MON!" ; "useable #MON!"

	para "<PLAYER> werd" ; "<PLAYER> whited"
	line "uitgeschakeld!" ; "out!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3 ; MaxLength MaxPokemonNameLength
	text " ge-" ; " used"
	line "bruikte ZOETE" ; "SWEET SCENT!"
	cont "GEUR!"
	done

_SweetScentNothingText::
	text "Zo te zien is hier" ; "Looks like there's"
	line "niks…" ; "nothing here…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprenkelde" ; "<PLAYER> sprinkled"
	line "water."

	para "Maar er gebeurde" ; "But nothing"
	line "niks…" ; "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "zijn genezen!" ; "were all healed!"
	done

_AnEggCantHoldAnItemText::
	text "EI kan geen voor-" ; "An EGG can't hold"
	line "werp vasthouden." ; "an item."
	prompt

_PackNoItemText::
	text "Geen voorwerpen." ; "No items."
	done

_AskThrowAwayText::
	text "Hoeveel wil je" ; "Throw away how"
	line "weggooien?" ; "many?"
	done

_AskQuantityThrowAwayText::
	text "Gooi @" ; "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg?" ; "(S)?"
	done

_ThrewAwayText::
	text "Gooide" ; "Threw away"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg." ; "(S)."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Dit is niet het" ; "This isn't the"
	cont "moment daarvoor!" ; "time to use that!"
	prompt

_YouDontHaveAMonText::
	text "Je hebt geen" ; "You don't have a"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registreerde" ; "Registered the"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

_CantRegisterText::
	text "Kan niet met" ; "You can't register"
	line "dat voorwerp." ; "that item."
	prompt

_AskItemMoveText::
	text "Waar moet dit" ; "Where should this"
	line "naartoe?" ; "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Niet te gebruiken" ; "You can't use it"
	line "in een gevecht." ; "in a battle."
	prompt

_ActorNameText:: ; AlwaysReplace
	text "<USER>@"
	text_end

_UsedMove1Text:: ; AlwaysReplace
	text_start
	line "deed @" ; "used @"
	text_end

_UsedMove2Text:: ; AlwaysReplace
	text_start
	line "deed @" ; "used @"
	text_end

_UsedInsteadText:: ; PreviousInstruction line
	text "in plaats" ; "instead,"
	cont "van, @" ; "@"
	text_end

_MoveNameText:: ; AlwaysReplace
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>steeg fors!" ; "<SCROLL>went way up!"
	prompt

_BattleStatWentUpText::
	text " steeg!" ; " went up!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>daalde flink!" ; "<SCROLL>sharply fell!"
	prompt

_BattleStatFellText::
	text " daalde!" ; " fell!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "maakte wervelwind!" ; "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "nam zonlicht op!" ; "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "boog het hoofd!" ; "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "gloeit!" ; "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "vloog omhoog!" ; "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "groef een gat!" ; "dug a hole!"
	prompt

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText:: ; AlwaysReplace
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " kwam" ; " came"
	line "uit het EI!@" ; "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_LeftWithDayCareLadyText::
	text "Het is @" ; "It's @"
	text_ram wBreedMon2Nickname ; MaxLength MaxPokemonNameLength
	text_start
	line "die achtergelaten" ; "that was left with"
	cont "was bij OPVANG." ; "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "Het is @" ; "It's @"
	text_ram wBreedMon1Nickname ; MaxLength MaxPokemonNameLength
	text_start
	line "die achtergelaten" ; "that was left with"
	cont "was bij OPVANG." ; "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "Het glittert van" ; "It's brimming with"
	line "de energie." ; "energy."
	prompt

_BreedNoInterestText::
	text "Het heeft geen" ; "It has no interest"
	line "interesse in" ; "in @"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Het lijkt te geven" ; "It appears to care"
	line "om @" ; "for @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedFriendlyText::
	text "Het is vriendelijk" ; "It's friendly with"
	line "met @" ; "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_BreedShowsInterestText::
	text "Toont interesse" ; "It shows interest"
	line "in @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_EmptyMailboxText::
	text "Er is hier geen" ; "There's no MAIL"
	line "POST." ; "here."
	prompt

_MailClearedPutAwayText::
	text "De afgevinkte POST" ; "The cleared MAIL"
	line "werd weggestopt." ; "was put away."
	prompt

_MailPackFullText::
	text "De TAS is vol." ; "The PACK is full."
	prompt

_MailMessageLostText::
	text "Bericht in de POST" ; "The MAIL's message"
	line "verdwijnt. OK?" ; "will be lost. OK?"
	done

_MailAlreadyHoldingItemText::
	text "Houdt al een voor-" ; "It's already hold-"
	line "werp vast." ; "ing an item."
	prompt

_MailEggText::
	text "Een EI kan geen" ; "An EGG can't hold"
	line "POST vasthouden." ; "any MAIL."
	prompt

_MailMovedFromBoxText::
	text "De POST is ver-" ; "The MAIL was moved"
	line "huisd uit INBOX." ; "from the MAILBOX."
	prompt

_WasSentToBillsPCText::
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " gaat" ; " was"
	line "naar BILL's PC." ; "sent to BILL's PC."
	prompt

_PCGottaHavePokemonText::
	text "Je moet #MON" ; "You gotta have"
	line "hebben voor dat!" ; "#MON to call!"
	prompt

_PCWhatText::
	text "Wat?" ; "What?"
	done

_PCMonHoldingMailText::
	text "Er is een #MON" ; "There is a #MON"
	line "met POST." ; "holding MAIL."

	para "Verwijder a.u.b." ; "Please remove the"
	line "de POST." ; "MAIL."
	prompt

_PCNoSingleMonText::
	text "Je hebt geen" ; "You don't have a"
	line "enkele #MON!" ; "single #MON!"
	prompt

_PCCantDepositLastMonText::
	text "Je laatste #MON" ; "You can't deposit"
	line "is niet te" ; "your last #MON!"
	cont "plaatsen!";
	prompt

_PCCantTakeText::
	text "Je kunt niet meer" ; "You can't take any"
	line "#MON nemen." ; "more #MON."
	prompt

_ContestCaughtMonText::
	text "Ving @" ; "Caught @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	prompt

_ContestAskSwitchText::
	text "Wissel #MON?" ; "Switch #MON?"
	done

_ContestAlreadyCaughtText::
	text "Je ving al" ; "You already caught"
	line "een @" ; "a @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "De winnaar van de" ; "This Bug-Catching"
	line "Wedstrijd is@" ; "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "wie een" ; "who caught a"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "De winnende score" ; "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Op de tweede plek" ; "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "wie een" ; "who caught a"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "De score was" ; "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "De derde plek was" ; "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "wie een" ; "who caught a"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " ving!@" ; "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "De score was" ; "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punten!" ; " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Laat me die" ; "Let me measure"
	line "MAGIKARP meten." ; "that MAGIKARP."

	para "…Hm, hij is" ; "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1 ; MaxLength 6
	text " cm groot." ; "."
	prompt

_KarpGuruRecordText:: ; AlwaysReplace
	text "HUIDIG RECORD" ; "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1 ; MaxLength 6
	text " cm gevangen" ; " caught by"
	line "door @" ; "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Er is een match" ; "We have a match"
	line "met het ID-nummer" ; "with the ID number"

	para "van @" ; "of @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " in"
	line "je team." ; "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Gefeliciteerd!" ; "Congratulations!"

	para "Er is een match" ; "We have a match"
	line "met het ID-nummer" ; "with the ID number"

	para "van @" ; "of @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " in"
	line "je PC BOX." ; "your PC BOX."
	prompt

_CaughtAskNicknameText::
	text "Geef een naam aan" ; "Give a nickname to"
	line "de @" ; "the @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " die" ; " you"
	cont "je kreeg?" ; "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Je moet" ; "Bzzzzt! You must"
	line "een #MON hebben" ; "have a #MON to"
	cont "om dit te doen!" ; "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> zette de" ; "<PLAYER> turned on"
	line "PC aan." ; "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Wat wil je" ; "What do you want"
	line "doen?" ; "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "Hoeveel wil je" ; "How many do you"
	line "er uit halen?" ; "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Trok @" ; "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "terug." ; text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Er is geen plek" ; "There's no room"
	line "voor voorwerpen." ; "for more items."
	prompt

_PlayersPCNoItemsText::
	text "Geen voorwerpen!" ; "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "Hoeveel wil je er" ; "How many do you"
	line "storten?" ; "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Stortte @" ; "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "Er is geen plek om" ; "There's no room to"
	line "iets te storten." ; "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> zette de" ; "<PLAYER> turned on"
	line "PC aan." ; "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Wiens PC openen?" ; "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "geopend." ; "accessed."

	para "#MON Opslag-" ; "#MON Storage"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Opende eigen PC." ; "Accessed own PC."

	para "Voorwerpen opslag-" ; "Item Storage"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "geopend." ; "accessed."

	para "#DEX Beoordeel-" ; "#DEX Rating"
	line "systeem geopend." ; "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link gesloten…" ; "Link closed…"
	done

_OakPCText1::
	text "Moet je #DEX" ; "Want to get your"
	line "worden beoordeeld?" ; "#DEX rated?"
	done

_OakPCText2::
	text "Huidige voltooi-" ; "Current #DEX"
	line "niveau #DEX:" ; "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3 ; MaxLength 3
	text " #MON gezien" ; " #MON seen"
	line "@"
	text_ram wStringBuffer4 ; MaxLength 3
	text " #MON bezit" ; " #MON owned"

	para "PROF.OAK's"
	line "Oordeel:" ; "Rating:"
	done

_OakRating01::
	text "Zoek naar #MON" ; "Look for #MON"
	line "in begrasd gebied!" ; "in grassy areas!"
	done

_OakRating02::
	text "Goed. Ik zie dat" ; "Good. I see you"
	line "je snapt hoe #-" ; "understand how to"
	cont "BALLEN werken." ; "use # BALLS."
	done

_OakRating03::
	text "Je begint hier" ; "You're getting"
	line "goed in te worden." ; "good at this."

	para "Maar je hebt een" ; "But you have a"
	line "lange weg te gaan." ; "long way to go."
	done

_OakRating04::
	text "Je moet je #DEX" ; "You need to fill"
	line "vullen." ; "up the #DEX."

	para "Vang allerlei" ; "Catch different"
	line "soorten #MON!" ; "kinds of #MON!"
	done

_OakRating05::
	text "Je doet duidelijk" ; "You're trying--I"
	line "je best." ; "can see that."

	para "Je #DEX vult" ; "Your #DEX is"
	line "al aardig." ; "coming together."
	done

_OakRating06::
	text "Om te evolueren" ; "To evolve, some"
	line "groeien #MON," ; "#MON grow,"

	para "anderen gebruiken" ; "others use the"
	line "er STENEN voor." ; "effects of STONES."
	done

_OakRating07::
	text "Heb je al een" ; "Have you gotten a"
	line "VISHENGEL? Je kunt" ; "fishing ROD? You"

	para "#MON vangen" ; "can catch #MON"
	line "door te vissen." ; "by fishing."
	done

_OakRating08::
	text "Uitstekend! Je" ; "Excellent! You"
	line "lijkt verzamelen" ; "seem to like col-"
	cont "leuk te vinden!" ; "lecting things!"
	done

_OakRating09::
	text "Sommige #MON" ; "Some #MON only"
	line "zie je alleen op" ; "appear during"

	para "bepaalde momenten" ; "certain times of"
	line "van de dag." ; "the day."
	done

_OakRating10::
	text "Je #DEX begint" ; "Your #DEX is"
	line "voller te raken." ; "filling up. Keep"
	cont "Ga zo door!" ; "up the good work!"
	done

_OakRating11::
	text "Ik vind het knap." ; "I'm impressed."
	line "Je evolueert nu" ; "You're evolving"

	para "ook je #MON, en" ; "#MON, not just"
	line "vangt niet alleen." ; "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom #"
	cont "BALLS should help."
	done

_OakRating13::
	text "Wauw. Je hebt meer" ; "Wow. You've found"
	line "#MON gevangen" ; "more #MON than"

	para "dan het laatste" ; "the last #DEX"
	line "#DEX-project." ; "research project."
	done

_OakRating14::
	text "Ruil je jouw" ; "Are you trading"
	line "#MON?" ; "your #MON?"

	para "Het is moeilijk" ; "It's tough to do"
	line "alleen te doen!" ; "this alone!"
	done

_OakRating15::
	text "Wauw! Je zit op" ; "Wow! You've hit"
	line "200! Je #DEX" ; "200! Your #DEX"
	cont "ziet er goed uit!" ; "is looking great!"
	done

_OakRating16::
	text "Je hebt zoveel" ; "You've found so"
	line "#MON gevonden!" ; "many #MON!"

	para "Je helpt mijn" ; "You've really"
	line "studie ontzettend!" ; "helped my studies!"
	done

_OakRating17::
	text "Verbluffend! Je" ; "Magnificent! You"
	line "kan inmiddels zelf" ; "could become a"

	para "een #MON-" ; "#MON professor"
	line "professor worden!" ; "right now!"
	done

_OakRating18::
	text "Je #DEX is" ; "Your #DEX is"
	line "fenomenaal! Je" ; "amazing! You're"

	para "kunt dit pro-" ; "ready to turn"
	line "fessioneel doen!" ; "professional!"
	done

_OakRating19::
	text "Wauw! Een perfecte" ; "Whoa! A perfect"
	line "#DEX! Dit" ; "#DEX! I've"

	para "was mijn droom!" ; "dreamt about this!"
	line "Gefeliciteerd!" ; "Congratulations!"
	done

_OakPCText4::
	text "Connectie PROF." ; "The link to PROF."
	line "OAK's PC gesloten." ; "OAK's PC closed."
	done

_MemoryGameYeahText::
	text " , ja!" ; " , yeah!"
	done

_MemoryGameDarnText::
	text "Verdorie…" ; "Darn…"
	done

_StartMenuContestEndText::
	text "Wil je de Wed-" ; "Would you like to"
	line "strijd stoppen?" ; "end the Contest?"
	done

_ItemsTossOutHowManyText::
	text "Hoeveel" ; "Toss out how many"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "weggooien?" ; text "(S)?"
	done

_ItemsThrowAwayText::
	text "Gooi @" ; "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " weg?" ; "(S)?"
	done

_ItemsDiscardedText::
	text "Weggegooid" ; "Discarded"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	prompt

_ItemsTooImportantText::
	text "Dat is te belang-" ; "That's too impor-"
	line "rijk!" ; "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "Dit is daar niet" ; "This isn't the"
	cont "het moment voor!" ; "time to use that!"
	done

_PokemonSwapItemText::
	text "Nam @" ; "Took @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text "'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " en" ; " and"

	para "liet @" ; "made it hold"
	; line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	line "vasthouden." ; text "."
	prompt

_PokemonHoldItemText::
	text "Liet @" ; "Made @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text_start
	line "een @" ; "hold @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start
	cont "vasthouden." ; text "."
	prompt

_PokemonRemoveMailText::
	text "Verwijder eerst" ; "Please remove the"
	line "de POST." ; "MAIL first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text " houdt" ; " isn't"
	line "niets vast." ; "holding anything."
	prompt

_ItemStorageFullText::
	text "Opslagplek is" ; "Item storage space"
	line "vol." ; "full."
	prompt

_PokemonTookItemText::
	text "Nam @" ; "Took @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	line "van @" ; "from @"
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer ; MaxLength MaxPokemonNameLength
	; text " is"
	text_start
	line "heeft al" ; "already holding"

	para "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " vast." ; "."
	line "Wissel voorwerp?" ; "Switch items?"
	done

_ItemCantHeldText::
	text "Voorwerp kun je" ; "This item can't be"
	line "niet vasthouden." ; "held."
	prompt

_MailLoseMessageText::
	text "POST raakt bericht" ; "The MAIL will lose"
	line "kwijt. OK?" ; "its message. OK?"
	done

_MailDetachedText::
	text "MAIL losgemaakt" ; "MAIL detached from"
	line "van @" ; "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "."
	prompt

_MailNoSpaceText::
	text "Geen plek om POST" ; "There's no space"
	line "te verwijderen." ; "for removing MAIL."
	prompt

_MailAskSendToPCText::
	text "Stuur verwijderde" ; "Send the removed"
	line "POST naar je PC?" ; "MAIL to your PC?"
	done

_MailboxFullText::
	text "MAILBOX van je PC" ; "Your PC's MAILBOX"
	line "zit vol." ; "is full."
	prompt

_MailSentToPCText::
	text "De POST werd ver-" ; "The MAIL was sent"
	line "stuurd naar je PC." ; "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Niet genoeg LP!" ; "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "Voorwerp in je TAS" ; "An item in your"
	line "kan worden gere-" ; "PACK may be"

	para "gistreerd op de" ; "registered for use"
	line "SELECT-knop." ; "on SELECT Button."
	done

_MainMenuTimeUnknownText::
	text "Kloktijd onbekend" ; "Clock time unknown"
	done

_OakText1::
	text "Hallo! Sorry dat" ; "Hello! Sorry to"
	line "je moest wachten!" ; "keep you waiting!"

	para "Welkom in de we-" ; "Welcome to the"
	line "reld van #MON!" ; "world of #MON!"

	para "Ik ben OAK." ; "My name is OAK."

	para "Ze noemen mij de" ; "People call me the"
	line "#MON PROF." ; "#MON PROF."
	prompt

_OakText2::
	text "In deze wereld" ; "This world is in-"
	line "vind je wezens" ; "habited by crea-"
	cont "die we #MON" ; "tures that we call"
	cont "noemen.@" ; "#MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

_OakText4::
	text "Mensen en #MON" ; "People and #MON"
	line "leven samen door" ; "live together by"

	para "elkaar te onder-" ; "supporting each"
	line "steunen." ; "other."

	para "Sommigen spelen" ; "Some people play"
	line "samen, anderen" ; "with #MON, some"
	cont "vechten ermee." ; "battle with them."
	prompt

_OakText5::
	text "Maar we weten nog" ; "But we don't know"
	line "niet alles over" ; "everything about"
	cont "#MON." ; "#MON yet."

	para "Er zijn nog veel" ; "There are still"
	line "mysteries om te" ; "many mysteries to"
	cont "ontrafelen." ; "solve."

	para "Daarom bestudeer" ; "That's why I study"
	line "ik #MON." ; "#MON every day."
	prompt
_OakText6::
	text "Oké, wat was ook" ; "Now, what did you"
	line "alweer je naam?" ; "say your name was?"
	prompt

_OakText7::
	text "<PLAYER>, ben je" ; " ; "<PLAYER>, are you"
	line "er klaar voor?" ; "ready?"

	para "Jouw #MON-" ; "Your very own"
	line "verhaal gaat" ; "#MON story is"
	cont "nu beginnen." ; "about to unfold."

	para "Er volgen leuke" ; "You'll face fun"
	line "dingen en lastige" ; "times and tough"
	cont "uitdagingen." ; "challenges."

	para "Een wereld vol" ; "A world of dreams"
	line "dromen en avontuur" ; "and adventures"

	para "met #MON" ; "with #MON"
	line "wacht op je! Kom!" ; "awaits! Let's go!"

	para "Ik zie je later" ; "I'll be seeing you"
	line "weer!" ; "later!"
	done

_ClockTimeMayBeWrongText::
	text "Wellicht staat de" ; "The clock's time"
	line "klok verkeerd." ; "may be wrong."

	para "Stel de tijd" ; "Please reset the"
	line "opnieuw in." ; "time."
	prompt

_ClockSetWithControlPadText::
	text "Stel in met de" ; "Set with the"
	line "richtingstoetsen." ; "Control Pad."

	para "Bevestig: A-knop" ; "Confirm: A Button"
	line "Annuleer:  B-knop" ; "Cancel:  B Button"
	done

_ClockIsThisOKText::
	text "Is dit OK?" ; "Is this OK?"
	done

_ClockHasResetText::
	text "De klok is" ; "The clock has been"
	line "gereset." ; "reset."
	done

_LinkTimeoutText::
	text "Er is teveel tijd" ; "Too much time has"
	line "gepasseerd. Pro-" ; "elapsed. Please"
	cont "beer nog eens." ; "try again."
	prompt

_LinkTradeCantBattleText::
	text "Als je die #MON" ; "If you trade that"
	line "ruilt, kun je niet" ; "#MON, you won't"
	cont "vechten." ; "be able to battle."
	prompt

_LinkAbnormalMonText::
	text "De @" ; "Your friend's"
	; line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "van je vriend" ; text " appears"
	cont "is abnormaal!" ; "to be abnormal!"
	prompt

_LinkAskTradeForText::
	text "Ruil @" ; "Trade @"
	text_ram wBufferTrademonNickname
	text_start
	line "voor @" ; "for @"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "?"
	done

_WouldYouLikeToSaveTheGameText::
	text "Wil je de game" ; "Would you like to"
	line "opslaan?" ; "save the game?"
	done

_SavingDontTurnOffThePowerText::
	text "OPSLAAN… NIET" ; "SAVING… DON'T TURN"
	line "UITSCHAKELEN." ; "OFF THE POWER."
	done

_SavedTheGameText::
	text "<PLAYER> sloeg het" ; "<PLAYER> saved"
	line "spel op." ; "the game."
	done

_AlreadyASaveFileText::
	text "Er is al een op-" ; "There is already a"
	line "slagbestand. OK om" ; "save file. Is it"
	cont "te overschrijven?" ; "OK to overwrite?"
	done

_AnotherSaveFileText::
	text "Er is nog een op-" ; "There is another"
	line "slagbestand. OK om" ; "save file. Is it"
	cont "te overschrijven?" ; "OK to overwrite?"
	done

_SaveFileCorruptedText::
	text "Het opslagbestand" ; "The save file is"
	line "is gecorrumpeerd!" ; "corrupted!"
	prompt

_ChangeBoxSaveText::
	text "Als je wisselt van" ; "When you change a"
	line "#MON-BOX wordt" ; "#MON BOX, data"
	cont "data bewaard. OK?" ; "will be saved. OK?"
	done

_MoveMonWOMailSaveText::
	text "Als je een #MON" ; "Each time you move"
	line "verplaatst, wordt" ; "a #MON, data"
	cont "opgeslagen. OK?" ; "will be saved. OK?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "'Window save area'" ; "The window save"
	line "overschreden." ; "area was exceeded."
	done

_WindowPoppingErrorText::
	text "Geen vensters meer" ; "No windows avail-"
	line "voor pops." ; "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupt evenement!" ; "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG-evenement" ; "BG event"
	done

_CoordinatesEventText::
	text "Coordineert event" ; "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxItemNameLength
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> stopte" ; "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text " in"
	cont "de @" ; "the @"
	text_ram wStringBuffer3 ; MaxLength MaxBagPocketNameLength
	text "."
	prompt

_PocketIsFullText::
	text "De @" ; "The @"
	text_ram wStringBuffer3 ; MaxLength MaxBagPocketNameLength
	text_start
	line "is vol…" ; "is full…"
	prompt

_CongratulationsYourPokemonText::
	text "Gefeliciteerd!" ; "Congratulations!"
	line "Je @" ; "Your @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "evolueerde in" ; "evolved into"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	done

_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_start
	line "stopte de" ; "stopped evolving!"
	cont "evolutie!"
	prompt

_EvolvingText::
	text "Wat? @" ; "What? @"
	text_ram wStringBuffer2 ; MaxLength MaxPokemonNameLength
	text_start
	line "evolueert!" ; "is evolving!"
	done

_MartHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "is dan ¥@" ; "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo, schat." ; "Hello, dear."

	para "Ik heb goedkope" ; "I sell inexpensive"
	line "kruidenmedicijnen." ; "herbal medicine."

	para "Ze werken goed," ; "They're good, but"
	line "maar zijn bitter." ; "a trifle bitter."

	para "Je #MON vindt" ; "Your #MON may"
	line "ze wellicht vies." ; "not like them."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "is dan ¥@" ; "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Dankje, schat." ; "Thank you, dear."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Je TAS is" ; "Oh? Your PACK is"
	line "vol, schat." ; "full, dear."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… Je hebt" ; "Hehehe… You don't"
	line "niet genoeg geld." ; "have the money."
	done

_HerbalLadyComeAgainText::
	text "Tot snel, schat." ; "Come again, dear."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hoihoi! Wil je wat" ; "Hiya! Care to see"
	line "koopjes zien?" ; "some bargains?"

	para "Ik heb zeldzaam" ; "I sell rare items"
	line "spul dat je ner-" ; "that nobody else"

	para "gens vindt--maar" ; "carries--but only"
	line "eentje van elk." ; "one of each item."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text " kost" ; " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Wil je" ; ". Want it?"
	cont "het?"
	done

_BargainShopThanksText::
	text "Bedankt." ; "Thanks."
	done

_BargainShopPackFullText::
	text "Uh-oh, je TAS" ; "Uh-oh, your PACK"
	line "zit tjokvol." ; "is chock-full."
	done

_BargainShopSoldOutText::
	text "Je hebt dat al" ; "You bought that"
	line "gekocht. Ik hebl" ; "already. I'm all"
	cont "niet meer." ; "sold out of it."
	done

_BargainShopNoFundsText::
	text "Uh-oh, je heb te" ; "Uh-oh, you're"
	line "weinig geld." ; "short on funds."
	done

_BargainShopComeAgainText::
	text "Kom nog eens" ; "Come by again"
	line "langs." ; "sometime."
	done

_PharmacyIntroText::
	text "Wat is er? Heb je" ; "What's up? Need"
	line "medicijnen nodig?" ; "some medicine?"
	done

_PharmacyHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text_start ; text "(S)"
	line "kost je ¥@" ; "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Veel dank!" ; "Thanks much!"
	done

_PharmacyPackFullText::
	text "Je hebt geen" ; "You don't have any"
	line "plek meer." ; "more space."
	done

_PharmacyNoMoneyText::
	text "Huh? Dat is te" ; "Huh? That's not"
	line "weinig geld." ; "enough money."
	done

_PharmacyComeAgainText::
	text "Oké." ; "All right."
	line "Tot later weer." ; "See you around."
	done

_NothingToSellText::
	text "Je hebt niks om te" ; "You don't have"
	line "verkopen." ; "anything to sell."
	prompt

_MartSellHowManyText::
	text "Hoeveel?" ; "How many?"
	done

_MartSellPriceText::
	text "Ik kan je" ; "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text " betalen." ; "."

	para "Is dat OK?" ; "Is that OK?"
	done

_MartWelcomeText::
	text "Welkom! Hoe kan ik" ; "Welcome! How may I"
	line "je helpen?" ; "help you?"
	done

_MartThanksText::
	text "Hier is het." ; "Here you are."
	line "Dankjewel!" ; "Thank you!"
	done

_MartNoMoneyText::
	text "Je hebt te weinig" ; "You don't have"
	line "geld." ; "enough money."
	done

_MartPackFullText::
	text "Je kunt geen spul-" ; "You can't carry"
	line "len meer dragen." ; "any more items."
	done

_MartCantBuyText::
	text "Sorry, I can't buy"
	line "that from you."
	done

_MartComeAgainText::
	text "Kom snel weer!" ; "Please come again!"
	done

_MartAskMoreText::
	text "Kan ik nog iets" ; "Can I do anything"
	line "voor je doen?" ; "else for you?"
	done

_MartBoughtText::
	text "Heb ¥@" ; "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " voor" ; " for"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "." ; "(S)."
	done

_SlotsBetHowManyCoinsText::
	text "Hoeveel" ; "Bet how many"
	line "wedden?" ; "coins?"
	done

