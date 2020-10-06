var character = argument0;
var shape = argument1;
var len = argument2;
var dir = argument3;

var result = false;

with (character)
{
    if (on_the_ground and not game_pc_in_shape_bounds(self, shape, dir) and abs(len) >= ramp_threshold)
	{
		var normal = game_pc_calc_shape_normal(self, shape, dir, false);
		var launch_dir = abs(angle_difference(mask_direction, normal));
		result = (launch_dir > 11.25 and launch_dir < 90);
	}
}

return result;