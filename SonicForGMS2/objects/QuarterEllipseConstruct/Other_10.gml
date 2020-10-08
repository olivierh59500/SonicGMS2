/// @description Generate ellipse
var ix = 0;
var iy = 0;

var px, py, m1, m2, ox, oy;
for (var n = 0; n < total_nodes; ++n)
{
	px = ix;
	py = iy;

	// calculate next intersection
	m1 = (total_nodes - n) / (n + 1);
	m2 = (total_nodes - (n + 1)) / (n + 2);
	ix = (-n + (n + 1)) / (m1 - m2);
	iy = (ix * m1) + n;
	ix *= node_w;
	iy *= node_h;

	ox = (xsign > 0) ? bbox_left + px : bbox_right - px;
	oy = (ysign > 0) ? bbox_bottom - py : bbox_top + py;
	with (instance_create_layer(ox, oy, "collisions", RightTriangleTerrain))
	{
		image_xscale = (ix - px) / (sprite_width * other.xsign);
		image_yscale = (iy - py) / (sprite_height * other.ysign);
		y -= sprite_height; // space correction
		depth_mask = other.depth_mask;
		top_solid = other.top_solid;
		bottom_solid = other.bottom_solid;
		sticky = other.sticky;
		event_perform(ev_other, ev_room_start); // calc surface normal
	}
}

instance_destroy();