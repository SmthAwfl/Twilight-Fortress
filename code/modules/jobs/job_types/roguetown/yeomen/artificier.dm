/datum/job/roguetown/artificer
	title = "Artificer"
	flag = ARTIFICER
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)

	tutorial = "В глубинах устройств скрыты древние механические секреты, которые ваш род взял на себя труд изучить и понять. \
	Кому-то эти механические чудеса могут показаться волшебством, но вы знаете их внутреннее устройство так же хорошо, как и камень, до последней шестеренки."

	outfit = /datum/outfit/job/roguetown/artificer
	display_order = JDO_ARTIFICER
	give_bank_account = 8
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/artificer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/articap
	mask = /obj/item/clothing/mask/rogue/goggles
	cloak = /obj/item/clothing/cloak/apron/waist/brown
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/key/artificer
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/rogueweapon/hammer/steel = 1, /obj/item/rogueweapon/handsaw = 1, /obj/item/rogueweapon/chisel = 1)
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

	H.change_stat("strength", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", -1)
