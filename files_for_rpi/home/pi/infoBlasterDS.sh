#!/bin/bash
# Digital Signage Slideshow Script
# Options associated with 'fbi' (2 lines below) can be customized
fbi -noverbose -a -fitwidth -T 1 -t 3 /var/ds/current/*.[jJ][pP][gG]
# fbi usage subject to gnu gpl
#       -h     print usage info
#       -d device
#              framebuffer device to use.  Default is the one your vc is mapped
#              to.
#       -m mode
#              name  of  the  video  mode  to use (video mode must be listed in
#              /etc/fb.modes).  Default is not to change the video mode.
#
#       -v     be verbose: enable status line on the bottom of the screen.
#
#       -P     Enable textreading mode.  This has the effect that fbi will dis?
#              play  large images without vertical offset (default is to center
#              the images).  Space will first try to scroll down and go to  the
#              next  image  only  if  it  is already on the bottom of the page.
#              Useful if the images you are watching text pages, all  you  have
#              to do to get the next piece of text is to press space...
#
#       -t sec timeout:  load  next  image after >sec< seconds without any key?
#              press (i.e. slideshow)
#
#       -g gamma
#              gamma correction.  Can also be put into the FBGAMMA  environment
#              variable.   Default is 1.0.  Requires Pseudocolor or Directcolor
#              visual, doesn't work for Truecolor.
#
#       -r n   select resolution.  PhotoCD only, n = 1..5.
#
#       -s n   set scroll steps in pixels (default is 50).
#
#       -f font
#              Set font.  This can be anything fontconfig accepts.  Try fc-list
#              for a list of known fonts on your system.  The fontconfig config
#              file is evaluated as well, so any generic  stuff  defined  there
#              (such  as  mono,  sans) will work as well.  It is recommended to
#              use monospaced fonts, the textboxes (help text, exif info)  look
#              better then.
#
#       -a     Enable  autozoom.  fbi will automagically pick a reasonable zoom
#              factor when loading a new image.
#
#       --autoup
#              Like autozoom, but scale up only.
#
#       --autodown
#              Like autozoom, but scale down only.
#
#       -u     Randomize the order of the filenames.
#
#       -c     continually scan files
#
#       -e     Enable editing commands.
#
#       -b     create backup files (when editing images).
#
#       -p     preserve timestamps (when editing images).
#
#       --comments
#              Display comment tags  (if  present)  instead  of  the  filename.
#              Probably  only  useful if you added reasonable comments yourself
#              (using wrjpgcom for example), otherwise  you  likely  just  find
#              texts pointing to the software which created the image.

