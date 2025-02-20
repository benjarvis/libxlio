#
# SPDX-FileCopyrightText: NVIDIA CORPORATION & AFFILIATES
# Copyright (c) 2001-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only or BSD-3-Clause
#
# This software is available to you under a choice of one of two
# licenses.  You may choose to be licensed under the terms of the GNU
# General Public License (GPL) Version 2, available from the file
# COPYING in the main directory of this source tree, or the
# BSD license below:
#
#     Redistribution and use in source and binary forms, with or
#     without modification, are permitted provided that the following
#     conditions are met:
#
#      - Redistributions of source code must retain the above
#        copyright notice, this list of conditions and the following
#        disclaimer.
#
#      - Redistributions in binary form must reproduce the above
#        copyright notice, this list of conditions and the following
#        disclaimer in the documentation and/or other materials
#        provided with the distribution.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

# func.m4 - Collection of functions
# 

##########################
# Configure functions
#
# Some helper script functions
#
AC_DEFUN([FUNC_CONFIGURE_INIT],
[
show_section_title()
{
    cat <<EOF

============================================================================
== ${1}
============================================================================
EOF
}

show_summary_title()
{
    cat <<EOF

XLIO library
============================================================================
Version: ${PRJ_LIBRARY_MAJOR}.${PRJ_LIBRARY_MINOR}.${PRJ_LIBRARY_REVISION}.${PRJ_LIBRARY_RELEASE}
Git: ${GIT_VER}

EOF
}

])

# FUNC_CHECK_WITHDIR(name, direcory, file)
# ----------------------------------------------------
AC_DEFUN([FUNC_CHECK_WITHDIR],[
    AC_MSG_CHECKING([for $1 location])
    AS_IF([test "$2" = "yes" || test "$2" = "no" || test "x$2" = "x"],
          [AC_MSG_RESULT([(system default)])],
          [AS_IF([test ! -d "$2"],
                 [AC_MSG_RESULT([not found])
                  AC_MSG_WARN([Directory $2 not found])
                  AC_MSG_ERROR([Cannot continue])],
                 [AS_IF([test "x`ls $2/$3 2> /dev/null`" = "x"],
                        [AC_MSG_RESULT([not found])
                         AC_MSG_WARN([Expected file $2/$3 not found])
                         AC_MSG_ERROR([Cannot continue])],
                        [AC_MSG_RESULT([($2)])]
                       )
                 ]
                )
          ]
         )
])
