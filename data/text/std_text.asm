NurseMornText:
	text "Goedemorgen!" ; "Good morning!"
	line "Welkom bij ons" ; "Welcome to our"
	cont "#MONCENTRUM." ; "#MON CENTER."
	done

NurseDayText:
	text "Hallo!" ; "Hello!"
	line "Welkom bij ons" ; "Welcome to our"
	cont "#MONCENTRUM." ; "#MON CENTER."
	done

NurseNiteText:
	text "Goedenavond!" ; "Good evening!"
	line "Het is al laat." ; "You're out late."

	para "Welkom bij ons" ; "Welcome to our"
	line "#MONCENTRUM." ; "#MON CENTER."
	done

NurseAskHealText:
	text "We kunnen je #-" ; "We can heal your"
	line "MON weer helemaal" ; #MON to perfect"
	cont "genezen." ; "health."

	para "Zal ik je" ; "Shall we heal your"
	line "#MON genezen?" ; "#MON?"
	done

NurseTakePokemonText:
	text "Oké, mag ik je" ; "OK, may I see your"
	line "#MON zien?" ; "#MON?"
	done

NurseReturnPokemonText:
	text "Bedankt voor het" ; "Thank you for"
	line "wachten." ; "waiting."

	para "Je #MON zijn" ; "Your #MON are"
	line "helemaal genezen." ; "fully healed."
	done

NurseGoodbyeText:
	text "We hopen je weer" ; "We hope to see you"
	line "te zien." ; "again."
	done

; not used
	text "We hopen je weer" ; "We hope to see you"
	line "te zien." ; "again."
	done

NursePokerusText:
	text "Je #MON hebben" ; "Your #MON ap-"
	line "veel kleine leven-" ; "pear to have tiny"

	para "svormen op ze." ; "life forms stuck"
	; line "to them."

	para "Je #MON zijn" ; "Your #MON are"
	line "gezonde en lijken" ; "healthy and seem"
	cont "goed." ; "to be fine."

	para "Maar meer weten we" ; "But we can't tell"
	line "hier in het" ; "you anything more"

	para "#MON CENTRUM" ; "at a #MON"
	line "niet." ; "CENTER."
	done

DifficultBookshelfText:
	text "Hij staat vol met" ; "It's full of"
	line "moeilijke boeken." ; "difficult books."
	done

PictureBookshelfText:
	text "Een verzameling" ; "A whole collection"
	line "#MON kinder-" ; "of #MON picture"
	cont "boeken!" ; "books!"
	done

MagazineBookshelfText:
	text "#MON-" ; "#MON magazines…"
	line "tijdschriften…"
	cont "#MON PAL,"

	para "#MON-HANBOEK," ; "#MON HANDBOOK,"
	line "#MON GRAPH…"
	done

TeamRocketOathText:
	text "TEAM ROCKET-EED" ; "TEAM ROCKET OATH"

	para "Steel #MON" ; "Steal #MON for"
	line "voor geld!" ; "profit!"

	para "Misbruik #MON" ; "Exploit #MON"
	line "voor geld!" ; "for profit!"

	para "#MON bestaan" ; "All #MON exist"
	line "voor de glorie van" ; "for the glory of"
	cont "TEAM ROCKET!"
	done

IncenseBurnerText:
	text "Wat is dit?" ; "What is this?"

	para "Oh, het is een" ; "Oh, it's an"
	line "wierrookhouder!" ; "incense burner!"
	done

MerchandiseShelfText:
	text "Heel veel #MON" ; "Lots of #MON"
	line "merchandise!"
	done

LookTownMapText:
	text "Het is een" ; "It's the TOWN MAP."
	line "REGIOKAART."
	done

WindowText:
	text "Mijn spiegelbeeld!" ; "My reflection!"
	line "Ziet er goed uit!" ; "Lookin' good!"
	done

TVText:
	text "Het is een TV." ; "It's a TV."
	done

HomepageText:
	text "#MON DAGBOEK" ; "#MON JOURNAL"
	line "INHOUD…" ; "HOME PAGE…"

	para "Het is niet" ; "It hasn't been"
	line "bijgewerkt…" ; "updated…"
	done

; not used
	text "#MON RADIO!"

	para "Bel nu met je" ; "Call in with your"
	line "verzoekjes!" ; "requests now!"
	done

TrashCanText:
	text "Er staat niks" ; "There's nothing in"
	line "in…" ; "here…"
	done

; not used
	text "Een #MON kan" ; "A #MON may be"
	line "dit wellicht" ; "able to move this."
	cont "duwen."
	done

; not used
	text "Kan een #MON" ; "Maybe a #MON"
	line "dit breken?" ; "can break this."
	done

PokecenterSignText:
	text "Genees je #MON!" ; "Heal Your #MON!"
	line "#MONCENTRUM" ; "#MON CENTER"
	done

MartSignText:
	text "Voor al je" ; "For All Your"
	line "#MON-spullen" ; "#MON Needs"

	para "PKMN-SUPERMARKT" ; "#MON MART"
	done

ContestResults_ReadyToJudgeText:
	text "We beoordelen de" ; "We will now judge"
	line "#MON die je" ; "the #MON you've"
	cont "hebt gevangen." ; "caught."

	para "<……>"
	line "<……>"

	para "We hebben de win-" ; "We have chosen the"
	line "naars gekozen!" ; "winners!"

	para "Ben je hier klaar" ; "Are you ready for"
	line "voor?" ; "this?"
	done

AskNumber1MText:
	text "Wow! You're pretty"
	line "tough."

	para "Could I get your"
	line "phone number?"

	para "I'll call you for"
	line "a rematch."
	done

