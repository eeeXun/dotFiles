//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"", "${HOME}/.config/dwmblocks/scripts/volume.sh", 0, 10},
	{"RAM ", "${HOME}/.config/dwmblocks/scripts/memory.sh", 2, 0},
    {"CPU ", "${HOME}/.config/dwmblocks/scripts/cpu.sh", 2, 0},
    {"", "${HOME}/.config/dwmblocks/scripts/tempurature.sh", 2, 0},
    {"", "${HOME}/.config/dwmblocks/scripts/net.sh",3, 0},
    {"", "${HOME}/.config/dwmblocks/scripts/battery.sh", 5, 0},
	{" ", "${HOME}/.config/dwmblocks/scripts/date.sh", 10, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
