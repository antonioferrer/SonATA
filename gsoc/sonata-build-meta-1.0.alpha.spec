################################################################################
#
# File   : sonata-build-meta
# Project: SonATA
# Authors: The SonATA code is the result of many programmers
#          over many years
#
# Copyright 2011 The SETI Institute
#
# SonATA is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# SonATA is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with SonATA. If not, see<http://www.gnu.org/licenses/>.
#
# Implementers of this code are requested to include the caption
# "Licensed through SETI" with a link to setiQuest.org.
#
# For alternate licensing arrangements, please contact
# The SETI Institute at www.seti.org or setiquest.org.
#
################################################################################
Name:          sonata-build-meta
Version:       1.0.alpha
Release:       1
License:       Gnu Public License v3
Group:         Metapackages
Summary:       Meta package for building Setiquest SonATA
URL:           http://setiquest.org/content/introduction
BuildRoot:     %{_tmppath}/%{name}-%{version}-build
BuildArch:     noarch

# Adding the dependencies
Requires:      gmp-devel
Requires:      mpfr
Requires:      mpfr-devel
Requires:      tcl
Requires:      tcl-devel
Requires:      mysql
Requires:      mysql-devel
Requires:      ncurses
Requires:      ncurses-devel
Requires:      fftw3
Requires:      fftw3-devel
Requires:      readline
Requires:      readline-devel
Requires:      expect
Requires:      expect-devel
Requires:      swig
Requires:      tk
Requires:      tk-devel
Requires:      syslinux
Requires:      doxygen
Requires:      gcc
Requires:      gcc-c++
Requires:      make
Requires:      libtool
Requires:      automake
Requires:      tcsh
Requires:      bash
Requires:      java-sun
Requires:      java-devel-sun
Requires:      git
Requires:      openssh
Requires:      update-alternatives

%description
This metapackage package installs all the dependencies needed for the Setiquest SonATA.

%prep

%build

%install

%clean

%files
%defattr(-,root,root)


%changelog
* Wed May 25 2011 Khurram Baig (khrm.baig@gmail.com)
- Added some more dependencies and license text

* Mon May 23 2011 Khurram Baig (khrm.baig@gmail.com)
- Alpha Release


