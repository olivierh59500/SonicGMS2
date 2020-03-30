/// @description  Animate
if (game_is_running()) {
	var step = game_clock_get_step();
	if (step mod 2 == 0) {
		image_index = 1 + ((step div 2) mod 4);
	} else {
		image_index = 0;
	}
	with (PlayableCharacter) {
		if (linked_object_id == other) {
			depth = sign(other.z_depth[owner.index]) * other.depth;
			if (step mod 30 == 0) {
				audio_play_sound_on(audio_emitter, SphereOrbitSound, false, 0);
			}
		}
	}
	var angle;
	with (TailsTails) {
		if (linked_object_id == other) {
			angle = other.angle[source.owner.index];
			image_angle = angle_wrap(angle - 90 + (sign(source.depth) * -image_xscale * 90));
			depth = source.depth;
		}
	}
}