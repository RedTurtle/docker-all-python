[![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/pantuza/python2.4/)

# Python 2.4.3 Docker image

This image is useful for running tests using docker on legacy Python 2.4
software

### How to use to launch old buildouts
```bash
$> cd folder_you_need_to_work_on
$> docker run -it -v "$(pwd)":/path/to_new_worrking_directory docker-python-2.4.3
```

### How to get `virtualenv` to work on python2.4
```bash
$> cd working_directory
$> python /etc/python2.4/virtualenv-1.7/virtualenv.py -p python 2.4
$> source bin/activate
```

NOTE: if for anny reason the above doesn't work, try the following:
```bash
$> wget -O virtualenv-1.7.tar.gz "https://files.pythonhosted.org/packages/bf/a0/45ecac80034dbc040fb4f5036f32cb40005df71e496ccd137eb65e5a69e6/virtualenv-1.7.tar.gz"
$> tar xfz virtualenv-1.7.tar.gz virtualenv-1.7
$> python virtualenv-1.7/virtualenv.py -p python2.4 .
$> source bin/activate
```
This should download ad extract the tar directly into your working directory.

### Basic Example

```bash
$> docker run --rm -it --name docker-python-2.4.3:latest                                                                 (master) 18:26:35
Python 2.4.3 (#1, Jan 19 2018, 20:23:57)
[GCC 4.8.5] on linux4
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

### Fork Author
Martina Bustacchini <martina.bustacchini@redturtle.it>

### Original Author
Gustavo Pantuza <gustavopantuza@gmail.com>
