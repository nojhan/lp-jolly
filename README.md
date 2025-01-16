Jolly — A Liquid Prompt Theme
=================================

Jolly is a theme for [Liquid Prompt](https://github.com/nojhan/liquidprompt).

It is an original prompt design, very carefully designed,
that will completely changes the way you imagine the prompt.

It is focused on *improving the user experience*,
by vastly improving the ability of the user to immediately spot
what she should do following her system's state changes.

Has such, you may find it a little bit disconcerting at first.
But we believe that the advantages of this design makes it worth the effort.


![A ship with black sails, three of which are printed with the symbols "~", "$", and ">"; going out of a circling boat wheel with sun rays in her back; and navigating a blue wave with froth going over a banner that reads "Liquid Prompt". A large black flag is attached to the front shroud, showing a skull and two crossed bones, on top of a legend reading "jolly roger".](docs/jolly_emblem.svg)


Preview
-------

Using the (recommended) "chevron" preset:

![](screenshots/variant-chevron.png)

The Jolly theme also comes as several variants, changing the shape of the segments separators,
like the "slant" variant:

![](screenshots/variant-slant.png)


Design
------

### Rationale

The Jolly theme use a couple of design principles:

* It is accessible to colorblind people, hence it uses:
    * only four colors: dark grey, white, blue and yellow (different color pairs are available as presets for people having blue-yellow colorblindess).
    * At least a text item for each segment,
    * or a blank space between segments.
* The blue colors means that the user is probably expected to perform some task.
* The yellow color carries an error or something of concern.
* Segments for "default" state are joined with graphical symbols that reads from right to left,
  in a way that makes sense.
* It uses three ways to carry information about the state of the system:
    * Important states are denoted by text.
    * Ancillary states can be shown with a single character/icon.
    * States appearing from a user action can be shown by "detaching" two segments usually joined.
      By default, this added space is shown as having a right-to-left direction.

The prompt itself is designed in three lines:

- The first line shows the state of the shell itself (type of graphical server, remote connection, user, host, path, etc.) on the left,
  and optional sensors states on the right (temperature, jobs, time, etc.).
- The second line displays whatever keywords have a meaning in the context (virtual environments, software collections, etc.).
- The third line indicates the relationships toward extern services (internet, VCS) and immediate status (runtime, error code).
  This is also where the actual prompt is.


### Example

For instance, in the following prompt, you can see that the user is in a Git repository and has some action waiting to be done:
- the rightmost blue "≠" indicates that there are some modifications waiting to be committed (hence the directional hint, from a diff to the branch).
- the leftmost blue segment indicates that there are some commits that may be pushed to the remote (hence the directional hint, from the branch to the VCS symbol).

![](screenshots/variant-chevron.png)

The screenshot also shows that the last command ended in an error, hence the red-over-yellow error code.

The upper section shows a classical state of the prompt: a shell within a graphical server ("X"),
for the default login user ("", a figure), on localhost ("", an island), in the liquidprompt directory, which is underlined because it is also a VCS repository.


### Full description

The following diagram shows almost all the possible states of a Jolly Liquid Prompt

![](liquidprompt_jolly_design.png)

The diagram is available [in a vector format](liquidprompt_jolly_design.svg) (note: you need a browser/viewer configured to use a [nerd-font](https://www.nerdfonts.com) to see it correctly).



Setup
-----

To actually use the Jolly theme, you need to add a few configuration commands to the script that loads Liquid Prompt.
For example:

```sh

   # Load Liquid Prompt.
   source ~/liquidprompt/liquidprompt
   # Configure the desired variant (or colors, etc.).
   source ~/lp-jolly/presets/variant-chevron.conf
   # Load the theme.
   source ~/lp-jolly/jolly.theme && lp_theme jolly
```

NOTE: The recommended segment markers (the "chevron" variant) uses characters in the private section of Unicode
that are defined by the "Nerd-fonts" project.
You will either need a compatible font, or use a variant that does not need them, like "text" and "jolly".

See the [Nerd-fonts Fonts installation docs](https://www.nerdfonts.com) for help on installing this kind of fonts.


Presets
--------

The `presets` directory contains configurations changing several variables at once.
It contains configuration files for changing the color pair (e.g. green/red instead of blue/yellow)
and the segments shape (see below).

### Variants

Variants needing a Nerd-fonts font:

- "chevron" (the recommended one):

![](screenshots/varint-chevron.png)

- "round":

![](screenshots/variant-round.png)

- "slant":

![](screenshots/variant-slant.png)

Variants available with a regular font:

- "jolly" (the default):

![](screenshots/variant-dots.png)

- "text" (using only common characters):

![](screenshots/variant-text.png)


Configuration
-------------

### Liquid Prompt Configuration

The Jolly theme honors Liquid Prompt configuration options,
except for the ones defining colors, specific marks and disabling some features.

The following options are honored:

- [`LP_ENABLE_PERM`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_ENABLE_PERM),
- [`LP_MARK_BATTERY`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_BATTERY),
- [`LP_MARK_LOAD`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_LOAD),
- [`LP_MARK_TEMP`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_TEMP),
- [`LP_PS1_PREFIX`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_PS1_PREFIX).

The following options are **not honored**:

- every ``LP_COLOR_\*`` options.
- all the others ``LP_MARK_\*`` options not listed in the above section.
- [`LP_USER_ALWAYS`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_USER_ALWAYS) (at least a user icon is always displayed).


### Theme Configuration

#### Presets

Some example configurations are provided in the `/presets/` directory.

Note: the order in which you load the presets may be important.
When changing the colors of the first line, presets needs to be loaded
from your shell configuration and not just sourced in the prompt.

A first set is called "variants" and mainly change the segment joints,
but can also impact the icons on some variants:

- `source presets/variant-chevron.conf` (the *recommended*, need a Nerd-fonts font),
- `source presets/variant-slant.conf` (need a Nerd-fonts font),
- `source presets/variant-round.conf` (need a Nerd-fonts font),
- `source presets/variant-text.conf` (the one that works anywhere).

A second set changes the colors:

- `source presets/colors_green-red.conf` (warning in red, notes in green),
- `source presets/colors_cyan-magenta.conf` (warning in magenta, notes in cyan),
- `source presets/colors_high-contrast.conf` (segments are very white and very black instead of slightly grayish),


#### High-level

**JOLLY_SPACED** *boolean = 1*

If set to false, this flag will configure a compact prompt,
showing segments without extra spaces around their joints.


#### Specific features

**JOLLY_VCS_AHEAD_THRESHOLD** *integer = 5*

Number of unpushed local commits above which the prompt should use the warning color to display the "push" section.


**JOLLY_VCS_BEHIND_THRESHOLD** *integer = 5*

Number of unpulled remote commits above which the prompt should use the warning color to display the "pull" section.


**JOLLY_VCS_DIFF_THRESHOLD** *integer = 300*

Number of modified lines above which the prompt should use the warning color to display the "commit" section.

**JOLLY_VCS_REMOTE_ORIGIN** *string* = "🖈"

String used as a shorten VCS remote name, if it is "origin".

**JOLLY_DETACHED_THRESHOLD** *integer = 3*

Number of detached jobs above which the prompt should use the warning color.


**JOLLY_RUNNING_THRESHOLD** *integer = 3*

Number of running jobs above which the prompt should use the warning color.


**JOLLY_STOPPED_THRESHOLD** *integer = 3*

Number of stopped jobs above which the prompt should use the warning color.


**JOLLY_BATTERY_THRESHOLD** *integer = $((LP_BATTERY_THRESHOLD/2))*

Percentage below which the prompt should use the warning color.


**JOLLY_TEMP_THRESHOLD** *integer = $((LP_TEMP_THRESHOLD*2))*

Temperature above which the prompt should use the warning color.


**JOLLY_LOAD_THRESHOLD** *integer = $((_LP_LOAD_THRESHOLD+(_LP_LOAD_CAP-_LP_LOAD_THRESHOLD)/2))*

Load percentage above which the prompt should use the warning color.


**JOLLY_ENABLE_HISTORY** *boolean = 1*

Enable the history sections displayed on the right side of the middle line.


**JOLLY_HISTORY_MOST_BACK** *integer = 100*

Number of the last history events to take into account when looking for the most used command.


**JOLLY_HISTORY_LAST_LEN** *integer = $((COLUMNS/4))*

Maximum length of the *last* command used (counting the `JOLLY_HISTORY_LAST_LEN_MARK` length).


**JOLLY_HISTORY_LAST_LEN_MARK** *integer = "[…]"*

Mark to display when the last command string is shortened.


**JOLLY_ENABLE_SHELL** *boolean = 0*

Display the current shell in the top-right section.


**JOLLY_SHELL_ZSH** *string = "z"*

The mark indicating a *zsh* shell.


**JOLLY_SHELL_BASH** *string = "b"*

The mark indicating a *bash* shell.


#### Generic Markers

The following options configure some marks that will be used across all variants of the theme.

**JOLLY_DISPLAY_TEXT** *string = "T"*

The marker used to indicates that the shell is in text mode,
i.e. that does not have a graphical display
(more rigorously: there is no X11 `DISPLAY` environment variable).


**JOLLY_DISPLAY_X11** *string = "X"*

The marker used to indicates that the shell does have access to a graphical server
(more rigorously: there is a X11 `DISPLAY` environment variable).


**JOLLY_HOST_LOCAL** *string = "⌂"*

The marker used to indicate that the hostname is `localhost`.

**JOLLY_USER_LOCAL** *string = "♟"*

The marker used to indicate that the user is the same than the login one.


**JOLLY_MARK_STASH** *string = "✝"*

The marker used to indicate that the VCS stash is not empty.


**JOLLY_MARK_UNTRACKED** *string = "?"*

The marker used to indicate that there are some files that are untracked
by the VCS in the current repository.


**JOLLY_DIFF** *string = "≠"*

The marker used to indicate that there is some change in the VCS state
(either changes needed to be committed, or commits needed to be pushed).


**JOLLY_VCS** *string = "╟┘"*

The marker used to indicate that there is a VCS involved in the current directory.


**JOLLY_MARK** *string = "⯀"*

The actual prompt marker, right where the user type text.


**JOLLY_MARK_SUDO** *string = "⋮"*

An additional character displayed before the last prompt mark
when the user has sudo rights.

**JOLLY_ENABLE_GRADIENT_LINE** *boolean = 0*

If set to 0 (the default),  will draw the line of the middle section
as a sequence of `JOLLY_LINE` characters,
using the `JOLLY_COLOR_LINE` color.

If set to 1, will draw the same line with a gradient of color
interpolated from `JOLLY_COLOR_LINE_START`
to `JOLLY_COLOR_LINE_END`.


**JOLLY_MARK_ERROR** *string = " "*

Icon displayed in front of the last exit error code.


#### Variant Markers

These options are the one used to actually define the theme variants.
You may overcome them with your own configuration.

**JOLLY_LINE** *string = "━"*

The character used to draw the middle line.


**JOLLY_PLUG** *string = "▛"*

The character for joined segments limits.


**JOLLY_SOFT** *string = "╱"*

The character for "soft" separation (e.g. path elements, branch details, jobs, etc.)


**JOLLY_MEAN** *string = "▞"*

The character for "mean" separation
(used when two segments of the same color are joint).


**JOLLY_LINK** *array<string> = ("▙" " "   "▜")*

Characters used for showing a small gap.


**JOLLY_OPEN** *array<string> = ("▙" " ▚ " "▜")*

Characters used for showing a large gap.


**JOLLY_DANG** *array<string> = ("▙" " □ " "▜")*

Characters used for showing a very lareg gap (i.e. a dangerous state).


**JOLLY_ENDS** *array<string> = ("▛▞▗ ▝" "▖ ▘▞▟")*

Characters marking the ends of the right and left parts of the first line.


**JOLLY_ITEMS** *array<string> = ("┫" "┃" "┣")*

Characters used to separate keywords in the middle line.
The middle character separates keywords of the same type (e.g. every Software Collection).


#### Spacing

You may overcome the spacing details with these options.

**JOLLY_SPACE_VOID** *string = " "*

Spacing character around segments joints marker.


**JOLLY_SPACE_PATH** *string = " "*

Spacing character specifically for the "current path" section.


**JOLLY_SPACE_FIELD** *string = ""*

Spacing character around the content of the segments themselves.


**JOLLY_SPACE_LINE** *string = " "*

Spacing character around the keywords of the middle line.


**JOLLY_SPACE_FILL** *string = "█"*

Spacing character for filled sections.
You probably don't want to touch this.


#### Colors


**JOLLY_COLOR_DARK** *array<int> = (252 239 0 0  15   0)*

The color of dark segments.


**JOLLY_COLOR_LITE** *array<int> = (239 252 0 0   0  15)*

The color of light segments.


**JOLLY_COLOR_GLOW** *array<int> = (  0 252 1 0   0  15)*

The color for bright elements.


**JOLLY_COLOR_NOTE** *array<int> = ( 15  33 0 0  15  12)*

The color for notable elements.


**JOLLY_COLOR_WARN** *array<int> = (196 220 1 0   0  11)*

The color for elements related to a warning.


**JOLLY_COLOR_FAIR** *array<int> = (  0 244 0 0   0   8)*

The color for elements that are not very important.


**JOLLY_COLOR_HOSTNAME** *array<int> = ( ${JOLLY_COLOR_LITE[@]} )*

The color for the hostname segment. By default initialized from JOLLY_COLOR_LITE.


**JOLLY_COLOR_PATH_SHORT** *array<int> = (252 239 0 0   0   7)*

The color of the shorten path marker.


**JOLLY_COLOR_PATH_VCS** *array<int> = (252 239 0 1   0  15)*

The color of the VCS repository in the path.


**JOLLY_COLOR_PATH_LAST** *array<int> = (15 239 1 0   0  15)*

The color of the current directory.


**JOLLY_COLOR_LINE** *array<int> = (244 -1 0 0 15 -1)*

The color of the middle line.


**JOLLY_COLOR_MARK** *array<int> = (15 -1 0 0 15 -1)*

The color of the actual prompt mark.


**JOLLY_COLOR_SEP_DARK** *array<int> = (  0 -2 0 0  0 -2)*

The color for dark separators.


**JOLLY_COLOR_SEP_FAIR** *array<int> = (244 -2 0 0  0 -2)*

The color for fair separators.


**JOLLY_COLOR_SEP_LITE** *array<int> = ( 15 -2 0 0 15 -2)*

The color for light separators.


**JOLLY_COLOR_LINE_START** *array<int> = (255 -1 1 0 15 -1)*

The color starting the gradient of the line of the middle section.
Default is white.

Valus being linearly interpolated up to `JOLLY_COLOR_LINE_END`,

it is recommended to stick to aligned ANSI values (i.e. greys)


**JOLLY_COLOR_LINE_END** *array<int> = (232 -1 1 0 15 -1)*

The color ending the gradient of the line of the middle section.
Default is black.


Valus being linearly interpolated from `JOLLY_COLOR_LINE_START`,

it is recommended to stick to aligned ANSI values (i.e. greys).


