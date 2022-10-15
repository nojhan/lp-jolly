DotMatrix — A Liquid Prompt Theme
=================================

Neon is a theme for [Liquid Prompt](https://github.com/nojhan/liquidprompt).

It is an original prompt design, very carefully designed,
that will completely changes the way you imagine the prompt.

It is focused on *improving the user experience*,
by vastly improving the ability of the user to immediatly spot
what she should do following her system's state changes.

Has such, you may find it a little bit disconcerting at first.
But we believe that the advantages of this design makes it worth the effort.


Preview
-------

If there is nothing special about the current context, the appearance of
DotMatrix might be as simple as this:

![](dotmatrix-short-chevron.png)

A typical display of a slightly complex session would look like this:

![](dotmatrix-med-chevron.png)

The DotMatrix theme also comes as several variants, changing the shape of the segments separators,
like the (default) "dotmatrix" pixels:

![](dotmatrix-short-dots.png)

or the "slant" variant:

![](dotmatrix-med-slant.png)


Design
------

### Rationale

The DotMatrix theme use a couple of design principles:

* It is accessible to colorblind people, hence it uses:
    * only four colors: dark grey, white, blue and yellow.
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
      When possible, this added space is shown as having a right-to-left direction.

The prompt itself is designed in three lines:

- The first line shows the state of the shell itself (type of graphical server, remote connection, user, host, path, etc.) on the left,
  and optional sensors states on the right (temperature, jobs, time, etc.).
- The second line displays whatever keywords have a meaning in the context (virtual environments, software collections, etc.).
- The third line indicates the relationships toward extern services (internet, VCS) and immediate status (runtime, error code).
  This is also where the actual prompt is.


### Example

For instance, in the following prompt, you can see that the user is in a Git repository and has some action waiting to be done:
- the rightmost blue "≠" indicates that there are some modifications waiting to be commited (hence the directional hint, from a diff to the branch).
- the leftmost blue segment indicates that there are some commits that may be pushed to the remote (hence the directional hint, from the branch to the VCS symbol).

![](dotmatrix-intro-chevron.png)

The screenshot also shows that the last command ended in an error, hence the red-over-yellow error code.

The upper section shows a classical state of the prompt: a shell within a graphical server ("X"),
for the default login user ("", a figure), on localhost ("", an island), in the liquidprompt directory, which is underlined because it is also a VCS repository.


### Full description

The following diagram shows almost all the possible states of a DotMatrix Liquid Prompt:

![](liquidprompt_dotmatrix_design.svg)


Setup
-----

To actually use the DotMatrix theme, you need to add a few configuration commands to the script that loads Liquid Prompt.
For example:

```sh

   # Load Liquid Prompt.
   source ~/liquidprompt/liquidprompt
   # Configure the desired variant.
   DOTMATRIX_VARIANT="chevron"
   # Load the theme.
   source ~/lp-dotmatrix/dotmatrix.theme && lp_theme dotmatrix
```

NOTE: The recommended segment markers (the "chevron" variant) uses characters in the private section of unicode
that are defined by the "Nerd-fonts" project.
You will either need a compatible font, or use a variant that does not need them, like "text" and "dotmatrix".

See the [Nerd-fonts Fonts installation docs](https://www.nerdfonts.com) for help on installing this kind of fonts.


Variants
--------

Variants needing a Nerd-fonts font:

- "chevron" (the recommended one):

![](dotmatrix-short-chevron.png)

- "round":

![](dotmatrix-short-round.png)

- "slant":

![](dotmatrix-short-slant.png)

Variants available with a regular font:

- "dotmatrix" (the default):

![](dotmatrix-short-dots.png)

- "text" (using only common characters):

![](dotmatrix-short-text.png)


Configuration
-------------

### Liquid Prompt Configuration

The DotMatrix theme honors Liquid Prompt configuration options,
except for the ones defining colors, specific marks and disabling some features.

The following options are honored:

- [`LP_ENABLE_PERM`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_ENABLE_PERM),
- [`LP_ENABLE_VCS_DIFFSTATS`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_ENABLE_VCS_DIFFSTATS),
- [`LP_ENABLE_UNCOMMITED`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_ENABLE_UNCOMMITED),
- [`LP_MARK_BATTERY`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_BATTERY),
- [`LP_MARK_LOAD`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_LOAD),
- [`LP_MARK_TEMP`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_MARK_TEMP),
- [`LP_PS1_PREFIX`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_PS1_PREFIX).

The following options are **not honored**:

- every ``LP_COLOR_\*`` options.
- all the others ``LP_MARK_\*`` options not listed in the above section.
- [`LP_USER_ALWAYS`](https://liquidprompt.readthedocs.io/en/stable/config.html#LP_USER_ALWAYS) (at least a user icon is always displayed).


### Theme Configuration

#### High-level

**DOTMATRIX_VARIANT** *string = "dotmatrix"*

The variant of the theme.
This mainly change the segments separation style,
but can also impact the icons on some variants.

Allowed values:

- "dotmatrix" (the *default*),
- "chevron" (the *recommended*, need a Nerd-fonts font),
- "slant" (need a Nerd-fonts font),
- "round" (need a Nerd-fonts font),
- "text" (the one that works anywhere).


**DOTMATRIX_SPACED** *boolean = 1*

If set to false, this flag will configure a compact prompt,
showing segments without extra spaces around their joints.

Example of a spaced prompt:

![](dotmatrix-spaced.png)

Example of a compact prompt:

![](dotmatrix-unspaced.png)


#### Specific features

**DOTMATRIX_ENABLE_HISTORY** *boolean = 1*

Enable the history sections displayed on the right side of the middle line.


**DOTMATRIX_HISTORY_MOST_BACK** *integer = 100*

Number of the last history events to take into account when looking for the most used command.


**DOTMATRIX_HISTORY_LAST_LEN** *integer = $((COLUMNS/4))*

Maximum length of the *last* command used (counting the `DOTMATRIX_HISTORY_LAST_LEN_MARK` length).


**DOTMATRIX_HISTORY_LAST_LEN_MARK** *integer = "[…]"*

Mark to display when the last command string is shortened.


**DOTMATRIX_ENABLE_SHELL** *boolean = 0*

Display the current shell in the top-right section.


**DOTMATRIX_SHELL_ZSH** *string = "z"*

The mark indicating a *zsh* shell.


**DOTMATRIX_SHELL_BASH** *string = "b"*

The mark indicating a *bash* shell.


#### Generic Markers

The following options configure some marks that will be used across all variants of the theme.

**DOTMATRIX_DISPLAY_TEXT** *string = "T"*

The marker used to indicates that the shell is in text mode,
i.e. that does not have a graphical display
(more rigorously: there is no X11 `DISPLAY` environment variable).


**DOTMATRIX_DISPLAY_X11** *string = "X"*

The marker used to indicates that the shell does have access to a graphical server
(more rigorously: there is a X11 `DISPLAY` environment variable).


**DOTMATRIX_HOST_LOCAL** *string = "⌂"*

The marker used to indicate that the hostname is `localhost`.

**DOTMATRIX_USER_LOCAL** *string = "♟"*

The marker used to indicate that the user is the same than the login one.


**DOTMATRIX_MARK_STASH** *string = "✝"*

The marker used to indicate that the VCS stash is not empty.


**DOTMATRIX_MARK_UNTRACKED** *string = "?"*

The marker used to indicate that there are some files that are untracked
by the VCS in the current repository.


**DOTMATRIX_DIFF** *string = "≠"*

The marker used to indicate that there is some change in the VCS state
(either changes needed to be committed, or commits needed to be pushed).


**DOTMATRIX_VCS** *string = "╟┘"*

The marker used to indicate that there is a VCS involved in the current directory.


**DOTMATRIX_MARK** *string = "■"*

The actual prompt marker, right where the user type text.


**DOTMATRIX_ENABLE_GRADIENT_LINE** *boolean = 0*

If set to 0 (the default),  will draw the line of the middle section
as a sequence of `DOTMATRIX_LINE` characters,
using the `DOTMATRIX_COLOR_LINE` color.

If set to 1, will draw the same line with a gradient of color
interpolated from `DOTMATRIX_COLOR_LINE_START`
to `DOTMATRIX_COLOR_LINE_END`.


#### Variant Markers

These options are the one used to actually define the theme variants.
You may overcome them with your own configuration.

**DOTMATRIX_LINE** *string = "━"*

The character used to draw the middle line.


**DOTMATRIX_PLUG** *string = "▛"*

The character for joined segments limits.


**DOTMATRIX_SOFT** *string = "╱"*

The character for "soft" separation (e.g. path elements, branch details, jobs, etc.)


**DOTMATRIX_MEAN** *string = "▞"*

The character for "mean" separation
(used when two segments of the same color are joint).


**DOTMATRIX_LINK** *array<string> = ("▙" " "   "▜")*

Characters used for showing a small gap.


**DOTMATRIX_OPEN** *array<string> = ("▙" " ▚ " "▜")*

Characters used for showing a large gap.


**DOTMATRIX_DANG** *array<string> = ("▙" " □ " "▜")*

Characters used for showing a very lareg gap (i.e. a dangerous state).


**DOTMATRIX_ENDS** *array<string> = ("▛▞▗ ▝" "▖ ▘▞▟")*

Characters marking the ends of the right and left parts of the first line.


**DOTMATRIX_ITEMS** *array<string> = ("┫" "┃" "┣")*

Characters used to separate keywords in the middle line.
The middle character separates keywords of the same type (e.g. every Software Collection).


#### Spacing

You may overcome the spacing details with these options.

**DOTMATRIX_SPACE_VOID** *string = " "*

Spacing character around segments joints marker.


**DOTMATRIX_SPACE_PATH** *string = " "*

Spacing character specifically for the "current path" section.


**DOTMATRIX_SPACE_FIELD** *string = ""*

Spacing character around the content of the segments themselves.


**DOTMATRIX_SPACE_LINE** *string = " "*

Spacing character around the keywords of the middle line.


**DOTMATRIX_SPACE_FILL** *string = "█"*

Spacing character for filled sections.
You probably don't want to touch this.


#### Colors


**DOTMATRIX_COLOR_DARK** *array<int> = (252 239 0 0  15   0)*

The color of dark segments.


**DOTMATRIX_COLOR_LITE** *array<int> = (239 252 0 0   0  15)*

The color of light segments.


**DOTMATRIX_COLOR_GLOW** *array<int> = (  0 252 1 0   0  15)*

The color for bright elements.


**DOTMATRIX_COLOR_NOTE** *array<int> = ( 15  33 0 0  15  12)*

The color for notable elements.


**DOTMATRIX_COLOR_WARN** *array<int> = (196 220 1 0   0  11)*

The color for elements related to a warning.


**DOTMATRIX_COLOR_FAIR** *array<int> = (  0 244 0 0   0   8)*

The color for elements that are not very important.


**DOTMATRIX_COLOR_PATH_SHORT** *array<int> = (252 239 0 0   0  15)*

The color of the shorten path marker.


**DOTMATRIX_COLOR_PATH_VCS** *array<int> = (252 239 0 1   0  15)*

The color of the VCS repository in the path.


**DOTMATRIX_COLOR_PATH_LAST** *array<int> = (15 239 1 0   0  15)*

The color of the current directory.


**DOTMATRIX_COLOR_LINE** *array<int> = (244 -1 0 0 15 -1)*

The color of the middle line.


**DOTMATRIX_COLOR_MARK** *array<int> = (15 -1 0 0 15 -1)*

The color of the actual prompt mark.


**DOTMATRIX_COLOR_SEP_DARK** *array<int> = (  0 -2 0 0  0 -2)*

The color for dark separators.


**DOTMATRIX_COLOR_SEP_FAIR** *array<int> = (244 -2 0 0  0 -2)*

The color for fair separators.


**DOTMATRIX_COLOR_SEP_LITE** *array<int> = ( 15 -2 0 0 15 -2)*

The color for light separators.


**DOTMATRIX_COLOR_LINE_START** *array<int> = (255 -1 1 0 15 -1)*

The color starting the gradient of the line of the middle section.
Default is white.

Valus being linearly interpolated up to `DOTMATRIX_COLOR_LINE_END`,
it is recommended to stick to aligned ANSI values (i.e. greys)


**DOTMATRIX_COLOR_LINE_END** *array<int> = (232 -1 1 0 15 -1)*

The color ending the gradient of the line of the middle section.
Default is black.

Valus being linearly interpolated from `DOTMATRIX_COLOR_LINE_START`,
it is recommended to stick to aligned ANSI values (i.e. greys).


