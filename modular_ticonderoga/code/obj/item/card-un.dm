/obj/item/card/id
	var/allow_rank = FALSE
	var/datum/rank/rank = null

/obj/item/card/id/un
	desc = "A United Nations microchipped identification card that grants the wielder access to areas and devices based on their access level."
	allow_rank = TRUE

/obj/item/card/id/un/command
	icon_state = "id_com"

/obj/item/card/id/un/security
	icon_state = "id_sec"

/obj/item/card/id/un/medical
	icon_state = "id_med"

/obj/item/card/id/un/engineering
	icon_state = "id_eng"

/obj/item/card/id/un/civilian
	icon_state = "id_civ"

/obj/item/card/id/un/guest
	icon_state = "id_guest"
