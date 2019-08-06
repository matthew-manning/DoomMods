


#################################					CONFIG
$Projectile 		= '"LaserBolt"';
$NumLine			= 31;#must be 2n+1
$SpreadLine			= 35;
$NumX				= 21;#must be 4n+1
$SpreadX			= 12;
#################################

open(STATE_FILE, '>', "ProjectileCode.txt" ) || die "could not open file\n";

print STATE_FILE ("*****************\n****LINE CODE\n*****************\n\n");

print	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile($Projectile, 0, 1 , 0, 8, 0)\n";#centre one uses 1 ammo, not allways hit by for loop

for($i = -($SpreadLine / 2) ; $i <= ($SpreadLine / 2); $i += ($SpreadLine / ($NumLine - 2))) #/ ( ($NumLine - 1) /2 ) ))
{
	if($i == 0)#centre one uses 1 ammo, skip
	{
		break;
	}
	printf	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile(%s, %.2f, 0 , 0, 8, 0)\n", $Projectile, $i;
}

print STATE_FILE ("*****************\n****CROSS CODE\n*****************\n\n");
print	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile($Projectile, 0, 1 , 0, 8, 0)\n";#centre one uses 1 ammo, not allways hit by for loop

for($i = -($SpreadX / 2) ; $i <= ($SpreadX / 2); $i += ($SpreadX / ( ($NumX-2) /4 ) ))#x spread
{
	
	if(($i == 0))#centre one uses 1 ammo
	{
		break;
	}
	printf	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile(%s, %.2f, 0 , 0, 8, 0, %.2f)\n", $Projectile, $i, $i;
	printf	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile(%s, %.2f, 0 , 0, 8, 0, %.2f)\n", $Projectile, -$i, $i;
	printf	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile(%s, %.2f, 0 , 0, 8, 0, %.2f)\n", $Projectile, $i, -$i;
	printf	STATE_FILE	"\t\tTNT1 A 0 A_fireProjectile(%s, %.2f, 0 , 0, 8, 0, %.2f)\n", $Projectile, -$i, -$i;
	
}
close STATE_FILE;
