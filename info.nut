/*
 * This file is part of Villages is Renewed Villages, a GameScript for OpenTTD.
 * Credits Timberwolf (Villages is Villages), Firrel (Renewed Village growth)
 *
 * It's free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the
 * Free Software Foundation, version 2 of the License.
 *
 */


require("version.nut");

class MainClass extends GSInfo
	{
	function GetAuthor()		{ return "Longtomjr"; }
	function GetName()			{ return "Villages is Renewed Villages"; }
	function GetShortName() 	{ return "VIRV"; }
	function GetDescription()	{ return "A combination of the economy features of Villages is Villages, and the growth features of Renewed Village Growth"; }
	// function GetURL()			{ return "https://www.tt-forums.net/viewtopic.php?f=65&t=87052"; }
	function GetVersion()		{ return SELF_VERSION; }
	function GetDate()			{ return SELF_DATE; }
	function GetAPIVersion()	{ return "1.10"; }
	function MinVersionToLoad()	{ return SELF_MINLOADVERSION; }
	function CreateInstance()	{ return "MainClass"; }
	function GetSettings() {

		// VIV
		AddSetting({
			name = "manage_economy",
			description = "Economic settings",
			easy_value = 0,
			medium_value = 0,
			hard_value = 0,
			custom_value = 0,
			flags = CONFIG_BOOLEAN
		});
		AddSetting({
			name = "corp_tax_level",
			description = "Corporation Tax (%)",
			easy_value = 10,
			medium_value = 20,
			hard_value = 50,
			custom_value = 20,
			flags = CONFIG_INGAME,
			min_value = 0,
			max_value = 95,
			step_size = 5
		});
		AddSetting({
			name = "infrastructure_cost_exponent",
			description = "Infrastructure Cost Modifier",
			easy_value = 98,
			medium_value = 100,
			hard_value = 102,
			custom_value = 100,
			flags = CONFIG_INGAME,
			min_value = 50,
			max_value = 200,
			step_size = 1
		});
		AddSetting({
			name = "dividend_floor",
			description = "Dividends: maximum base cash surplus",
			easy_value = 1000000,
			medium_value = 500000,
			hard_value = 200000,
			custom_value = 500000,
			flags = CONFIG_INGAME,
			min_value = 0,
			max_value = 25000000,
			step_size = 100000
		});
		AddSetting({
			name = "dividend_costs_years",
			description = "Dividends: years of costs to reserve",
			easy_value = 5,
			medium_value = 3,
			hard_value = 2,
			custom_value = 3,
			flags = CONFIG_INGAME,
			min_value = 1,
			max_value = 10,
			step_size = 1
		});
		AddSetting({
			name = "dividend_start",
			description = "Dividends: initial %",
			easy_value = 5,
			medium_value = 20,
			hard_value = 30,
			custom_value = 20,
			flags = CONFIG_INGAME,
			min_value = 0,
			max_value = 150,
			step_size = 1
		});
		AddSetting({
			name = "dividend_growth",
			description = "Dividends: change per year (%)",
			easy_value = 1,
			medium_value = 5,
			hard_value = 10,
			custom_value = 5,
			flags = CONFIG_INGAME,
			min_value = 1,
			max_value = 100,
			step_size = 1
		});
		AddSetting({
			name = "dividend_max",
			description = "Dividends: maximum %",
			easy_value = 15,
			medium_value = 50,
			hard_value = 80,
			custom_value = 50,
			flags = CONFIG_INGAME,
			min_value = 0,
			max_value = 150,
			step_size = 1
		});

		// RVG
		AddSetting({ name = "town_info_mode",
				description = "Town info display mode",
				easy_value = 1,
				medium_value = 1,
				hard_value = 1,
				custom_value = 1,
				flags = CONFIG_INGAME, min_value = 1, max_value = 5 });
		AddLabels("town_info_mode", { 
					_1 = "Automatic",
					_2 = "Category deliveries",
					_3 = "Cargo list",
					_4 = "Combined",
					_5 = "Full cargo list" });
	
		AddSetting({ name = "industry_NewGRF",
				description = "Which industry set is being used?",
				easy_value = 1,
				medium_value = 1,
				hard_value = 1,
				custom_value = 1,
				flags = CONFIG_NONE, min_value = 1, max_value = 24 });
		AddLabels("industry_NewGRF", { 
					_1 = "Baseset: Temperate",
					_2 = "Baseset: Arctic",
					_3 = "Baseset: Tropical",
					_4 = "Baseset: Toyland",
					_5 = "FIRS 1.4: Firs economy",
					_6 = "FIRS 1.4: Temperate basic",
					_7 = "FIRS 1.4: Arctic basic",
					_8 = "FIRS 1.4: Tropic Basic",
					_9 = "FIRS 1.4: Hearth of Darkness",
					_10 = "ECS 1.2: Any Vectors",
					_11 = "YETI 0.1.6",
					_12 = "FIRS 3: Temperate Basic",
					_13 = "FIRS 3: Arctic Basic",
					_14 = "FIRS 3: Tropic Basic",
					_15 = "FIRS 3: Steeltown",
					_16 = "FIRS 3: In A Hot Country",
					_17 = "FIRS 3: Extreme",
					_18 = "NAIS 1.0.6: North America",
					_19 = "Improved Town Industries 1.5",
					_20 = "FIRS 4 alpha: Temperate Basic",
					_21 = "FIRS 4 alpha: Arctic Basic",
					_22 = "FIRS 4 alpha: Tropic Basic",
					_23 = "FIRS 4 alpha: Steeltown",
					_24 = "XIS 0.6: The Lot" });

		AddSetting({ name = "goal_scale_factor",
				description = "Difficulty level (easy = 60, normal = 100, hard = 140)",
				easy_value = 60,
				medium_value = 100,
				hard_value = 140,
				custom_value = 100,
				flags = CONFIG_INGAME, min_value = 1, max_value = 1000, step_size = 20 });

		AddSetting({ name = "use_town_sign",
				description = "Show growth rate text under town names",
				easy_value = 1,
				medium_value = 1,
				hard_value = 1,
				custom_value = 1,
				flags = CONFIG_BOOLEAN });
				
		AddSetting({ name = "eternal_love",
				description = "Eternal love from towns",
				easy_value = 1,
				medium_value = 3,
				hard_value = 0,
				custom_value = 0,
				flags = CONFIG_INGAME, min_value = 0, max_value = 3 });
		AddLabels("eternal_love", { _0 = "Off",
					_1 = "Outstanding",
					_2 = "Good",
					_3 = "Poor" });

		AddSetting({ name = "cargo_randomization",
				description = "Randomization: Type",
				easy_value = 1,
				medium_value = 7,
				hard_value = 5,
				custom_value = 2,
				flags = CONFIG_NONE, min_value = 1, max_value = 7 });
		AddLabels("cargo_randomization", { 
					_1 = "None",
					_2 = "1 per category",
					_3 = "2 per category",
					_4 = "3 per category",
					_5 = "1-2 per category",
					_6 = "1-3 per category",
					_7 = "2-3 per category" });

		AddSetting({ name = "display_cargo",
				description = "Randomization: Show town cargos from start",
				easy_value = 1,
				medium_value = 0,
				hard_value = 0,
				custom_value = 0,
				flags = CONFIG_BOOLEAN});

		AddSetting({
			name = "min_transport_pax",
			description = "Limit Growth: Minimun Percentage of Passengers Transported",
			easy_value = 30,
			medium_value = 50,
			hard_value = 65,
			custom_value = 50,
			flags = CONFIG_INGAME, min_value = 0, max_value = 90, step_size = 5});
			
		AddSetting({
			name = "min_transport_mail",
			description = "Limit Growth: Minimun Percentage of Mail Transported",
			easy_value = 30,
			medium_value = 50,
			hard_value = 65,
			custom_value = 50,
			flags = CONFIG_INGAME, min_value = 0, max_value = 90, step_size = 5});
			
		AddSetting({
			name = "town_size_threshold",
			description = "Limit Growth: Minimum size of town before the limit rules kicks in",
			easy_value = 800,
			medium_value = 550,
			hard_value = 350,
			custom_value = 350,
			flags = CONFIG_INGAME, min_value = 0,
			max_value = 3000,
			step_size = 25});

		AddSetting({
			name = "limiter_delay",
			description = "Limit Growth: Stop growth after set amount of months",
			easy_value = 3,
			medium_value = 1,
			hard_value = 0,
			custom_value = 1,
			flags = CONFIG_INGAME, min_value = 0, max_value = 12, step_size = 1});

		AddSetting({ name = "town_growth_factor",
				description = "Expert: town growth factor",
				easy_value = 50,
				medium_value = 100,
				hard_value = 200,
				custom_value = 100,
				flags = CONFIG_INGAME, min_value = 20, max_value = 1000, step_size = 20 });

		AddSetting({ name = "supply_impacting_part",
				description = "Expert: minimum supply percentage for TGR growth",
				easy_value = 80,
				medium_value = 50,
				hard_value = 20,
				custom_value = 50,
				flags = CONFIG_INGAME, min_value = 0, max_value = 100, step_size = 5 });

		AddSetting({ name = "exponentiality_factor",
				description = "Expert: TGR growth exponentiality factor",
				easy_value = 3,
				medium_value = 3,
				hard_value = 3,
				custom_value = 3,
				flags = CONFIG_INGAME, min_value = 1, max_value = 5 });

		AddSetting({ name = "lowest_town_growth_rate",
				description = "Expert: slowest TGR if requirements are not met",
				easy_value = 365,
				medium_value = 550,
				hard_value = 880,
				custom_value = 550,
				flags = CONFIG_INGAME, min_value = 10, max_value = 880, step_size = 10 });
				
		AddSetting({ name = "log_level",
				description = "Debug: Log level (higher = print more)",
				easy_value = 1,
				medium_value = 1,
				hard_value = 1,
				custom_value = 1,
				flags = CONFIG_INGAME, min_value = 1, max_value = 3 });
		AddLabels("log_level", { _1 = "1: Info", _2 = "2: Cargo", _3 = "3: Debug" });
	}
}

RegisterGS(MainClass());
