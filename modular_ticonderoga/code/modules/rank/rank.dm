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
