
# Introduction



This article is made of two main sections: generic design principles,
and Jolly's design principles.

The generic design principles were applied during the development of Liquid Prompt.
They should remain valid for its default theme as well as for the Jolly theme.
However, the folowing section only discuss their implementation within the Jolly theme.

The Jolly's design principles are more or less specific to the Jolly theme.


## What is a Prompt?

There are two kind of computer scientists: those who use the command line,
and those who are retired. Even developers who embrace highly integrated development interfaces have some kind of terminal available in some panel of their IDE.
Like it or not, the shell is a core part of everyday life for most of the people expecting their computer to work for them.

Now the shell actually has access to a lot of information about the computer.
And most of this information is about the current state of the work environment,
which is of the highest interest to the user.
However, by default the shell only shows very little information unless you ask specifically for it.
Furthermore, the only location on the screen available for the permanent display of anything is the "prompt".

The prompt is this string of characters displayed right in front of the line where you type your commands.
In the most common default configuration, it displays only three pieces of information:
the user, the hostname, and the path —`user@hostname:path $ `.

But it can display more! And this is the objective of prompt systems.
Those "prompts" (to be short) actually add a lot of information to this area of the command line.
For example, the most common feature is to display the state of the Git repository the user is in.


## Prompt Features

This document will refer to feature sets,
as a way to group the information in broad categories.

Feature categories are:

1. **shell essentials**: features usually found in a classic prompt (path, user, exit codes…), useful in everyday use (jobs, sensors, multiplexer integration…), or generally considered important (themes…).
    1. **situation**: who is connected, and how.
    2. **location**: where (which path) the user is.
    3. **sensor**: states of the system (temperature, load, spaces, etc.).
    4. **feedback**: information from the last command (error, runtime).
    5. **warnings**: information conditionning the next command (admin rights).
2. **version control**: Git, Mercurial and co.
    1. **remote**: information related to interaction with a remote repository.
    2. **local**: information related to the local repository.
3. **environments**: dynamic configuration detection (virtual env, shell variables, containers…).
4. **toolsets versions**: current version of specific tools (programming languages, build chains, tools…).
5. **miscellaneous shell features**: shell-related features considered less important (network, terminal title, hyperlinks…).
6. **services**: services running permanently, online or on the machine (music, weather…).

Theses categories are delineated with the main use of the terminal in mind:

- Features in the *shell essentials* category is what you will need the most often, whatever you are doing in your terminal.
- If you are a programmer, you will pay additional attention to the *version control* and *environments* categories.
- If you are a devops, the *dev context* category is also of interest to you.
- If you do sysadmin, the *miscellaneous* category may contain some mildly interesting features.
- If you need features in the *services* category, you probably misunderstood what a *command line interface* is, or you are looking for a *status bar* (which a prompt system can be).


# Generic Design Principles

The rationale of a prompt system is that it is actually useful to have an immediate access to the current *state* of the system.
Seeing a *state change* right where the user actually looks is a very good *feedback* on their actions.
But of course this feedback should not come in the way of how the user works.

States should be chosen and displayed according to their importance for the user's work.

More precisely, a good prompt is a prompt which is:

- **accentuated**: it makes more visible the feedback for more important state changes, while not polluting the visibility of stable/anecdotal states,
- **focused**: it targets states that are actually useful to the user *during a work session*,
- **seamless**: it does not product friction with the user workflow,
- **scoped**: it targets states that can change by themselves or be changed by the user,
- **measured**: it embraces the fact that some states change less often than others (and thus avoids being just a collection of states that only rarely change),
- **configurable**: be easy to immediately adapt the display of information, if needed.


## Accentuated

The prompt should be organized in several sections, which importance should
be obvious to the user, depending on their location on the screen and/or their styling.

Section styling should not overflow on neighbor sections.
For instance, given that the terminal is organized as a grid of characters,
the background of two close character will blend.
Therefore, one should maintain a certain degree of contrast between sections
that are touching each other but have a different semantics.

> Jolly is organized in four sections, spread on three lines:
> 1. The leftmost part of the first line is the first in reading order.
>    It is thus used for stable and important information.
> 2. The third line is holding the actual prompt, where the user types.
>    It is thus of high importance, and used for the *version control*,
>    *feedback* and *warning* sections.
> 3. The rightmost part of the first line is last in the reading order.
>    It is thus used to display transient states.
> 4. The second line cannot be of background-colored, or it would overflow on
>    the first and last line. It is thus of low importance and holds the
>    *environments* and *toolset versions* sections.


## Focused

Information that changes often and/or that is important regarding the user's main tasks
should be easier to see.

In a regular prompt, most of the text has no background color by default.
Any text which has a background color is thus easier to spot.

Therefore, important information should be displayed in a background-colored segment,
while less important information can be displayed in a foreground-colored one.

Information related to the *situation* and *location* of the user should
always be considered important, as they may drastically alter the workflow of the user.

> In Jolly, the *toolsets versions* and *environment* feature sets are to be
> displayed in a foreground-colored section of the prompt,
> while the others are in background-colored sections.


## Seamless


## Scoped

States that are measured and not directly changed by the user should be hidden by default.
Counters that can fall down to zero should be hidden by default.

> In Jolly, *sensors* are hidden by default, while *situation* and *location*
> information are always shown, even if set to the default state.


## Measured

States that are expected to change often during a work sessions should be considered
important.
States that rarely change or evolve slowly are less important.

> In Jolly, *sensors* are grouped on the righmost part of the
> first line of the prompt.
> Information about version control is however close to the actual prompt.


## Configurable

Each aspect of theming should have a related configurable variable.


# Jolly's Design Principles

## Stability

## Proximity

## Sectioning

## Accessibility

## Semantic Spaces

## Semantic Sequences

## Semantic Thresholds