AskNumber2MText:
	text "Register the phone"
	line "number?"
	done

RegisteredNumberMText:
	text "<PLAYER> registered"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "'s number."
	done

NumberAcceptedMText:
	text "I'll call you if"
	line "anything comes up."
	done

NumberDeclinedMText:
	text "Oh, OK…"
	line "Just talk to me if"

	para "you want to get my"
	line "phone number."
	done

PhoneFullMText:
	text "Your phone doesn't"
	line "have enough memory"
	cont "for more numbers."
	done

RematchMText:
	text "I was waiting for"
	line "you. Let's battle!"
	done

AskNumber1FText:
	text "Wow, you're good"
	line "at battling."

	para "Want to give me"
	line "your phone number?"

	para "I'll phone you for"
	line "another battle."
	done

AskNumber2FText:
	text "Register the phone"
	line "number?"
	done

RegisteredNumberFText:
	text "<PLAYER> registered"
	line "@"
	text_ram wStringBuffer3 ; MaxLength 9
	text "'s number."
	done

NumberAcceptedFText:
	text "I'll call you if"
	line "something's up."
	done

NumberDeclinedFText:
	text "Oh, fine then…"
	line "If you want to get"

	para "my phone number,"
	line "just tell me."
	done

PhoneFullFText:
	text "Your phone doesn't"
	line "have enough memory"
	cont "for more numbers."
	done

RematchFText:
	text "I waited for you."
	line "Let's battle!"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER> wins the"
	line "No. @"
	text_ram wStringBuffer3 ; MaxLength 1
	text " prize,"
	cont "a @"
	text_ram wStringBuffer4 ; MaxLength MaxItemNameLength
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxItemNameLength
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Graag tot de vol-" ; "Please join us for"
	line "gende Wedstrijd!" ; "the next Contest!"
	done

ContestResults_ConsolationPrizeText:
	text "De rest krijgt een" ; "Everyone else gets"
	line "BES als troost-" ; "a BERRY as a con-"
	cont "prijs!" ; "solation prize!"
	done

ContestResults_DidNotWinText:
	text "Hopelijk volgende" ; "We hope you do"
	line "keer beter." ; "better next time."
	done

ContestResults_ReturnPartyText:
	text "We geven weer jouw" ; "We'll return the"
	line "#MON terug." ; "#MON we kept"

	para "Alsjeblieft!" ; "for you."
	;line "Alsjeblieft!" ; "Here you go!"
	done

ContestResults_PartyFullText:
	text "Your team zit vol," ; "Your party's full,"
	line "Dus de #MON is" ; "so the #MON was"

	para "gestuurd naar je" ; "sent to your BOX"
	line "BOX in BILL's PC." ; "in BILL's PC."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text_start
	line "#MON GYM"
	done

GymStatue_WinningTrainersText:
	text "LEIDER: @" ; "LEADER: @"
	text_ram wStringBuffer4 ; MaxLength MaxTrainerNameLength
	text_start
	para "WINNENDE TRAINERS:" ; "WINNING TRAINERS:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Welkom in de" ; "Welcome to the"
	line "SPEELHOEK." ; "GAME CORNER."
	done

CoinVendor_NoCoinCaseText:
	text "Heb je speelmunten" ; "Do you need game"
	line "nodig?" ; "coins?"

	para "Oh, je hebt geen" ; "Oh, you don't have"
	line "GELDKISTJE voor" ; "a COIN CASE for"
	cont "je munten." ; "your coins."
	done

CoinVendor_IntroText:
	text "Heb je speelmunten" ; "Do you need some"
	line "nodig?" ; "game coins?"

	para "Het is ¥1000 voor" ; "It costs ¥1000 for"
	line "50 munten. Wil je" ; "50 coins. Do you"
	cont "een paar?" ; "want some?"
	done

CoinVendor_Buy50CoinsText:
	text "Dankje!" ; "Thank you!"
	line "Hier, 50 munten." ; "Here are 50 coins."
	done

CoinVendor_Buy500CoinsText:
	text "Dankje! Hier" ; "Thank you! Here"
	line "heb je 500 munten." ; "are 500 coins."
	done

CoinVendor_NotEnoughMoneyText:
	text "Je hebt niet" ; "You don't have"
	line "genoeg geld." ; "enough money."
	done

CoinVendor_CoinCaseFullText:
	text "Oeps! Je MUNTEN-" ; "Whoops! Your COIN"
	line "ZAK zit vol." ; "CASE is full."
	done

CoinVendor_CancelText:
	text "Geen munten dus?" ; "No coins for you?"
	line "Tot ziens!" ; "Come again!"
	done

BugContestPrizeNoRoomText:
	text "Oh? Je RUGZAK zit" ; "Oh? Your PACK is"
	line "vol." ; "full."

	para "We bewaren dit" ; "We'll keep this"
	line "vandaag voor je," ; "for you today, so"

	para "kom maar als je" ; "come back when you"
	line "plek hebt gemaakt." ; "make room for it."
	done

HappinessText3:
	text "Wauw! Jij en je" ; "Wow! You and your"
	line "#MON zijn heel" ; "#MON are really"
	cont "hecht!" ; "close!"
	done

HappinessText2:
	text "#MON worden" ; "#MON get more"
	line "vriendelijker als" ; "friendly if you"

	para "samen tijd" ; "spend time with"
	line "spendeert." ; "them."
	done

HappinessText1:
	text "Je hebt je #MON" ; "You haven't tamed"
	line "niet getemd." ; "your #MON."

	para "Als je niet aardig" ; "If you aren't"
	line "doet, moppert ie." ; "nice, it'll pout."
	done

