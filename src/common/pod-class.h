// Copyright (c) 2023-2024 Infinium Developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#pragma once

// in C++ no difference 'class' vs 'struct' except the default members access.
// maybe be better to erase the 'POD_CLASS' macro completely?
#define POD_CLASS struct
