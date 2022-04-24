Project to test capturing Mega II's RGBx signals to convert to VGA video.

For now, the goal is to use the PIO to capture an entire frame of video, DMA to memory buffer, and then export that for analysis. (i.e. not going for motion, but still frames.)

This work should lay the foundation for wiring into the PicoVGA library.