# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit janet-module

DESCRIPTION="A janet module for running child processes."
HOMEPAGE="https://github.com/andrewchambers/janet-process"
GIT_COMMIT="0066875092ef5a88025d0d3d1b53fa6ccc58d2c6"
SRC_URI="https://github.com/andrewchambers/janet-process/archive/${GIT_COMMIT}.tar.gz -> janet-${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
S="${WORKDIR}/janet-${PN}-${GIT_COMMIT}"
DOCS="README.md"
