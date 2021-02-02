/* See LICENSE file for copyright and license details. */

/* Constants */
#define TERMINAL "termite"
#define TERMCLASS "Termite"

/* appearance */
static unsigned int borderpx  = 3;        /* border pixel of windows */
static unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static unsigned int gappih    = 20;       /* horiz inner gap between windows */
static unsigned int gappiv    = 10;       /* vert inner gap between windows */
static unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static unsigned int gappov    = 30;       /* vert outer gap between windows and screen edge */
static int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel = 0;
static char *fonts[]          = { 
    "monospace:size=15", "Font Awesome 5 Free:size=15",
    "Font Awesome 5 Free Solid:size=15", "Font Awesome 5 Brands:size=15"
};

/* Bar background color */
static char normbgcolor[]           = "#222";

/* Bar foreground color */
static char normfgcolor[]           = "#dfdfdf";

/* Selected foreground color */
static char selfgcolor[]            = "#FFFF55";

/* Light Border color used for focused windows */
static char selbordercolor[]        = "#e60053";

/* Dark Border color used for unfocused windows */
static char normbordercolor[]       = "#444444";

/* Bar foreground color */	
static char selbgcolor[]            = "#444";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "monospace:size=16", "-g", "50x20", "-e", "bc", "-lq", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class	instance	title		tags mask	isfloating	isterminal noswallow  monitor */
	{ TERMCLASS,	NULL,		NULL,		0,		0,		1,         0,        -1 },
};

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
 	{ "[]=",	tile },			/* Default: Master on left, slaves on right */
	{ "TTT",	bstack },		/* Master on top, slaves on bottom */

	{ "[@]",	spiral },		/* Fibonacci spiral */
	{ "[\\]",	dwindle },		/* Decreasing in size right and leftward */

	{ "[D]",	deck },			/* Master on left, slaves in monocle-like mode on right */
 	{ "[M]",	monocle },		/* All windows on top of eachother */

	{ "|M|",	centeredmaster },		/* Master in middle, slaves on sides */
	{ ">M>",	centeredfloatingmaster },	/* Same but master floats */

	{ "><>",	NULL },			/* no layout function means floating behavior */
	{ NULL,		NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD,	XK_j,	ACTION##stack,	{.i = INC(+1) } }, \
	{ MOD,	XK_k,	ACTION##stack,	{.i = INC(-1) } }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/bash", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "borderpx",		INTEGER, &borderpx },
		{ "snap",		INTEGER, &snap },
		{ "showbar",		INTEGER, &showbar },
		{ "topbar",		INTEGER, &topbar },
		{ "nmaster",		INTEGER, &nmaster },
		{ "resizehints",	INTEGER, &resizehints },
		{ "mfact",		FLOAT,	&mfact },
		{ "gappih",		INTEGER, &gappih },
		{ "gappiv",		INTEGER, &gappiv },
		{ "gappoh",		INTEGER, &gappoh },
		{ "gappov",		INTEGER, &gappov },
		{ "swallowfloating",	INTEGER, &swallowfloating },
		{ "smartgaps",		INTEGER, &smartgaps },
};

#include <X11/XF86keysym.h>
#include "shiftview.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	STACKKEYS(MODKEY,                          focus)
	STACKKEYS(MODKEY|ShiftMask,                push)
	/* J and K are automatically bound above in STACKEYS */

	TAGKEYS(			XK_1,		0)
	TAGKEYS(			XK_2,		1)
	TAGKEYS(			XK_3,		2)
	TAGKEYS(			XK_4,		3)
	TAGKEYS(			XK_5,		4)
	TAGKEYS(			XK_6,		5)
	TAGKEYS(			XK_7,		6)
	TAGKEYS(			XK_8,		7)
	TAGKEYS(			XK_9,		8)
	TAGKEYS(			XK_0,		9)
	{ MODKEY,			XK_slash,	view,		{.ui = ~0} },

	/* Set various layouts */
	{ MODKEY,			XK_m,		setlayout,	{.v = &layouts[0]} }, /* tile */
	{ MODKEY|ShiftMask,		XK_m,		setlayout,	{.v = &layouts[1]} }, /* bstack */
	{ MODKEY,			XK_y,		setlayout,	{.v = &layouts[2]} }, /* spiral */
	{ MODKEY|ShiftMask,		XK_y,		setlayout,	{.v = &layouts[3]} }, /* dwindle */
	{ MODKEY,			XK_u,		setlayout,	{.v = &layouts[4]} }, /* deck */
	{ MODKEY|ShiftMask,		XK_u,		setlayout,	{.v = &layouts[5]} }, /* monocle */
	{ MODKEY,			XK_i,		setlayout,	{.v = &layouts[6]} }, /* centeredmaster */
	{ MODKEY|ShiftMask,		XK_i,		setlayout,	{.v = &layouts[7]} }, /* centeredfloatingmaster */
	{ MODKEY,			XK_f,		togglefullscr,	{0} }, /* Toggle fullscreen */
	{ MODKEY,		XK_s,	togglefloating,	{0} }, /* Toggle floating mode for a window */

    /* DWM */
	{ MODKEY,			XK_b,		togglebar,	{0} }, /* Show/hide bar */
	{ MODKEY|ShiftMask,		XK_q,		quit,		{0} }, /* Close DWM */
	{ MODKEY|ShiftMask,		XK_r,		quit,		{1} }, /* Restart DWM */

	/* Switch between active tag and last opened tag */
	{ MODKEY,			XK_Tab,		view,		{0} },

	/* Go a tag  left/right */
    { MODKEY,           XK_bracketleft, shiftview, { .i = -1 } },
    { MODKEY,           XK_bracketright, shiftview, { .i = +1 } },

	/* Move window to tag on the left/right */
	{ MODKEY|ShiftMask,		XK_bracketleft,	shifttag,	{ .i = -1 } },
	{ MODKEY|ShiftMask,		XK_bracketright,	shifttag,	{ .i = +1 } },

	/* Interact with tags on other monitors */
	{ MODKEY,			XK_Left,	focusmon,	{.i = -1 } },
	{ MODKEY|ShiftMask,		XK_Left,	tagmon,		{.i = -1 } },
	{ MODKEY,			XK_Right,	focusmon,	{.i = +1 } },
	{ MODKEY|ShiftMask,		XK_Right,	tagmon,		{.i = +1 } },


	/* [WINDOWS] */

	/* Sticky windows */
	{ MODKEY|ShiftMask,			XK_s,		togglesticky,	{0} },

	/* Increase/decrease the number of master windows */
	{ MODKEY,			XK_o,		incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,		XK_o,		incnmaster,     {.i = -1 } },

	/* Kill a window */
	{ MODKEY,			XK_w,		killclient,	{0} },

	/* Resize window */
	{ MODKEY,			XK_h,		setmfact,	{.f = -0.05} },
	{ MODKEY,			XK_l,		setmfact,      	{.f = +0.05} },

	/* Promote selected window to master */
	{ MODKEY,			XK_space,	zoom,		{0} },


	/* [GAPS] */
	/* Toggle gaps */
	{ MODKEY,			XK_a,		togglegaps,	{0} },

	/* Reset gaps to default size */
	{ MODKEY|ShiftMask,		XK_a,		defaultgaps,	{0} },

	/* Increase/decrease gaps */
	{ MODKEY,			XK_z,		incrgaps,	{.i = +3 } },
	{ MODKEY,			XK_x,		incrgaps,	{.i = -3 } },


	/* Launch a terminal */
	{ MODKEY,			XK_Return,	spawn,		{.v = termcmd } },
	/* Launch dmenu */
	{ MODKEY,		XK_d,		spawn,		SHCMD("dmenu_run") },
	/* Open/close terminal in scratchpad */
	{ MODKEY|ShiftMask,		XK_grave,	togglescratch,	{.ui = 0} },

    /* Launch lf */
    { MODKEY|ShiftMask,     XK_Return,  spawn,  SHCMD(TERMINAL " -e lfrun") },
	/* Open file manager */
	{ MODKEY|ShiftMask,		XK_f,		spawn,		SHCMD("caja") },
	/* Open Browser */
	{ MODKEY|ShiftMask,		XK_w,		spawn,		SHCMD("google-chrome-stable") },
	/* Take a screenshot */
	{ ShiftMask,		XK_Print,	spawn,		SHCMD("flameshot gui") },

	/* Mute audio */
	{ 0, XF86XK_AudioMute,				spawn,		SHCMD("amixer set Master toggle; kill -44 $(pidof dwmblocks)") },
	/* Raise/lower volume */
	{ 0, XF86XK_AudioRaiseVolume,			spawn,		SHCMD("amixer set Master 5%+; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioLowerVolume,			spawn,		SHCMD("amixer set Master 5%-; kill -44 $(pidof dwmblocks)") },

    /* Sleep */
    { 0, XF86XK_PowerOff,               spawn,      SHCMD("mate-screensaver-command -l") },
    { MODKEY, XF86XK_PowerOff,               spawn,      SHCMD("mate-screensaver-command -l && systemctl suspend") },

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
#ifndef __OpenBSD__
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
#endif
	{ ClkStatusText,        ShiftMask,      Button3,        spawn,          SHCMD(TERMINAL " -e nvim ~/dwm/dwmblocks/config.h") },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        defaultgaps,	{0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkClientWin,		MODKEY,		Button4,	incrgaps,	{.i = +1} },
	{ ClkClientWin,		MODKEY,		Button5,	incrgaps,	{.i = -1} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTagBar,		0,		Button4,	shiftview,	{.i = -1} },
	{ ClkTagBar,		0,		Button5,	shiftview,	{.i = 1} },
	{ ClkRootWin,		0,		Button2,	togglebar,	{0} },
};
