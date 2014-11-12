# Compressed Magento 1.9 Sample Data

The following variations are available:

* 67M [compressed-magento-sample-data-1.9.0.0.tgz](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-magento-sample-data-1.9.0.0.tgz)
* 66M [compressed-magento-sample-data-1.9.0.0.tbz](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-magento-sample-data-1.9.0.0.tbz)
* 41M [compressed-magento-sample-data-1.9.0.0.tar.7z](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-magento-sample-data-1.9.0.0.tar.7z)

* 28M [compressed-no-mp3-magento-sample-data-1.9.0.0.tgz](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-no-mp3-magento-sample-data-1.9.0.0.tgz)
* 26M [compressed-no-mp3-magento-sample-data-1.9.0.0.tbz](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-no-mp3-magento-sample-data-1.9.0.0.tbz)
* 20M [compressed-no-mp3-magento-sample-data-1.9.0.0.tar.7z](https://raw.githubusercontent.com/Vinai/compressed-magento-sample-data/master/compressed-no-mp3-magento-sample-data-1.9.0.0.tar.7z)

Its kind of ridiculous having a sample data package that is 317MB in size, and since I couldn't find
a good alternative source, I decided to hack together a little script to compress the hell out of the images and the MP3 files
in the sample data archive.  
My intention is that it can be downloaded faster and used more easily.

With a image quality setting of 50% and by sampling all .mp3 files down to a bitrate of 48, the size of the sample data archive is reduced to a 66MB tbz.

The compression script in the src/ directory is intended to run on OS X. Feel free to use and modify it, but be aware that you are doing so at your own risk!

