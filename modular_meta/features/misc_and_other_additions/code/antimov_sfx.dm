/datum/ai_laws
    var/list/sfx_played_to = list() // Не знал куда можно было запихнуть данный список, так как в __DEFINES/__globals.dm сказано что глобальные списки лучше не делать.

/obj/item/ai_module/core/full/antimov/transmitInstructions(datum/ai_laws/law_datum, mob/sender, overflow)
    . = ..()
    var/mob/living/silicon/ai/antimov_ai = law_datum.owner
    if(!antimov_ai || antimov_ai.stat == DEAD)
        return
    var/player_ckey = antimov_ai.ckey
    if(player_ckey && !(player_ckey in law_datum.sfx_played_to))
        playsound(antimov_ai, 'modular_meta/features/misc_and_other_additions/sound/ai/antimov.ogg', 100)
        law_datum.sfx_played_to += player_ckey
    return
