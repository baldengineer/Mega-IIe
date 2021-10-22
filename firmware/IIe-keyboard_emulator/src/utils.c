#include "utils.h"
#include "hardware/timer.h"

uint32_t millis() {
	return ((time_us_32() / 1000));
}