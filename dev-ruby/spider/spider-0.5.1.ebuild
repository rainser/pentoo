# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25"

inherit ruby-fakegem

DESCRIPTION="web spidering library"
HOMEPAGE="https://github.com/johnnagro/spider"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
#does not work, literally no clue why
RESTRICT=test
