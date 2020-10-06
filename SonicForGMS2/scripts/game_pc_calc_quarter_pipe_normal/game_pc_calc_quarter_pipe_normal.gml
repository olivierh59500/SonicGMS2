var character = argument0;
var shape = argument1;
var orientation = argument2;

var result = orientation;

with (character)
{
	if (instance_exists(shape))
	{
		// calc direction from ellipse centre to player
		var fx = clamp(x_int, shape.bbox_left, shape.bbox_right + 1);
		var fy = clamp(y_int, shape.bbox_top, shape.bbox_bottom + 1);
		var width = abs(shape.sprite_width);
		var height = abs(shape.sprite_height);
		var ox = (fx - shape.x) * ((width < height) ? (height / width) : 1);
		var oy = (fy - shape.y) * ((width > height) ? (width / height) : 1);
		var ang = ((point_direction(0, 0, ox, oy) div 1) + 90) mod 360;

		// additional clamping
		var xsign = sign(shape.image_xscale);
		var ysign = sign(shape.image_yscale);
		if (xsign == -1 and ysign == -1) result = clamp(ang, 180, 270); else
		if (xsign == -1 and ysign == 1) result = (ang < 180) ? 0 : clamp(ang, 270, 360); else
		if (xsign == 1 and ysign == -1) result = clamp(ang, 90, 180); else
		if (xsign == 1 and ysign == 1) result = (ang > 180) ? 0 : clamp(ang, 0, 90);
	}
}

return result;