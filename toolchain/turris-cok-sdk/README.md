# Turris SDK for container-optimized kernel

Missing for optimal (according to docker self-inspection) configuration:
* **CONFIG_KERNEL_CGROUP_HUGETLB=y** (I currently don't know the impact of this -> hints & PR's welcome)
* CONFIG_KERNEL_CGROUP_NET_PRIO=y *(Can be ignored, just renaming of CONFIG_KERNEL_NETPRIO_CGROUP)*
* CONFIG_PACKAGE_kmod-asn1-decoder=y
