var/global/alist/un_ranks = list()

/proc/build_rank_list()
	var/alist/un_ranks_buffer = list()

	for (var/rank_type in concrete_typesof(/datum/rank))
		var/datum/rank/rank = get_singleton(rank_type)
		un_ranks_buffer[rank.name] = rank

	if (!length(un_ranks_buffer))
		return

	global.un_ranks = un_ranks_buffer

/mob/living/carbon/human/proc/get_worn_rank()
	. = null

	var/obj/item/card/id/worn_id = src.get_id()
	if (!istype(worn_id, /obj/item/card/id))
		return

	. = worn_id.rank

/datum/mind/proc/assign_rank(datum/job/job)
	var/rank_name = ""

	if (!length(job.rank_type))
		src.assigned_rank = null
		return

	if (is_alist(job.rank_type))
		var/alist/rank_list = job.rank_type
		var/rounds_participated = src.current?.client?.player?.get_rounds_participated() || 0

		for (var/rank_type in rank_list)
			if (rank_list[rank_type] > rounds_participated)
				continue
			rank_name = rank_type
			break

		if (!length(rank_name))
			rank_name = rank_list[length(rank_list)]
	else
		rank_name = job.rank_type

	src.assigned_rank = global.un_ranks[rank_name] || null

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
