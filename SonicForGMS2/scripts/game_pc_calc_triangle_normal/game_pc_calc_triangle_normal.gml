var character = argument0;
var shape = argument1;
var orientation = argument2;

var result = orientation;

with (character)
{
	if (instance_exists(shape))
	{
		// calc hypotenuse angle
		var x1 = (sign(shape.image_yscale) > 0) ? shape.bbox_left : shape.bbox_right + 1;
		var y1 = (sign(shape.image_xscale) > 0) ? shape.bbox_bottom + 1 : shape.bbox_top;
		var x2 = (sign(shape.image_yscale) > 0) ? shape.bbox_right + 1 : shape.bbox_left;
		var y2 = (sign(shape.image_xscale) > 0) ? shape.bbox_top : shape.bbox_bottom + 1;
		result = point_direction(x1, y1, x2, y2) div 1;
	}
}

return result;