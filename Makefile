#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
# Copyright (c) 2012, Bayard G. Bell. All rights reserved.
# Copyright (c) 2012, Louis M. Picciano, OmnisCloud.com. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		automake
COMPONENT_VERSION=	1.11.3
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/automake/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:537f5964bb7ec7d0df6544e3d10d9631fe7460f0
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/pub/gnu/automake/$(COMPONENT_ARCHIVE)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_OPTIONS  +=	--infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS  +=	CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS  +=	PERL="$(PERL)"

COMPONENT_TEST_ENV += \
	PERL5LIB=$(PROTOUSRSHAREDIR)/automake-1.11/

# common targets
build:		$(BUILD_32)

install:	$(INSTALL_32)

test:		$(INSTALL_32) $(TEST_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include $(WS_TOP)/make-rules/depend.mk
