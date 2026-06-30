var/global/alist/un_ranks = list()

/proc/build_rank_list()
	var/alist/un_ranks_buffer = list()

	for (var/rank_type in concrete_typesof(/datum/rank))
		var/datum/rank/rank = get_singleton(rank_type)
		un_ranks_buffer[rank.name] = rank

	if (!length(un_ranks_buffer))
		return

	global.un_ranks = un_ranks_buffer

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

/mob/living/carbon/human/proc/get_worn_rank()
	. = null

	var/obj/item/card/id/worn_id = src.get_id()
	if (!istype(worn_id, /obj/item/card/id))
		return

	. = worn_id.rank

/// Cargo cult the parent proc so we can add ranks to the name tag.
/mob/living/carbon/human/update_name_tag(name = null)
	if (isnull(src.name_tag))
		return
	if (isnull(name))
		name = src.name
	if (name == "Unknown")
		name = ""
	var/the_pos = findtext(name, " the")
	if (the_pos)
		name = copytext(name, 1, the_pos)
	if (name)
		var/datum/rank/owner_rank = src.get_worn_rank()
		src.name_tag.set_info_tag("[owner_rank ? "[owner_rank.short_name] ([owner_rank.pay_grade])<br>" : ""][he_or_she(src)]")
	else
		src.name_tag.set_info_tag("")
	src.name_tag.set_name(name, strip_parentheses=TRUE)

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
