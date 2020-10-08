/// @description Generate sinusoid
var half_pi = pi * 0.5;
var ix = 0;
var iy = 0;

var px, py, t, ox, oy;
for (var n = 0; n < total_nodes; ++n)
{
	px = ix;
	py = iy;

	// calculate next intersection
	t = (n + 1) / total_nodes;
	ix = t * width;
	iy = height - (sin((t * half_pi) + half_pi) * height);

	ox = (xsign > 0) ? bbox_right - px : bbox_left + px;
	oy = (ysign > 0) ? bbox_top + py : bbox_bottom - py;
	with (instance_create_layer(ox, oy, "collisions", RightTriangleTerrain))
	{
		image_xscale = (ix - px) / (sprite_width * other.xsign);
		image_yscale = (iy - py) / (sprite_height * other.ysign);
		//y -= sprite_height; // space correction
		x -= sprite_width; // space correction
		depth_mask = other.depth_mask;
		top_solid = other.top_solid;
		bottom_solid = other.bottom_solid;
		sticky = other.sticky;
		event_perform(ev_other, ev_room_start); // calc surface normal
	}
}

instance_destroy();