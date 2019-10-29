# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Use to display information about binary files in different file formats"
HOMEPAGE="https://scoding.de/ropper https://github.com/sashs/Ropper"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sashs/Ropper"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

	# TODO: unmask this version after resolving issues
	# see more:
	# * https://github.com/gentoo/gentoo/pull/11828
	# * https://bugs.gentoo.org/652440
	#KEYWORDS="~amd64 ~arm64 ~mips ~x86"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="${PYTHON_DEPS}
	dev-libs/capstone[python,${PYTHON_USEDEP}]
	dev-libs/keystone[python,${PYTHON_USEDEP}]
	dev-python/filebytes[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
