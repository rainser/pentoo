# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-mod

DESCRIPTION="RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame injection"
HOMEPAGE="https://github.com/aircrack-ng/rtl8812au"

if [[ ${PV} == "9999" ]] ; then
	KEYWORDS=""
	inherit git-r3
	EGIT_REPO_URI="https://github.com/aircrack-ng/rtl8812au.git"
	EGIT_BRANCH="v5.2.20"
else
	KEYWORDS="~amd64 ~x86"
	COMMIT="362e6391aab99d16b81110565886e8bb66e5f1a6"
	SRC_URI="https://github.com/aircrack-ng/rtl8812au/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/rtl8812au-${COMMIT}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="!!net-wireless/rtl8812au_astsam
	!!net-wireless/rtl8812au
	!!net-wireless/rtl8812au_asus"

MODULE_NAMES="88XXau(net/wireless:)"

#compile against selected (not running) target
pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KVER=${KV_FULL}"
}

src_prepare() {
	sed -i 's#CONFIG_80211W = n#CONFIG_80211W = y#' Makefile
	default
}

src_compile() {
	set_arch_to_kernel
	KVER="${KV_FULL}" emake V=1 clean
	KVER="${KV_FULL}" emake V=1 RTL8814=1
}
