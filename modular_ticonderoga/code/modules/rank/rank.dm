var/global/alist/officer_ranks = list()
var/global/alist/enlisted_ranks = list()

/proc/build_rank_list()
	var/alist/officer_ranks_buffer = list()
	var/alist/enlisted_ranks_buffer = list()

	for (var/rank_type in concrete_typesof(/datum/rank))
		var/datum/rank/rank = get_singleton(rank_type)
		if (rank.rank_type == RANK_OFFICER)
			officer_ranks_buffer[rank.name] = rank
		else
			enlisted_ranks_buffer[rank.name] = rank

	if (!length(officer_ranks_buffer) && !length(enlisted_ranks_buffer))
		return

	global.officer_ranks = officer_ranks_buffer
	global.enlisted_ranks = enlisted_ranks_buffer

/mob/living/carbon/human/proc/get_worn_rank()
	. = null

	var/obj/item/card/id/worn_id = src.get_id()
	if (!istype(worn_id, /obj/item/card/id))
		return

	. = worn_id.rank

ABSTRACT_TYPE(/datum/rank)
/datum/rank
	var/name = "Sailor 3rd Class"
	var/short_name = "S3C"
	var/pay_grade = "E1"
	var/rank_type = RANK_ENLISTED

ABSTRACT_TYPE(/datum/rank/enlisted)
/datum/rank/enlisted
	rank_type = RANK_ENLISTED

ABSTRACT_TYPE(/datum/rank/officer)
/datum/rank/officer
	rank_type = RANK_OFFICER
