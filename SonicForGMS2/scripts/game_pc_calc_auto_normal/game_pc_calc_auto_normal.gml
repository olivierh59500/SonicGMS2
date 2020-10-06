var character = argument0;
var shape = argument1;
var orientation = argument2;

var result = orientation;

with (character)
{
	var total = ds_list_size(local_solids);
	if (total > 0 and ds_list_find_index(local_solids, shape) != -1)
	{
		var sine = dsin(orientation);
		var cosine = dcos(orientation);
		var x1 = x_int - (cosine * x_radius) + (sine * y_radius);
		var y1 = y_int + (sine * x_radius) + (cosine * y_radius);
		var x2 = x_int + (cosine * x_radius) + (sine * y_radius);
		var y2 = y_int - (sine * x_radius) + (cosine * y_radius);
		var offset = (x_radius * 2) + 1;
		var left = false;
		var right = false;
	
		// project rays until they find something
		var projx, projy, ind, n;
		for (var oy = 0; oy < offset; ++oy)
		{
			projx = (sine * oy);
			projy = (cosine * oy);
			for (n = 0; n < total; ++n)
			{
				ind = local_solids[| n];
				if (ind.top_solid)
				{
					// left projection
					if (not left and game_shape_in_point(ind, x1 + projx, y1 + projy))
					{
						left = true;
						x1 += projx;
						y1 += projy;
					}

					// right projection
					if (not right and game_shape_in_point(ind, x2 + projx, y2 + projy))
					{
						right = true;
						x2 += projx;
						y2 += projy;
					}
				}
			}
			if (left and right)
			{
				// result is direction from left to right
				result = point_direction(x1, y1, x2, y2);
				break;
			}
		}
	}
}

return result;