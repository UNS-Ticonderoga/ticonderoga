/obj/item/card/id/un
	var/datum/rank/rank = null

/obj/item/card/id/un/update_name()
	name = "[src.registered]’s ID Card ([src.rank ? "[src.rank.pay_grade] - " : ""][src.assignment])"

/obj/item/card/id/un/get_desc()
	. = ..()
	if (src.rank)
		. += " Rank: [src.rank.name] ([src.rank.pay_grade])"

/obj/item/card/id/un/command
	icon_state = "id_com"

/obj/item/card/id/un/security
	icon_state = "id_sec"

/obj/item/card/id/un/research
	icon_state = "id_res"

/obj/item/card/id/un/medical
	icon_state = "id_med"

/obj/item/card/id/un/engineering
	icon_state = "id_eng"

/obj/item/card/id/un/deck
	icon_state = "id_deck"

/obj/item/card/id/un/guest
	icon_state = "id_guest"
