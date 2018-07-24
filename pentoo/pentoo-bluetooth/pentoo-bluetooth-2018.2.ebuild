# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Pentoo bluetooth meta ebuild"
HOMEPAGE="http://www.pentoo.ch"
KEYWORDS="~amd64 ~arm ~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE="minipentoo"

PDEPEND="
	!minipentoo? (
		app-fuzz/bss
		net-wireless/bt-audit
		net-wireless/btscanner
		net-wireless/crackle
		)
	net-wireless/blue_hydra
	|| ( net-wireless/kismet-ubertooth >net-wireless/kismet-2018.0.0 )
	net-wireless/ubertooth
	>=net-wireless/blueman-1.23_p20140717"
