# A text adventure
Embark on a text journey.

<p align="center">
    <a href="<p align="center">
    <a href="https://appcenter.elementary.io/com.github.bartzaalberg.text-adventure">
        <img src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter">
    </a>
</p>

<p align="center">
    <img
    src="https://raw.githubusercontent.com/bartzaalberg/text-adventure/master/screenshot.png" />
</p>

### Save the girl!

When finally deciding to leave Rosetown with your girl she has been kidnapped. Together with James you embark on a journey through ... to save her!

## Installation

First you will need to install elementary SDK

 `sudo apt install elementary-sdk`

### Dependencies

These dependencies must be present before building
 - `valac`
 - `gtk+-3.0`

 You can install these on a Ubuntu-based system by executing this command:

 `sudo apt install valac libgtk-3-dev`

### Building
```
meson build --prefix=/usr
cd build
ninja
```

### Installing
`sudo ninja install`

### Recompile the schema after installation
`sudo glib-compile-schemas /usr/share/glib-2.0/schemas`
