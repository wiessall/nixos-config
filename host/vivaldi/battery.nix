{ stdenv, lib, fetchFromGitHub, kernel, kmod }:

stdenv.mkDerivation rec {
  pname = "framework_laptop";
  version = "1";

  src = fetchFromGitHub {
    owner = "DHowett";
    repo = "framework-laptop-kmod";
#    rev = "v${version}";
    hash = "6164bc3dec24b6bb2806eedd269df6a170bcc930";
  };

#  sourceRoot = "source/linux/v4l2loopback";
  hardeningDisable = [ "pic" "format" ];                                             # 1
  nativeBuildInputs = kernel.moduleBuildDependencies;                       # 2

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"                                 # 3
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"    # 4
    "INSTALL_MOD_PATH=$(out)"                                               # 5
  ];

  meta = {
    description = "A kernel module that exposes the Framework Laptop (13, 16)'s battery charge limit and LEDs to userspace.";
    homepage = "https://github.com/DHowett/framework-laptop-kmod";
    license = lib.licenses.gpl2;
    maintainers = [ lib.maintainers.makefu ];
    platforms = lib.platforms.linux;
  };
}

