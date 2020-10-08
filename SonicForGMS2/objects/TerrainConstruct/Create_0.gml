/// @description Initialize
event_inherited();
width = bbox_right - bbox_left;
height = bbox_bottom - bbox_top;
xsign = sign(image_xscale);
ysign = sign(image_yscale);

var avg = (width + height) * 0.5;
var ideal_size = 8;
total_nodes = (ceil(log10(avg / ideal_size) / log10(2)) * 2) - 1;
node_w = width / total_nodes;
node_h = height / total_nodes;

event_user(0); // generate