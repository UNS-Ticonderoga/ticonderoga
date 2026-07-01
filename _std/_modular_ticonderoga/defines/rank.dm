// Rank types
#define RANK_TYPE_OFFICER "O"
#define RANK_TYPE_ENLISTED "E"

// Officer ranks
#define RANK_OFFICER_O4 "Lieutenant Commander"
#define RANK_OFFICER_O3 "Lieutenant"
#define RANK_OFFICER_O2 "Sublieutenant"
#define RANK_OFFICER_O1 "Ensign"

// Enlisted ranks
// NCOs
#define RANK_ENLISTED_E6 "Petty Officer 1st Class"
#define RANK_ENLISTED_E5 "Petty Officer 2nd Class"
#define RANK_ENLISTED_E4 "Petty Officer 3rd Class"
/// Associative values determine minimum play time to achieve the rank.
#define RANK_ENLISTED_NCO alist(\
	RANK_ENLISTED_E6 = 50, \
	RANK_ENLISTED_E5 = 25, \
	RANK_ENLISTED_E4 = 0, \
)

// Junior enlisted ranks
#define RANK_ENLISTED_E3 "Sailor 1st Class"
#define RANK_ENLISTED_E2 "Sailor 2nd Class"
#define RANK_ENLISTED_E1 "Sailor 3rd Class"
/// Associative values determine minimum play time to achieve the rank.
#define RANK_ENLISTED_JUNIOR alist(\
	RANK_ENLISTED_E3 = 50,\
	RANK_ENLISTED_E2 = 25,\
	RANK_ENLISTED_E1 = 0,\
)
