//approach(argument0, argument1, argument2);

vStart = argument0;
vEnd = argument1;
vShift = argument2;

if(vStart < vEnd)
{
	return min(vStart + vShift, vEnd);
}
else
{
	return max(vStart - vShift, vEnd);
}
