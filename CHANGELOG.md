# Change Log
All notable changes to this project will be documented in this file.

## [0.8.0] - 2017-06-18
### Added
- Pass environment to sub processes
- Add -s switch to specify the search paths (thanks to  Johannes Löthberg)
- Add support for KDE's proprietary Service type (#7 and #28, thanks to
  Sébastien Luttringer and Konfekt)

### Changed
- Mark clean target PHONY
- Switch to RST for the README and manpaeg
- Ignore backslash in comments (#8, thanks to nanouck)
- Ignore missing name for Type=Service entries (#28, thanks to Konfekt)

### Fixed
- add force to clean target (#25, thanks to  Johannes Löthberg)
- Turn utf-8 string into Unicode string literal (#23, thanks to  Johannes
  Löthberg)
- Fix error converting man page
- Print nice error message when target directory doesn't exist (#31, thanks to
  @lasers)
