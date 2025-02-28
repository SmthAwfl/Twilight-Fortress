/datum/job/roguetown/jester
	title = "Jester"
	flag = JESTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_NEARLY_ALL_PLUS_SEELIE

	tutorial = "Грензельхофты славились своими шутами - мудрецами, у которых язык был так же остр, как и остроумие. \
		Вы занимаете позицию шута, завидуя тому положению, которое занимает ваше начальство. \
		Твои дешевые трюки и иллюзии ума действуют лишь до поры до времени,\
		и однажды ты окажешься в руках чего-то более острого, чем ты сам."

	allowed_ages = ALL_AGES_LIST
	spells = list(/obj/effect/proc_holder/spell/self/telljoke,/obj/effect/proc_holder/spell/self/telltragedy)
	outfit = /datum/outfit/job/roguetown/jester
	display_order = JDO_JESTER
	give_bank_account = TRUE
	min_pq = -4 //stupid jesters are funny so low PQ requirement
	max_pq = null

/datum/outfit/job/roguetown/jester/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/jester
	pants = /obj/item/clothing/under/roguetown/tights
	armor = /obj/item/clothing/suit/roguetown/shirt/jester
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/servant
	beltl = /obj/item/ammo_holder/bomb/smokebombs
	head = /obj/item/clothing/head/roguetown/jester
	neck = /obj/item/clothing/neck/roguetown/coif
	//Desc says grenzelhoft has great jesters so 50% change to raceswap because slop lore
	if(ishumannorthern(H) && prob(50))
		H.skin_tone = SKIN_COLOR_GRENZELHOFT
		H.update_body()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		if(!isseelie(H))	
			H.STASTR = clamp(roll("4d6-4"), 1, 20)
			H.STAINT = clamp(roll("4d6-4"), 1, 20)
			H.STALUC = clamp(roll("4d6-4"), 1, 20)
		else if(isseelie(H))
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
		H.cmode_music = 'sound/music/combat_jester.ogg'
	H.verbs |= /mob/living/carbon/human/proc/ventriloquate
	H.verbs |= /mob/living/carbon/human/proc/ear_trick
	ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEAPER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)

