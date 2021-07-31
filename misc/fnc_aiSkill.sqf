//AI SKILL
_skill = _this select 0;

//player sidechat format ["Setting skill of %1",_skill];

switch (_skill) do
	{
		case 1: //conscript very low skill
		{
			{
				_x setSkill ["aimingspeed", 0.1];
				_x setSkill ["spotdistance", 0.1];
				_x setSkill ["aimingaccuracy", 0.1];
				_x setSkill ["aimingshake", 0.1];
				_x setSkill ["spottime", 0.1];
				_x setSkill ["spotdistance", 0.3];
				_x setSkill ["commanding", 0.3];
				_x setSkill ["general", 0.2];
			} forEach allUnits;
		};
		case 2: //rebels low skill
		{
			{
				_x setSkill ["aimingspeed", 0.3];
				_x setSkill ["spotdistance", 0.3];
				_x setSkill ["aimingaccuracy", 0.3];
				_x setSkill ["aimingshake", 0.3];
				_x setSkill ["spottime", 0.3];
				_x setSkill ["spotdistance", 0.3];
				_x setSkill ["commanding", 0.3];
				_x setSkill ["general", 0.3];
			} forEach allUnits;
		};
		case 3: //regular fair skill
		{
			{
				_x setSkill ["aimingspeed", 0.5];
				_x setSkill ["spotdistance", 0.5];
				_x setSkill ["aimingaccuracy", 0.5];
				_x setSkill ["aimingshake", 0.5];
				_x setSkill ["spottime", 0.5];
				_x setSkill ["spotdistance", 0.5];
				_x setSkill ["commanding", 0.5];
				_x setSkill ["general", 0.6];
			} forEach allUnits;
		};
		case 4: //elite soldiers medium skill
		{
			{
				_x setSkill ["aimingspeed", 0.6];
				_x setSkill ["spotdistance", 0.6];
				_x setSkill ["aimingaccuracy", 0.6];
				_x setSkill ["aimingshake", 0.6];
				_x setSkill ["spottime", 0.6];
				_x setSkill ["spotdistance", 0.6];
				_x setSkill ["commanding", 0.6];
				_x setSkill ["general", 0.7];
			} forEach allUnits;
		};
		case 5: // specops good skill
		{
			{
				_x setSkill ["aimingspeed", 0.8];
				_x setSkill ["spotdistance", 0.8];
				_x setSkill ["aimingaccuracy", 0.8];
				_x setSkill ["aimingshake", 0.8];
				_x setSkill ["spottime", 1];
				_x setSkill ["spotdistance", 0.8];
				_x setSkill ["commanding", 0.8];
				_x setSkill ["general", 0.9];
			} forEach allUnits;
		};
		case 6: // gods
		{
			{
				_x setSkill ["aimingspeed", 1];
				_x setSkill ["spotdistance", 1];
				_x setSkill ["aimingaccuracy", 2];
				_x setSkill ["aimingshake", 1];
				_x setSkill ["spottime", 1];
				_x setSkill ["spotdistance", 1];
				_x setSkill ["commanding", 1];
				_x setSkill ["general", 2];
			} forEach allUnits;
		};
};

exit;