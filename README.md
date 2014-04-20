# pyenv-which-ext

**Integrate pyenv and system commands.** This pyenv plugin automatically
lookup system command if the specified command has not been installed in
pyenv.

## Installation

Make sure you have pyenv 0.4.0 or later, then run:

    git clone https://github.com/yyuu/pyenv-which-ext.git ~/.pyenv/plugins/pyenv-which-ext

## Usage

Nothing have to do manually. Just installing the plugin lets pyenv to fallback to the `system` version.

## Examples

Let us say if you have 3 versions in pyenv.

```
$ pyenv versions
  system (set by /home/yyuu/.pyenv/version)
  3.4.0
  anaconda-1.9.2
```

If you use `anaconda-1.9.2`, you can use the `curl` installed in `anaconda-1.9.2`.

```
$ pyenv shell anaconda-1.9.2
$ pyenv which curl
/home/yyuu/.pyenv/versions/anaconda-1.9.2/bin/curl
```

Then, switch to the `3.4.0`. Without `pyenv-which-ext`, the pyenv refuses to execute the `curl` since it is not installed in `3.4.0`.

```
$ pyenv shell 3.4.0
$ pyenv which curl
pyenv: curl: command not found

The `curl' command exists in these Python versions:
  anaconda-1.9.2

```

So, it is the time to install `pyenv-which-ext`. This plugin lets pyenv to find the commands outside from pyenv if not found in current version(s).

```
$ pyenv shell 3.4.0
$ pyenv which curl
/usr/bin/curl
```

## History

**0.0.1** (Apr 20, 2014)

* Initial public release.
* Copied project from [rbenv-which-ext](https://github.com/yyuu/rbenv-which-ext), and modified for pyenv.

## License

(The MIT License)

Copyright (c) 2014 Yamashita, Yuu <<yamashita@geishatokyo.com>>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
