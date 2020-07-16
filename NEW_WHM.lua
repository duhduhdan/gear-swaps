function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    -- state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
end

function init_gear_sets()
    sets.precast.FC = {
        main = gear.FastcastStaff,
        ammo = "Incantor Stone",
        -- still need to get
        head = "Nahtirah Hat",
        neck = "Orison Locket",
        ear1 = "Mendicant's Earring",
        ear2 = "Loquacious Earring",
        -- still need to get
        body = "Inyanga Jubbah +2",
        -- still need to get
        hands = "Gendewitha Gages",
        ring1 = "Prolix Ring",
        back = "Swith Cape",
        waist = "Witful Belt",
        legs = "Orvail Pants +1",
        -- upgrade to +1 when available
        feet = "Chelona Boots"
    }

    sets.precast.FC['Enhancing Magic'] =
        set_combine(sets.precast.FC,
                    {waist = "Siegel Sash", back = "Mending cape"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'],
                                            {head = "Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
        -- legs = "Orison Pantaloons +2"
        legs = "Doyen pants"
    })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Impatiens",
        ear1 = "Mendicant's Earring",
        ear2 = "Nourishing Earring +1"
    })
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body = "Piety Briault"}

    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.CureSolace = {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Cleric's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Nourishing Earring +1",
        body = "Kaykaus bliaut",
        hands = "Telchine Gloves",
        ring1 = "Haoma's ring",
        ring2 = "Sirona's Ring",
        back = "Mending cape",
        waist = gear.ElementalObi,
        legs = "Orison pantaloons +2",
        -- still need to get
        feet = "Piety Duckbills +1"
    }

    sets.midcast.Cure = {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Cleric's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Nourishing Earring +1",
        -- body = "Vanir Cotehardie",
        body = "Kaykaus bliaut",
        hands = "Telchine Gloves",
        ring1 = "Haoma's ring",
        ring2 = "Sirona's Ring",
        back = "Mending cape",
        waist = gear.ElementalObi,
        legs = "Orison pantaloons +2",
        -- still need to get
        feet = "Piety Duckbills +1"
    }

    sets.midcast.Curaga = {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Cleric's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Nourishing Earring +1",
        -- still need to get
        -- body = "Vanir Cotehardie",
        body = "Kaykaus bliaut",
        hands = "Telchine Gloves",
        ring1 = "Haoma's ring",
        ring2 = "Sirona's Ring",
        back = "Mending cape",
        waist = gear.ElementalObi,
        legs = "Orison pantaloons +2",
        -- still need to get
        feet = "Piety Duckbills +1"
    }

    sets.midcast.Cursna = {
        main = "Beneficus",
        sub = "Genbu's Shield",
        head = "Orison Cap +2",
        neck = "Malison Medallion",
        -- is there a better cursna body piece?
        body = "Kaykaus bliaut",
        hands = "Hieros Mittens",
        ring1 = "Haoma's Ring",
        ring2 = "Stikini Ring",
        back = "Mending Cape",
        waist = "Witful Belt",
        legs = "Theophany Pantaloons",
        -- still need to get
        feet = "Gendewitha Galoshes"
    }

    sets.midcast.StatusRemoval = {
        head = "Orison Cap +2",
        legs = "Orison Pantaloons +2"
    }

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
        main = "Beneficus",
        sub = "Genbu's Shield",
        head = "Umuthi Hat",
        neck = "Colossus's Torque",
        body = "Manasa Chasuble",
        hands = "Dynasty Mitts",
        back = "Mending Cape",
        waist = "Olympus Sash",
        legs = "Piety Pantaloons",
        feet = "Orison Duckbills +2"
    }

    sets.midcast.Stoneskin = {
        head = "Nahtirah Hat",
        neck = "Orison Locket",
        ear2 = "Loquacious Earring",
        body = "Vanir Cotehardie",
        hands = "Dynasty Mitts",
        back = "Swith Cape +1",
        waist = "Siegel Sash",
        legs = "Gendewitha Spats",
        feet = "Gendewitha Galoshes"
    }

    sets.midcast.Auspice = {
        hands = "Dynasty Mitts",
        feet = "Orison Duckbills +2"
    }

    sets.midcast.BarElement = {
        main = "Beneficus",
        sub = "Genbu's Shield",
        head = "Orison Cap +2",
        neck = "Colossus's Torque",
        body = "Orison Bliaud +2",
        hands = "Orison Mitts +2",
        back = "Mending Cape",
        waist = "Olympus Sash",
        legs = "Piety Pantaloons",
        feet = "Orison Duckbills +2"
    }

    sets.midcast.Regen = {
        main = "Bolelabunga",
        sub = "Genbu's Shield",
        body = "Piety Briault",
        hands = "Orison Mitts +2",
        legs = "Theophany Pantaloons"
    }

    sets.midcast.Protectra = {feet = "Piety Duckbills +1"}
    sets.midcast.Shellra = {legs = "Piety Pantaloons"}

    -- Resting sets
    sets.resting = {
        main = gear.Staff.HMP,
        body = "Gendewitha Bliaut",
        hands = "Serpentes Cuffs",
        waist = "Austerity Belt",
        legs = "Assiduity Pants +1",
        feet = "Chelona Boots +1"
    }

    sets.idle = {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Cleric's Torque",
        ear1 = "Bloodgem Earring",
        ear2 = "Loquacious Earring",
        body = "Kaykaus bliaut",
        hands = "Serpentes Cuffs",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Mending Cape",
        waist = "Witful Belt",
        legs = "Assiduity Pants +1",
        feet = "Serpentes Sabots"
    }

    sets.idle.Weak = {
        main = "Tamaxchi",
        sub = "Genbu's Shield",
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Twilight Torque",
        ear1 = "Bloodgem Earring",
        ear2 = "Loquacious Earring",
        body = "Kaykaus bliaut",
        hands = "Serpentes Cuffs",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Iximulew Cape",
        waist = "Witful Belt",
        legs = "Assiduity Pants +1",
        feet = "Herald's Gaiters"
    }

    sets.engaged = {
        ammo = "Incantor Stone",
        head = "Kaykaus Mitra",
        neck = "Asperity Necklace",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = "Kaykaus bliaut",
        hands = "Serpentes Cuffs",
        ring1 = "Rajas Ring",
        ring2 = "K'ayres Ring",
        back = "Mending Cape",
        waist = "Witful Belt",
        legs = "Assiduity Pants +1",
        feet = "Serpentes Sabots"
        -- head = "Kaykaus Mitra",
        -- body = "Vanir Cotehardie",
        -- hands = "Dynasty Mitts",
        -- back = "Umbra Cape",
        -- waist = "Goading Belt",
        -- legs = "Gendewitha Spats",
        -- feet = "Gendewitha Galoshes"
    }

end

function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        eventArgs.handled = true
    end

    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main', 'sub', 'range')
        else
            enable('main', 'sub', 'range')
        end
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and
            player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = player.sub_job:lower() == 'sch' and
                              not buffactive['Light Arts'] and
                              not buffactive['Addendum: White'] and
                              not buffactive['Dark Arts'] and
                              not buffactive['Addendum: Black']

        if not buffactive['Afflatus Solace'] and
            not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command(
                    '@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(4, 3)
end
