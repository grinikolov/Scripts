echo NGC 1754
cd /home/maya/Grigor/work/NGC1754 ;pwd ;ls
cp /home/maya/Grigor/work/NGC1754/datasets/*f.fits /home/maya/Grigor/work/NGC1754/reduced_hstphot
cd /home/maya/Grigor/work/NGC1754/reduced_hstphot ;pwd ;ls
sleep 10
echo Starting HSTphot script now
./NGC1754.script >log_hstphot.log
echo NGC 1754 Complete! Starting the next one: 
sleep 300

echo NGC 1835
cd /home/maya/Grigor/work/NGC1835 ;pwd ;ls
cp /home/maya/Grigor/work/NGC1835/datasets/*f.fits /home/maya/Grigor/work/NGC1835/reduced_hstphot
cd /home/maya/Grigor/work/NGC1835/reduced_hstphot ;pwd ;ls
sleep 10
echo Starting HSTphot script now
./NGC1835.script >log_hstphot.log
echo  NGC 1835 Complete! Starting the next one: 
sleep 300



echo NGC 1898
cd /home/maya/Grigor/work/NGC1898 ;pwd ;ls
cp /home/maya/Grigor/work/NGC1898/datasets/*f.fits /home/maya/Grigor/work/NGC1898/reduced_hstphot
cd /home/maya/Grigor/work/NGC1898/reduced_hstphot ;pwd ;ls
sleep 10
echo Starting HSTphot script now
./NGC1898.script >log_hstphot.log
echo  NGC 1898 Complete! Starting the next one: 
sleep 300



echo NGC 1916
cd /home/maya/Grigor/work/NGC1916 ;pwd ;ls
cp /home/maya/Grigor/work/NGC1916/datasets/*f.fits /home/maya/Grigor/work/NGC1916/reduced_hstphot
cd /home/maya/Grigor/work/NGC1916/reduced_hstphot ;pwd ;ls
sleep 10
echo Starting HSTphot script now
./NGC1916.script >log_hstphot.log
echo  NGC 1916  Complete! Starting the next one: 
sleep 300



echo NGC 2005
cd /home/maya/Grigor/work/NGC2005 ;pwd ;ls
cp /home/maya/Grigor/work/NGC2005/datasets/*f.fits /home/maya/Grigor/work/NGC2005/reduced_hstphot
cd /home/maya/Grigor/work/NGC2005/reduced_hstphot ;pwd ;ls
.sleep 10
echo Starting HSTphot script now
./NGC2005.script >log_hstphot.log
echo NGC 2005  Complete! All done.


