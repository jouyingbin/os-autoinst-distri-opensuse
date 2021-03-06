# SUSE's openQA tests
#
# Copyright © 2018-2020 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: test sysctl because it can go wrong https://bugzilla.opensuse.org/show_bug.cgi?id=1077746
# - Run 'sysctl -w vm.swappiness=59'
# - Check /proc/sys/vm/swappiness and validate value "59"
# Maintainer: Bernhard M. Wiedemann <bwiedemann+openqa@suse.de>

use base "consoletest";
use strict;
use warnings;
use testapi;

sub run {
    my $self = shift;
    $self->select_serial_terminal;
    assert_script_run 'sysctl -w vm.swappiness=59';
    validate_script_output 'cat /proc/sys/vm/swappiness', sub { m/^59$/ };
}

1;
