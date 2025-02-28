/obj/item/ash
	name = "пепел"
	desc = "Темные остатки угасшего пламени."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	grind_results = list(/datum/reagent/ash = 15)
	w_class = WEIGHT_CLASS_TINY
	brew_reagent = /datum/reagent/alch/syrum_ash
	brew_amt = 24
	can_brew = TRUE

/obj/item/ash/Crossed(mob/living/L)
	. = ..()
	if(istype(L))
		var/prob2break = 33
		if(L.m_intent == MOVE_INTENT_SNEAK)
			prob2break = 0
		if(L.m_intent == MOVE_INTENT_RUN)
			prob2break = 100
		if(prob(prob2break))
			qdel(src)
