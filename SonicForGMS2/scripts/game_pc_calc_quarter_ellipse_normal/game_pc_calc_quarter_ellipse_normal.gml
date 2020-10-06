var character = argument0;
var shape = argument1;
var orientation = argument2;

var result = orientation;

with (character)
{
	if (instance_exists(shape))
	{
		// calc direction from player to ellipse centre
		var fx = clamp(x_int, shape.bbox_left, shape.bbox_right + 1);
		var fy = clamp(y_int, shape.bbox_top, shape.bbox_bottom + 1);
		var xrad = shape.x + shape.sprite_width;
		var yrad = shape.y + shape.sprite_height;
		var width = abs(shape.sprite_width);
		var height = abs(shape.sprite_height);
		var ox = (fx - xrad) * ((width < height) ? (height / width) : 1);
		var oy = (fy - yrad) * ((width > height) ? (width / height) : 1);
		var ang = point_direction(ox, oy, 0, 0) div 1;
		result = (ang + 90) mod 360;
	}
}

return result;