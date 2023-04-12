#!/bin/bash

# Bootstrap my environment helpers
[ -d $XDG_CONFIG_HOME/environment ] && eval "$(cat $XDG_CONFIG_HOME/environment/*)"
