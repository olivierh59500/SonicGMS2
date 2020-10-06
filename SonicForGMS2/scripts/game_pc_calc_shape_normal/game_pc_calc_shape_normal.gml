var bounded = true;
switch (argument_count)
{
case 4: bounded = argument[3];
default:
	var orientation = argument[2];
	var shape = argument[1];
	var character = argument[0];
}

var normal = orientation;

with (character)
{
	if (shape.auto_normal) normal = game_pc_calc_auto_normal(self, shape, direction); else
	if (not bounded or game_pc_in_shape_bounds(self, shape, orientation))
	{
		var kind = shape.object_index;
		if (not is_undefined(shape.normal)) normal = shape.normal; else // pre-defined
		if (object_is_family(kind, RightTriangle)) normal = game_pc_calc_triangle_normal(self, shape, orientation); else
		if (object_is_family(kind, QuarterEllipse)) normal = game_pc_calc_quarter_ellipse_normal(self, shape, orientation); else
		if (object_is_family(kind, QuarterPipe)) normal = game_pc_calc_quarter_pipe_normal(self, shape, orientation);
	}
	if (angle_resolution > 1) normal = round_to(normal, angle_resolution);
}

return normal;