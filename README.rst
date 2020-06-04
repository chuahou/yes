######################
Random yes experiments
######################

|License: MIT|

A series of implementations of the simplest form of ``yes``, outputting
an endless loop of ``y\n``.

Inspired by, and C solutions based on, `this Reddit post
<https://www.reddit.com/r/unix/comments/6gxduc/how_is_gnu_yes_so_fast/>`_.

``hsbyte`` based on `this Reddit comment
<https://www.reddit.com/r/programming/comments/6gxf02/how_is_gnus_yes_so_fast_xpost_runix/diufu49/>`_.

Usage
======

To compile, simply run
::

	make

To run a specific test, run
::

	./speedtest.sh [test]

To see the list of compiled tests, just run
::

	./speedtest.sh

To test GNU yes, or the yes installed on your system, run
::

	yes | pv > /dev/null

Results
=======

These results are **completely not rigorous**. Each test was only run
once for a total of 5 seconds each, which I believe was sufficient
enough to see the improvements in each.

The percentages for each speed is of the speed of the intial test of
GNU yes.

GNU yes
-------
yes
	5.53 GiB/s

Bash scripts
------------
sh.sh (``echo "y"``)
	593 KiB/s (0.01%)—There is a lot of overhead from each call to
	``echo``.
shunroll.sh (``echo "y\ny\ny\n..."``)
	40.1 MiB/s (0.71%)—Less overhead due to less calls to ``echo``,
	since each call prints multiple lines of ``y\n``.

Haskell (``ghc``)
------------------
hs
	12.3 MiB/s (0.21%)
hslist (infinite list)
	9.07 MiB/s (0.16%)—Overhead of list usage.
hsbuf (manual flush every 8192)
	196 MiB/s (3.46%)—Vast improvements from manually flushing and
	disabling flushing upon every newline.
hsbyte (use ``ByteString.Char 8``)
	4.08 GiB/s (73.78%)—Extreme improvements from using ``ByteString``
	instead (based on `this Reddit comment
	<https://www.reddit.com/r/programming/comments/6gxf02/how_is_gnus_yes_so_fast_xpost_runix/diufu49/>`_).

C (``gcc -O3 -g``)
------------------
c (``printf``)
	138 MiB/s (2.44%)
cputs (``puts``)
	203 MiB/s (3.58%)—Savings from not doing unnecessary formatting.
cbuf (``write`` with buffer size 8192)
	5.51 GiB/s (99.64%)—Extreme improvements from taking a leaf out of
	GNU yes's book—we write directly using buffer size of 8192.

Prerequisites
=============

* bash
* ghc
* gcc
* make
* pv
* yes (maybe)

.. |License: MIT| image:: https://img.shields.io/badge/License-MIT-yellow.svg
	:target: https://opensource.org/licenses/MIT
