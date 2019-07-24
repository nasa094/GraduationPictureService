#!/bin/bash

#GraduationPictureService.sh will fetch back your graduation commencement pictures
#from website and export to you in jpg. To use it, simply by: `bash GraduationPictureService.sh`
#OS: Linux/Unix, with convert, wget installed


#    Copyright (C) 2013  Ethan W. castives@hotmail.com

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#	 Please do not use this program for any business purposes or any illegal purposes
#	 Any images this scripts might download is the propetry of the service provider

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see http://www.gnu.org/licenses/



declare url;

echo "Image Fetch Service Activated..."
echo ""
echo ""
echo "================================================="
echo "Please PASTE the URL that asking you to pay sixty five dollars"
echo "You can find the URL by going to the link they send you, and then click 'click to zoom in', Safari has problems displaying URL, if that happen try others"
echo "The URL looks like this:"
echo "http://images1.flashphotography.com/Magnifier/Magnify.aspx?O=10000001&R=00001&F=0001&A=1001"
echo "================================================="
echo ""
read  -p "Paste here:" url_ori
IFS='?' read -a array <<< "$url_ori"
url_base=`echo "${array[0]}"|sed 's/............$//'`




	
mkdir original
mkdir combined
for((x=57;x<=422;x=x+100))
do
	Exec_append="convert -append ";
	for((y=57;y<=568;y=y+100))
	do
		#echo $x" "$y;
		url="http://magnifier.flashphotography.com/MagnifyRender.ashx?X=$x&Y=$y&O=27066401&R=00001&F=0170&A=71714&rand=0.8515203305886416";
		echo $url;
		wget -O ./original/image_$x"_"$y.jpg "http://magnifier.flashphotography.com/MagnifyRender.ashx?X=$x&Y=$y&O=27066401&R=00001&F=0170&A=71714&rand=0.8515203305886416"
		convert -crop 100x100+36+36 ./original/image_$x"_"$y.jpg ./image_$x"_"$y.jpg
		#convert -crop -50-50 ./image_$x"_"$y.jpg ./image_$x"_"$y.jpg
		#Exec_append=$Exec_append"./image_$x"_"$y.jpg ";
	done
	#Exec_append=$Exec_append"./combined/"$x"_out.jpg";
	#eval $Exec_append;
done



echo "Finished Successfully!"
